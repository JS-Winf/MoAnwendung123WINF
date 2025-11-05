import 'package:hotshop/utils/constants/colors.dart';
import 'package:hotshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Universelles Loader-/Empty-State-Widget mit Lottie-Animation,
/// Beschreibungstext und optionaler Aktion (Button).
class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    required this.text,            // Beschreibungstext unter der Animation
    required this.animation,       // Pfad zur Lottie-JSON (Asset)
    this.showAction = false,       // Optionalen Button anzeigen?
    this.actionText,               // Text des Buttons (nur wenn showAction=true)
    this.onActionPressed,          // Callback beim Button-Tap
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Zentriert vertikal
        children: [
          // Lottie-Animation nimmt ~80% der Bildschirmbreite ein.
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
          ),

          const SizedBox(height: TSizes.defaultSpace),

          // Beschreibungstext unter der Animation.
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: TSizes.defaultSpace),

          // Optionaler Aktions-Button (z. B. "Erneut versuchen").
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: TColors.dark, // dunkler Hintergrund
                    ),
                    child: Text(
                      actionText!, // Hinweis: wird nur genutzt, wenn showAction=true
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: TColors.light),
                    ),
                  ),
                )
              : const SizedBox(), // Platzhalter, wenn keine Aktion angezeigt wird.
        ],
      ),
    );
  }
}
