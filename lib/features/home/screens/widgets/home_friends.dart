import 'package:flutter/material.dart';

import '../../../../common/widgets/texts/vertical_image_text.dart'; // Custom-Widget: Bild oben, Text unten, vertikal ausgerichtet
import '../../../../utils/constants/image_strings.dart'; // Asset-Pfade (z. B. TImages.sportIcon)

class THomeFriends extends StatelessWidget {
  const THomeFriends({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // Fixe Höhe für die horizontale Liste
      child: ListView.builder(
          shrinkWrap: true, // Inhalte nur so groß wie nötig rendern
          itemCount: 6, // Anzahl der angezeigten Elemente
          scrollDirection: Axis.horizontal, // Horizontal scrollbare Liste
          itemBuilder: (_, index) {
            // Einzelnes Item: vertikales Bild+Text-Widget
            return TVerticalImageText(
              image: TImages.sportIcon, // Icon/Asset für das Item
              title: 'Shoes',           // Beschriftung unter dem Bild
              onTap: () {},             // Tap-Callback (aktuell ohne Funktion)
            );
          }),
    );
  }
}
