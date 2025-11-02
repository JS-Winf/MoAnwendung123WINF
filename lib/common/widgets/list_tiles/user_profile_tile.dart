import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../images/circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
    required this.onPressed
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthenticationRepository.instance.currentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListTile(
            leading: const TCircularImage(
              image: TImages.user,
              width: 50,
              height: 50,
              padding: 0,
            ),
            title: Text('Loading...', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
            subtitle: Text('Loading...', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
            trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white)),
          );
        }
        
        final user = snapshot.data;
        final userName = user?.name ?? user?.nickname ?? 'HotShop User';
        final userEmail = user?.email ?? 'user@hotshop.com';
        final profilePicture = user?.pictureUrl?.toString() ?? TImages.user;
        final isNetworkImage = user?.pictureUrl != null;
        
        return ListTile(
          leading: TCircularImage(
            image: profilePicture,
            width: 50,
            height: 50,
            padding: 0,
            isNetworkImage: isNetworkImage,
          ),
          title: Text(userName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
          subtitle: Text(userEmail, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
          trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white)),
        );
      },
    );
  }
}
