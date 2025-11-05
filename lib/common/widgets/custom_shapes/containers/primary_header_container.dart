import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

/// Header-Container mit Primärfarbe und dekorativen, gebogenen Kanten.
/// Nutzt zwei halb-transparente, große Kreisflächen als Deko im Hintergrund.
class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  /// Inhalt, der im Header angezeigt wird (z. B. Titel, Suchfeld, etc.).
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      // TCurvedEdgesWidget sorgt für die gebogenen Kanten am unteren Rand.
      child: Container(
        color: TColors.primary, // Primärfarbiger Hintergrund für den Header
        child: Stack(
          children: [
            // Dekorative, große Kreise oben/rechts außerhalb des sichtbaren Bereichs
            // für einen dezenten, überlappenden Glow-Effekt.
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),

            // Eigentliche Inhalte des Headers (wird über den Deko-Elementen gerendert).
            child,
          ],
        ),
      ),
    );
  }
}
