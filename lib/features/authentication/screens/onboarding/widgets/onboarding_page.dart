import 'package:hotshop/utils/constants/sizes.dart'; // App-weite Größen-/Abstands-Konstanten (z. B. defaultSpace, spaceBtwItems)
import 'package:hotshop/utils/helpers/helper_functions.dart'; // Hilfsfunktionen (z. B. Bildschirmbreite/-höhe)
import 'package:flutter/material.dart'; // Flutter Material-Widgets

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,   // Pfad zur Asset-Grafik
    required this.title,   // Überschrift des Onboarding-Screens
    required this.subtitle,// Untertitel/Beschreibung
  });

  // Übergabeparameter für den Inhalt der Seite
  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Einheitlicher Außenabstand rund um den Seiteninhalt
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          // Bildbereich: skaliert relativ zur Bildschirmgröße
          Image(
            width: THelperFunctions.screenWidth() * 0.8,   // 80% der Bildschirmbreite
            height: THelperFunctions.screenHeight() * 0.6, // 60% der Bildschirmhöhe
            image: AssetImage(image),                      // lädt ein lokales Asset-Bild
          ),
          // Titel im Headline-Stil des aktuellen Themes, zentriert
          Text(title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center),
          // Vertikaler Abstand zwischen Titel und Untertitel
          const SizedBox(height: TSizes.spaceBtwItems),
          // Untertitel im Body-Stil des Themes, ebenfalls zentriert
          Text(subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
