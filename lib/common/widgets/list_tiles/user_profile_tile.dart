import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../features/account/controllers/user_controller.dart';
import '../images/circular_image.dart';

/// Profil-Kachel für den Nutzerbereich:
/// - Zeigt Avatar, Name, E-Mail
/// - Rechts ein Edit-Icon (onPressed)
/// - Reaktiv via GetX: lädt/aktualisiert automatisch mit Obx()
class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed
  });

  /// Aktion beim Tippen auf das Stift-/Bearbeiten-Icon.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // Registriert/Holt den UserController (GetX DI/Singleton).
    final controller = Get.put(UserController());
    
    return Obx(() {
      // Ladezustand: Platzhalter-UI mit Default-Avatar & "Loading..."-Texten.
      if (controller.isLoading.value) {
        return ListTile(
          leading: const TCircularImage(
            image: TImages.user,
            width: 50,
            height: 50,
            padding: 0,
          ),
          title: Text(
            'Loading...',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          ),
          subtitle: Text(
            'Loading...',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: TColors.white),
          ),
          trailing: IconButton(
            onPressed: onPressed,
            icon: const Icon(Iconsax.edit, color: TColors.white),
          ),
        );
      }
      
      // Wenn Daten vorhanden: Bildquelle bestimmen (Netzwerk oder Asset).
      final profilePicture =
          controller.user.value?.pictureUrl?.toString() ?? TImages.user;
      final isNetworkImage = controller.user.value?.pictureUrl != null;
      
      // Gefüllter Zustand: Avatar, Name & E-Mail anzeigen.
      return ListTile(
        leading: TCircularImage(
          image: profilePicture,
          width: 50,
          height: 50,
          padding: 0,
          isNetworkImage: isNetworkImage,
        ),
        title: Text(
          controller.userName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white),
        ),
        subtitle: Text(
          controller.userEmail,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.edit, color: TColors.white),
        ),
      );
    });
  }
}
