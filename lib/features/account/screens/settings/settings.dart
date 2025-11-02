import 'package:hotshop/common/widgets/images/circular_image.dart';
import 'package:hotshop/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:hotshop/common/widgets/texts/section_heading.dart';
import 'package:hotshop/data/repositories/authentication/authentication_repository.dart';
import 'package:hotshop/features/account/screens/profile/profile.dart';
import 'package:hotshop/utils/constants/image_strings.dart';
import 'package:hotshop/utils/constants/app_strings.dart';
import 'package:hotshop/utils/constants/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/app_bar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /* Header */
            TPrimaryHeaderContainer(child: Column(
              children: [
                GetBuilder<LanguageController>(
                  builder: (_) => TAppBar(title: Text(AppStrings.account, style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),
                ),

                /* User Profile Card */
                TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen()),),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            )),

            /* Menu */
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /* Account settings */
                  GetBuilder<LanguageController>(
                    builder: (_) => TSectionHeading(title: AppStrings.accountSettings, showActionButton: false),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  
                  GetBuilder<LanguageController>(
                    builder: (_) => Column(
                      children: [
                        TSettingsMenuTile(icon: Iconsax.safe_home, title: AppStrings.myAddresses, subtitle: AppStrings.setShoppingDeliveryAddress),
                        TSettingsMenuTile(icon: Iconsax.shopping_cart, title: AppStrings.myCart, subtitle: AppStrings.addRemoveProductsCheckout),
                        TSettingsMenuTile(icon: Iconsax.bag_tick, title: AppStrings.myOrders, subtitle: AppStrings.inProgressCompletedOrders),
                        TSettingsMenuTile(icon: Iconsax.bank, title: AppStrings.bankAccount, subtitle: AppStrings.withdrawBalanceBank),
                        TSettingsMenuTile(icon: Iconsax.discount_shape, title: AppStrings.myCoupons, subtitle: AppStrings.listDiscountedCoupons),
                        TSettingsMenuTile(icon: Iconsax.notification, title: AppStrings.notifications, subtitle: AppStrings.setNotificationMessages),
                        TSettingsMenuTile(icon: Iconsax.security_card, title: AppStrings.accountPrivacy, subtitle: AppStrings.manageDataUsageAccounts),
                      ],
                    ),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                  GetBuilder<LanguageController>(
                    builder: (_) => TSectionHeading(title: AppStrings.appSettings, showActionButton: false),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  GetBuilder<LanguageController>(
                    builder: (_) => Column(
                      children: [
                        TSettingsMenuTile(icon: Iconsax.document_upload, title: AppStrings.loadData, subtitle: AppStrings.uploadDataCloudFirebase),
                        TSettingsMenuTile(icon: Iconsax.location, title: AppStrings.geolocation, subtitle: AppStrings.setRecommendationLocation, trailing: Switch(value: true, onChanged: (value) {})),
                        TSettingsMenuTile(icon: Iconsax.security_user, title: AppStrings.safeMode, subtitle: AppStrings.searchResultsSafeAllAges, trailing: Switch(value: false, onChanged: (value) {})),
                        TSettingsMenuTile(icon: Iconsax.image, title: AppStrings.hdImageQuality, subtitle: AppStrings.setImageQualitySeen, trailing: Switch(value: false, onChanged: (value) {})),
                        TSettingsMenuTile(
                          icon: Icons.dark_mode, 
                          title: AppStrings.darkMode, 
                          subtitle: AppStrings.switchLightDarkTheme, 
                          trailing: Switch(
                            value: Get.isDarkMode, 
                            onChanged: (value) {
                              Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
                            }
                          )
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<LanguageController>(
                    builder: (controller) => TSettingsMenuTile(
                      icon: Icons.language, 
                      title: 'Deutsch', 
                      subtitle: AppStrings.useGermanLanguage, 
                      trailing: Switch(
                        value: controller.isGerman.value, 
                        onChanged: (value) {
                          controller.toggleLanguage(value);
                          Get.snackbar('Sprache', value ? 'Deutsch aktiviert' : 'English activated');
                        }
                      )
                    ),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<LanguageController>(
                      builder: (_) => OutlinedButton(onPressed: () async => await AuthenticationRepository.instance.logout(), child: Text(AppStrings.logout)),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}


