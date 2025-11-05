import 'package:hotshop/utils/constants/colors.dart';
import 'package:hotshop/utils/device/device_utility.dart';
import 'package:hotshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

/// Wiederverwendbare TabBar, die den Dark-/Light-Mode berücksichtigt
/// und eine bevorzugte Höhe (PreferredSizeWidget) für die Nutzung in AppBars hat.
class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs });

  /// Liste der Tab-Widgets (z. B. Text oder Icons), die angezeigt werden sollen.
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    // Prüft, ob das aktuelle Theme dunkel ist, um Farben entsprechend zu setzen.
    final dark = THelperFunctions.isDarkMode(context);

    return Material(
      // Hintergrundfarbe abhängig vom Theme.
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
        tabs: tabs,                    // Übergebene Tabs
        isScrollable: true,            // Tabs können horizontal gescrollt werden
        indicatorColor: TColors.primary,          // Farbe des aktiven Indikators unter dem Tab
        labelColor: dark ? TColors.white : TColors.primary, // Farbe des aktiven Tab-Labels
        unselectedLabelColor: TColors.darkGrey,   // Farbe der inaktiven Tab-Labels
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        // Höhe der TabBar, an die AppBar-Höhe angelehnt.
        TDeviceUtils.getAppBarHeight(),
      );
}
