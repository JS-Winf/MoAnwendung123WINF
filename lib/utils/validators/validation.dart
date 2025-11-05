class TValidator {
  // Prüft, ob ein Textfeld leer ist. Gibt eine Fehlermeldung zurück oder null (kein Fehler).
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.'; // Fehlermeldung mit Feldnamen
    }
    return null; // alles okay
  }

  // Prüft, ob eine gültige E-Mail eingegeben wurde.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.'; // Pflichtfeld-Fehler
    }

    // Einfache E-Mail-Regex: <name>@<domain>.<tld> mit 2–4 Zeichen TLD
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.'; // ungültiges Format
    }

    return null; // gültig
  }

  // Passwortregeln prüfen: Länge, Großbuchstabe, Zahl, Sonderzeichen.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.'; // Pflichtfeld-Fehler
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long.'; // Mindestlänge
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.'; // mind. 1 Großbuchstabe
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.'; // mind. 1 Ziffer
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.'; // mind. 1 Sonderzeichen
    }

    return null; // Passwort erfüllt alle Bedingungen
  }
}
