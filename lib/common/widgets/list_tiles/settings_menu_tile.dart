import 'package:hotshop/utils/constants/colors.dart';
import 'package:flutter/material.dart';

/// Einstellungs-Menüelement für die Settings-Seite.
/// Zeigt Icon, Titel, Untertitel und optional ein Trailing-Widget (z.B. Switch oder Pfeil).
class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile({
    super.key,
    required this.icon,        // Icon links
    required this.title,       // Haupttext
    required this.subtitle,    // Beschreibung/Untertext
    this.trailing,             // Optionales Widget rechts (z. B. Switch, Arrow)
    this.onTap,                // Tap-Aktion
  });

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: TColors.primary, // App-Primärfarbe für Icons
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium, // Größerer Titel-Text
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium, // Kleiner Untertitel-Text
      ),
      trailing: trailing, // Optionales Kontroll- oder Info-Element
      onTap: onTap,       // Klick-Handler (Navigation, Dialog, etc.)
    );
  }
}
