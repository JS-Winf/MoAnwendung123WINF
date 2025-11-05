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

/// Profilseite:
/// - Zeigt Profilbild und grundlegende/ persönliche Informationen
/// - Felder (Telefon, Geschlecht, Geburtstag) können per Dialog editiert werden
/// - Mehrsprachige Texte via LanguageController / AppStrings
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  /// Öffnet passendes Edit-UI je nach Feldtitel:
  /// - Geschlecht → Auswahl-Dialog
  /// - Geburtstag → DatePicker
  /// - Sonst → generisches Textfeld im AlertDialog
  void _editField(BuildContext context, String title, String currentValue) {
    if (title == AppStrings.gender) {
      _showGenderDialog(context);
      return;
    }
    
    if (title == AppStrings.dateOfBirth) {
      _showDatePicker(context);
      return;
    }
    
    // Generischer Edit-Dialog mit TextField
    final controller = TextEditingController(
      text: currentValue == AppStrings.noInformation ? '' : currentValue,
    );
    
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
              // Hier nur Demo: Speichern wird per Snackbar quittiert
              Get.snackbar('Info', 'Änderung gespeichert: ${controller.text}');
              Navigator.pop(context);
            },
            child: Text('Speichern'),
          ),
        ],
      ),
    );
  }
  
  /// Öffnet einen DatePicker zur Auswahl des Geburtstags
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
  
  /// Auswahl-Dialog für Geschlecht (Male / Female / Diverse)
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
      // AppBar mit Zurück-Pfeil und lokalisiertem Titel
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
                    // Profilbild aus dem aktuellen Userprofil (FutureBuilder)
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
                    // Button zum Ändern des Profilbilds (noch ohne Aktion)
                    TextButton(
                      onPressed: () {},
                      child: GetBuilder<LanguageController>(
                        builder: (_) => Text(AppStrings.changeProfilePicture),
                      ),
                    ),
                  ],
                ),
              ),

              /* Trenner */
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /* Überschrift: Profil-Informationen */
              GetBuilder<LanguageController>(
                builder: (_) => TSectionHeading(
                  title: AppStrings.profileInformation,
                  showActionButton: false,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Name & E-Mail aus dem Profil (mit Demo-Fallbacks)
              FutureBuilder(
                future: AuthenticationRepository.instance.currentUser(),
                builder: (context, snapshot) {
                  final user = snapshot.data;
                  final storage = AuthenticationRepository.instance.deviceStorage;
                  final isDemoUser = storage.read('demoUser') == true;
                  
                  final userName = user?.name ?? user?.nickname ?? (isDemoUser ? 'Demo User' : 'HotShop User');
                  final userEmail = user?.email ?? (isDemoUser ? 'demo@test.com' : 'user@hotshop.com');
                  
                  return GetBuilder<LanguageController>(
                    builder: (_) => Column(
                      children: [
                        // Noch ohne Edit-Action
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

              /* Überschrift: Persönliche Informationen */
              GetBuilder<LanguageController>(
                builder: (_) => TSectionHeading(
                  title: AppStrings.personalInformation,
                  showActionButton: false,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // UserId, Telefon, Geschlecht, Geburtstag (teilweise editierbar)
              FutureBuilder(
                future: AuthenticationRepository.instance.currentUser(),
                builder: (context, snapshot) {
                  final user = snapshot.data;
                  final storage = AuthenticationRepository.instance.deviceStorage;
                  final isDemoUser = storage.read('demoUser') == true;
                  
                  final userId = user?.sub ?? (isDemoUser ? 'demo|12345' : 'auth0|unknown');
                  final userPhone = user?.phoneNumber ?? AppStrings.noInformation;
                  final userGender = user?.gender ?? AppStrings.noInformation;
                  final userBirthdate = user?.birthdate ?? AppStrings.noInformation;
                  
                  return GetBuilder<LanguageController>(
                    builder: (_) => Column(
                      children: [
                        // User-ID (Icon: Kopieren — Aktion aktuell leer)
                        TProfileMenu(title: AppStrings.userId, value: userId, icon: Icons.copy, onPressed: (){}),

                        // Telefon: öffnet generischen Edit-Dialog
                        TProfileMenu(
                          title: AppStrings.phoneNumber, 
                          value: userPhone, 
                          onPressed: () => _editField(context, AppStrings.phoneNumber, userPhone),
                        ),

                        // Geschlecht: öffnet Auswahl-Dialog
                        TProfileMenu(
                          title: AppStrings.gender, 
                          value: userGender, 
                          onPressed: () => _editField(context, AppStrings.gender, userGender),
                        ),

                        // Geburtstag: öffnet DatePicker
                        TProfileMenu(
                          title: AppStrings.dateOfBirth, 
                          value: userBirthdate, 
                          onPressed: () => _editField(context, AppStrings.dateOfBirth, userBirthdate),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              /* Konto löschen (nur Button mit roter Schrift; noch ohne Aktion) */
              Center(
                child: TextButton(
                  onPressed: (){},
                  child: GetBuilder<LanguageController>(
                    builder: (_) => Text(
                      AppStrings.deleteAccount,
                      style: TextStyle(color: Colors.red),
                    ),
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
