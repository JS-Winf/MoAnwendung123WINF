import 'package:flutter/material.dart';

/// CustomClipper, der eine geschwungene Unterkante erzeugt.
/// Die Kurve wird mit mehreren quadratischen Bézier-Segmenten aufgebaut.
class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Start links oben (0,0) und Linie bis links unten.
    path.lineTo(0, size.height);

    // 1. Bézier-Segment: kleiner Bogen von links unten leicht nach rechts oben.
    final firstCurve = Offset(0, size.height - 20);   // Kontrollpunkt
    final lastCurve = Offset(30, size.height - 20);   // Endpunkt
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    // 2. Bézier-Segment: lange, fast horizontale Kurve bis kurz vor die rechte Seite.
    final secondFirstCurve = Offset(0, size.height - 20);              // Kontrollpunkt
    final secondLastCurve = Offset(size.width - 30, size.height - 20); // Endpunkt
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy, secondLastCurve.dx, secondLastCurve.dy);

    // 3. Bézier-Segment: kleiner Schlussbogen an die rechte Kante nach unten.
    final thirdFirstCurve = Offset(size.width, size.height - 20); // Kontrollpunkt
    final thirdLastCurve = Offset(size.width, size.height);       // Endpunkt (rechte untere Ecke)
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy, thirdLastCurve.dx, thirdLastCurve.dy);

    // Von rechts unten nach rechts oben, dann schließen.
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // Bei jeder Änderung erneut clippen (immer neu zeichnen).
    return true;
  }
}
