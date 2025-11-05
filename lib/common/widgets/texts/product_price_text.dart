import 'package:flutter/material.dart';

/// Anzeige für Produktpreis.
/// Unterstützt:
/// - Währungssymbol
/// - verschiedene Textgrößen (normal / groß)
/// - optional durchgestrichenen Preis (für Rabatte)
class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    this.currencySign = '\$',      // Standard-Währungssymbol (Dollar)
    required this.price,           // Preis als Text (String)
    this.isLarge = false,          // Größere Darstellung aktiv?
    this.maxLines = 1,             // Max. Zeilenzahl
    this.lineThrough = false,      // Durchgestrichen? (z. B. Originalpreis bei Rabatt)
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,                        // Preistext inkl. Währung
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,             // Kürzen mit "…" falls zu lang
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null,
            )
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null,
            ),
    );
  }
}
