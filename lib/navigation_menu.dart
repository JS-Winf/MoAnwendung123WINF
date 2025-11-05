import 'package:hotshop/features/whishlist/screens/wishlist.dart';
import 'package:hotshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/account/screens/settings/settings.dart';
import 'features/home/screens/home.dart';
import 'features/store/screens/store.dart';
import 'utils/constants/colors.dart';
import 'utils/constants/app_strings.dart';
import 'utils/constants/language_controller.dart';

/// Root-Widget für die Hauptnavigation der App.
/// Nutzt GetX für State-Management (NavigationController & LanguageController)
/// sowie Flutter's Material3 NavigationBar als Bottom-Navigation.
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // Registriert/holt den NavigationController via GetX (singleton im DI-Container).
    final controller = Get.put(NavigationController());
    // Registriert/holt den LanguageController für dynamische Labels.
    final languageController = Get.put(LanguageController());
    // Ermittelt, ob der aktuelle Kontext im Dark Mode ist (für Farben der Bottom-Bar).
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      // Bottom-Navigation mit reaktiver Aktualisierung via Obx (hört auf selectedIndex).
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          // Aktiver Tab-Index kommt aus dem Rx<int> im Controller.
          selectedIndex: controller.selectedIndex.value,
          // Beim Tippen wird der Index aktualisiert -> triggert Obx/Body neu.
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          // Farben abhängig vom Dark-/Light-Mode.
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          // Navigationsziele; Labels reagieren auf Sprachwechsel via GetBuilder.
          destinations: [
            GetBuilder<LanguageController>(
              builder: (_) => NavigationDestination(
                icon: Icon(Iconsax.home),
                label: AppStrings.home, // z. B. "Home" / sprachabhängig
              ),
            ),
            GetBuilder<LanguageController>(
              builder: (_) => NavigationDestination(
                icon: Icon(Iconsax.shop),
                label: AppStrings.store, // z. B. "Store"
              ),
            ),
            GetBuilder<LanguageController>(
              builder: (_) => NavigationDestination(
                icon: Icon(Iconsax.heart),
                label: AppStrings.wishlist, // z. B. "Wunschliste"
              ),
            ),
            GetBuilder<LanguageController>(
              builder: (_) => NavigationDestination(
                icon: Icon(Iconsax.user),
                label: AppStrings.profile, // z. B. "Profil"
              ),
            ),
          ],
        ),
      ),
      // Body-Bereich wechselt die aktuelle Seite passend zum ausgewählten Index.
      // AnimatedSwitcher sorgt für einen weichen Übergang (300ms).
      body: Obx(() => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            // Zeigt das Widget an, das dem aktuellen Tab entspricht.
            child: controller.screens[controller.selectedIndex.value],
          )),
    );
  }
}

/// Controller für die Navigation (GetX).
/// Hält den reaktiven Tab-Index und die zugehörigen Screens.
class NavigationController extends GetxController {
  // Reaktiver Index des selektierten Tabs (Start: 0).
  final Rx<int> selectedIndex = 0.obs;

  // Reihenfolge der Screens entspricht der Reihenfolge der NavigationDestination-Einträge.
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen()
  ];
}
