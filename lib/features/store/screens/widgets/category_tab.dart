import 'package:hotshop/common/widgets/layout/grid_layout.dart'; // Allgemeines Grid-Layout-Widget (Wrapper um GridView)
import 'package:hotshop/common/widgets/products/product_cards/product_card_vertical.dart'; // Produktkarte im Hochformat
import 'package:hotshop/common/widgets/texts/section_heading.dart'; // Überschrift mit optionaler Action
import 'package:flutter/material.dart';

import '../../../../common/widgets/brands/brand_showcase.dart'; // horizontale/visuelle Markenpräsentation
import '../../../../utils/constants/image_strings.dart'; // Bild-Asset-Konstanten
import '../../../../utils/constants/sizes.dart'; // Abstands-/Größenkonstanten

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, // Liste nur so groß wie nötig (da oft in übergeordnetem Scroll)
      physics: const NeverScrollableScrollPhysics(), // Scrollen übernimmt der Parent
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace), // Außenabstand
          child: Column(
            children: [
              /* Brands */
              // Zeigt eine kleine Marken-/Produkt-Showcase-Reihe (z. B. Logos/Bilder)
              const TBrandShowcase(images: [
                TImages.productImage3,
                TImages.productImage2,
                TImages.productImage1
              ]),
              const SizedBox(height: TSizes.spaceBtwItems),

              /* Products */
              // Abschnittsüberschrift „You might like“ mit optionaler Aktion (onPressed aktuell leer)
              TSectionHeading(title: 'You might like', onPressed: (){}),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Produktgitter mit 4 Items; jede Zelle: vertikale Produktkarte
              TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const TProductCardVertical(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
