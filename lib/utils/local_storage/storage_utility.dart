import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  // Singleton-Instanz (Lazy globaler Zugriff über Factory)
  static final TLocalStorage _instance = TLocalStorage._internal();

  // Öffentlicher Factory-Konstruktor gibt immer die gleiche Instanz zurück
  factory TLocalStorage() {
    return _instance;
  }

  // Privater Named-Konstruktor für das Singleton
  TLocalStorage._internal();

  // GetStorage-Box (Key-Value-Speicher auf dem Gerät)
  final _storage = GetStorage();

  // Speichert einen Wert (beliebiger Typ) unter einem Schlüssel
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Liest einen Wert (optional, null wenn nicht vorhanden) aus dem Speicher
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Entfernt einen Eintrag zu einem Schlüssel
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Löscht den gesamten lokalen Speicher (alle Keys/Werte)
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
