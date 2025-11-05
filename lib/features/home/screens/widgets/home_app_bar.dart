import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/app_bar.dart'; // Custom AppBar Widget
import '../../../../utils/constants/colors.dart'; // Farbkonstanten
import '../../../../utils/constants/text_strings.dart'; // Textkonstanten

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      // Title-Bereich der AppBar → zeigt zwei Zeilen Text (Begrüßung)
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Text links ausrichten
        children: [
          // Kleine graue Begrüßungs-Überschrift
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey)),
          // Größerer weißer Text, z.B. der Name oder Subtitle
          Text(TTexts.homeAppbarSubtitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white)),
        ],
      ),

      // Symbolliste rechts in der AppBar
      actions: [
        IconButton(
            onPressed: () {}, // TODO: Öffnet später z.B. den Warenkorb
            icon: const Icon(
              Iconsax.shopping_bag, // Taschen-Symbol
              color: TColors.white, // Symbol weiß färben
            )),
      ],
    );
  }

  // Private Methode zum Abrufen des Usernamens (async)
  Future<String> _getUserName() async {
    try {
      final authRepo = AuthenticationRepository.instance; // Zugriff auf Auth-Repository
      final user = await authRepo.currentUser(); // Aktuell eingeloggten User laden
      
      // Debug-Ausgaben zur Kontrolle
      print('DEBUG: User object: $user');
      print('DEBUG: User name: ${user?.name}');
      
      if (user != null && user.name != null) {
        // Ersten Namensteil extrahieren (Vorname)
        final firstName = user.name!.split(' ').first;
        print('DEBUG: First name: $firstName');
        return firstName;
      }
      
      // Wenn kein echter User → Prüfe ob Demo User gespeichert ist
      final storage = authRepo.deviceStorage;
      final isDemoUser = storage.read('demoUser');
      print('DEBUG: Demo user: $isDemoUser');
      
      if (isDemoUser == true) {
        return 'Neele'; // Beispielname für Demo Benutzer
      }
      
      return 'Guest'; // Fallback Besuchername
    } catch (e) {
      // Fehlerbehandlung → ebenfalls Fallback Name
      print('DEBUG: Error getting user name: $e');
      return 'Neele';
    }
  }
}
