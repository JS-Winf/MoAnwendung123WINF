import 'package:flutter/material.dart';

/// Überschriftszeile für Abschnitte mit optionalem "Alle anzeigen"-Button.
/// Links: Titel (einzeilig mit Ellipsis), rechts: optionaler Action-Button.
class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.onPressed,                    // Callback für den Button rechts
    this.textColor,                    // Optionale Titelfarbe
    this.buttonTitle = 'View all',     // Beschriftung des Buttons
    required this.title,               // Abschnittstitel
    this.showActionButton = true,      // Button anzeigen/verbergen
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Titel links, Button rechts
      children: [
        // Abschnittstitel, auf eine Zeile begrenzt und mit Ellipsis bei Überlänge.
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        // Optionaler "View all"-Button (nur rendern, wenn aktiviert).
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            child: Text(buttonTitle),
          ),
      ],
    );
  }
}
