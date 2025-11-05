import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunctions {
  // Gibt zu einem Farbnamen (String) die passende Color zurück.
  // Hinweis: 'Green' ist hier doppelt abgefragt – funktional egal, aber redundant.
  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') { // doppelt
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return const Color(0xFF764ba2);
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else {
      return null; // unbekannter Farbname
    }
  }

  // Zeigt eine Snackbar mit Text an (verwendet globales Get.context!)
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // Zeigt einen einfachen AlertDialog mit OK-Button
  static void showAlert(String title, String message) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  // Navigiert per push zu einem neuen Screen (MaterialRoute)
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  // Kürzt einen String auf maxLength und hängt "..." an (falls nötig)
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  // Prüft, ob aktuelles Theme im Dark Mode ist
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // Liefert die Bildschirmgröße über Get.context
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  // Bildschirmhöhe über Get.context
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  // Bildschirmbreite über Get.context
  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  // Formatiert ein Datum nach frei wählbarem Muster (default: 'dd MMM yyyy')
  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  // Entfernt Duplikate aus einer Liste (nutzt Set)
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  // Packt Widgets in Zeilen zu je rowSize Elementen (einfache Wrap-Logik)
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
