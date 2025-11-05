import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

/// Eigene AppBar-Komponente mit optionalem Back-Arrow oder benutzerdefiniertem Leading-Icon.
/// Implementiert PreferredSizeWidget, damit sie wie eine normale AppBar in Scaffold verwendet werden kann.
class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
  });

  /// Titel-Widget (z. B. Text, Logo, etc.)
  final Widget? title;

  /// Wenn true, wird ein Zurück-Pfeil angezeigt, der via Get.back() die vorherige Route schließt.
  final bool showBackArrow;

  /// Optionales Icon für den Leading-Bereich, falls kein Back-Arrow gezeigt werden soll.
  final IconData? leadingIcon;

  /// Optionale Aktions-Widgets rechts (z. B. Buttons, Menüs).
  final List<Widget>? actions;

  /// Callback für das optionale Leading-Icon.
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Horizontaler Außenabstand für die AppBar (optische Einrückung).
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        // Unterdrückt das automatische Einfügen eines Standard-Leading-Widgets.
        automaticallyImplyLeading: false,

        // Leading-Logik:
        // 1) Wenn showBackArrow true -> Back-Button, der Get.back() aufruft.
        // 2) Sonst: falls leadingIcon gesetzt -> IconButton mit custom Callback.
        // 3) Andernfalls: kein Leading-Widget.
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left),
              )
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed,
                    icon: Icon(leadingIcon),
                  )
                : null,

        // Titel & Aktionen werden direkt durchgereicht.
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        // Höhe der AppBar wird über eine Utility-Funktion bestimmt,
        // damit sie konsistent zur restlichen App ist.
        TDeviceUtils.getAppBarHeight(),
      );
}
