import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/app_bar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey)),
          Text(TTexts.homeAppbarSubtitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white)),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.shopping_bag,
                color: TColors.white)),
      ],
    );
  }

  Future<String> _getUserName() async {
    try {
      final authRepo = AuthenticationRepository.instance;
      final user = await authRepo.currentUser();
      
      print('DEBUG: User object: $user');
      print('DEBUG: User name: ${user?.name}');
      
      if (user != null && user.name != null) {
        final firstName = user.name!.split(' ').first;
        print('DEBUG: First name: $firstName');
        return firstName;
      }
      
      // Fallback for demo user
      final storage = authRepo.deviceStorage;
      final isDemoUser = storage.read('demoUser');
      print('DEBUG: Demo user: $isDemoUser');
      
      if (isDemoUser == true) {
        return 'Neele';
      }
      
      return 'Guest';
    } catch (e) {
      print('DEBUG: Error getting user name: $e');
      return 'Neele';
    }
  }
}
