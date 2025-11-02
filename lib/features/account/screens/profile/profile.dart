import 'package:hotshop/common/widgets/appbar/app_bar.dart';
import 'package:hotshop/common/widgets/images/circular_image.dart';
import 'package:hotshop/common/widgets/texts/section_heading.dart';
import 'package:hotshop/utils/constants/image_strings.dart';
import 'package:hotshop/utils/constants/sizes.dart';
import 'package:hotshop/utils/constants/app_strings.dart';
import 'package:hotshop/utils/constants/language_controller.dart';
import 'package:hotshop/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _editField(BuildContext context, String title, String currentValue) {
    if (title == AppStrings.gender) {
      _showGenderDialog(context);
      return;
    }
    
    if (title == AppStrings.dateOfBirth) {
      _showDatePicker(context);
      return;
    }
    
    final controller = TextEditingController(text: currentValue == AppStrings.noInformation ? '' : currentValue);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$title bearbeiten'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: title,
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Abbrechen'),
          ),
          TextButton(
            onPressed: () {
              Get.snackbar('Info', 'Änderung gespeichert: ${controller.text}');
              Navigator.pop(context);
            },
            child: Text('Speichern'),
          ),
        ],
      ),
    );
  }
  
  void _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1990, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    
    if (picked != null) {
      final formattedDate = '${picked.day}.${picked.month}.${picked.year}';
      Get.snackbar('Info', 'Änderung gespeichert: $formattedDate');
    }
  }
  
  void _showGenderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${AppStrings.gender} wählen'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(AppStrings.male),
              onTap: () {
                Get.snackbar('Info', 'Änderung gespeichert: ${AppStrings.male}');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(AppStrings.female),
              onTap: () {
                Get.snackbar('Info', 'Änderung gespeichert: ${AppStrings.female}');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(AppStrings.diverse),
              onTap: () {
                Get.snackbar('Info', 'Änderung gespeichert: ${AppStrings.diverse}');
                Navigator.pop(context);
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Abbrechen'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: GetBuilder<LanguageController>(
          builder: (_) => Text(AppStrings.profile),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
            /* Profile Picture */
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    FutureBuilder(
                      future: AuthenticationRepository.instance.currentUser(),
                      builder: (context, snapshot) {
                        final user = snapshot.data;
                        final profilePicture = user?.pictureUrl?.toString() ?? TImages.user;
                        final isNetworkImage = user?.pictureUrl != null;
                        
                        return TCircularImage(
                          image: profilePicture,
                          width: 80,
                          height: 80,
                          isNetworkImage: isNetworkImage,
                        );
                      },
                    ),
                    TextButton(
                        onPressed: () {},
                        child: GetBuilder<LanguageController>(
                          builder: (_) => Text(AppStrings.changeProfilePicture),
                        )),
                  ],
                ),
              ),

              /* Details */
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /* Heading Profile Info */
              GetBuilder<LanguageController>(
                builder: (_) => TSectionHeading(title: AppStrings.profileInformation, showActionButton: false),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              FutureBuilder(
                future: AuthenticationRepository.instance.currentUser(),
                builder: (context, snapshot) {
                  final user = snapshot.data;
                  final userName = user?.name ?? user?.nickname ?? 'HotShop User';
                  final userEmail = user?.email ?? 'user@hotshop.com';
                  
                  return GetBuilder<LanguageController>(
                    builder: (_) => Column(
                      children: [
                        TProfileMenu(title: AppStrings.name, value: userName, onPressed: (){}),
                        TProfileMenu(title: AppStrings.email, value: userEmail, onPressed: (){}),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /* Heading Personal Info */
              GetBuilder<LanguageController>(
                builder: (_) => TSectionHeading(title: AppStrings.personalInformation, showActionButton: false),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              FutureBuilder(
                future: AuthenticationRepository.instance.currentUser(),
                builder: (context, snapshot) {
                  final user = snapshot.data;
                  final userId = user?.sub ?? 'auth0|unknown';
                  
                  return GetBuilder<LanguageController>(
                    builder: (_) => TProfileMenu(title: AppStrings.userId, value: userId, icon: Icons.copy, onPressed: (){}),
                  );
                },
              ),
              FutureBuilder(
                future: AuthenticationRepository.instance.currentUser(),
                builder: (context, snapshot) {
                  final user = snapshot.data;
                  final userPhone = user?.phoneNumber ?? AppStrings.noInformation;
                  final userGender = user?.gender ?? AppStrings.noInformation;
                  final userBirthdate = user?.birthdate ?? AppStrings.noInformation;
                  
                  return GetBuilder<LanguageController>(
                    builder: (_) => Column(
                      children: [
                        TProfileMenu(
                          title: AppStrings.phoneNumber, 
                          value: userPhone, 
                          onPressed: () => _editField(context, AppStrings.phoneNumber, userPhone)
                        ),
                        TProfileMenu(
                          title: AppStrings.gender, 
                          value: userGender, 
                          onPressed: () => _editField(context, AppStrings.gender, userGender)
                        ),
                        TProfileMenu(
                          title: AppStrings.dateOfBirth, 
                          value: userBirthdate, 
                          onPressed: () => _editField(context, AppStrings.dateOfBirth, userBirthdate)
                        ),
                      ],
                    ),
                  );
                },
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: (){},
                  child: GetBuilder<LanguageController>(
                    builder: (_) => Text(AppStrings.deleteAccount, style: TextStyle(color: Colors.red)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
