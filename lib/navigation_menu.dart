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

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final languageController = Get.put(LanguageController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          destinations: [
            GetBuilder<LanguageController>(
              builder: (_) => NavigationDestination(icon: Icon(Iconsax.home), label: AppStrings.home),
            ),
            GetBuilder<LanguageController>(
              builder: (_) => NavigationDestination(icon: Icon(Iconsax.shop), label: AppStrings.store),
            ),
            GetBuilder<LanguageController>(
              builder: (_) => NavigationDestination(icon: Icon(Iconsax.heart), label: AppStrings.wishlist),
            ),
            GetBuilder<LanguageController>(
              builder: (_) => NavigationDestination(icon: Icon(Iconsax.user), label: AppStrings.profile),
            ),
          ],
        ),
      ),
      body: Obx(() => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: controller.screens[controller.selectedIndex.value],
      )),
    );
  }
}


class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomeScreen(), const StoreScreen(), const FavouriteScreen(), const SettingsScreen()];
}
