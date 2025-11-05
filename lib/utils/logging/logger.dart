import 'package:logger/logger.dart';

class TLoggerHelper {
  // Erstellt eine Logger-Instanz mit PrettyPrinter für formatierte Logs
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),  // Formatiert Logs lesbar im Terminal
    level: Level.debug,        // Setzt das Log-Level (debug = alles anzeigen)
  );

  // Debug-Nachricht loggen (für Entwicklungsphase)
  static void debug(String message) {
    _logger.d(message);
  }

  // Info-Nachricht loggen (nützlich für Status-Meldungen)
  static void info(String message) {
    _logger.i(message);
  }

  // Warnung loggen (kein Fehler, aber potenzielles Problem)
  static void warning(String message) {
    _logger.w(message);
  }

  // Fehler loggen (inkl. Stacktrace wenn vorhanden)
  static void error(String message, [dynamic error]) {
    _logger.e(
      message,
      error: error,
      stackTrace: StackTrace.current,  // Gibt den aktuellen Code-Pfad mit aus
    );
  }
}
