import 'package:intl/intl.dart';

class TFormatter {
  // Formatiert ein Datum im Format TT.MM.JJJJ
  // Falls kein Datum übergeben wird -> aktuelles Datum verwenden
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd.MM.yyyy').format(date);
  }

  // Formatiert eine Zahl als Währung (mit deutschem Zahlenformat)
  // locale: 'de_DE' → Dezimal-Komma, Tausenderpunkte
  // symbol: '\$' → USD-Symbol beibehalten, aber deutsches Format verwenden
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'de_DE', symbol: '\$').format(amount);
  }
}
