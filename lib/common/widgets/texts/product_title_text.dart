import 'package:flutter/material.dart';

/// Titel-Text für Produkte mit optional kleinerer Variante.
/// Begrenzt die Zeilenanzahl und kürzt mit Ellipsis bei Überlänge.
class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key,
    required this.title,                // Anzuzeigender Produkttitel
    this.smallSize = false,             // Kleinere Typografie verwenden?
    this.maxLines = 2,                  // Max. Zeilenzahl
    this.textAlign = TextAlign.left,    // Textausrichtung
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      // Wähle TextStyle je nach smallSize-Flag aus dem aktuellen Theme.
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,  // Langes Textende mit "…"
      maxLines: maxLines,               // Zeilenlimit
      textAlign: textAlign,             // Ausrichtung
    );
  }
}
