import 'package:flutter/material.dart';

import '../../../../common/widgets/texts/vertical_image_text.dart';
import '../../../../utils/constants/image_strings.dart';

class THomeFriends extends StatelessWidget {
  const THomeFriends({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TVerticalImageText(image: TImages.sportIcon, title: 'Shoes', onTap: (){});
          }),
    );
  }
}
