import 'package:carousel_slider/carousel_slider.dart'; // Externes Carousel-Widget für Bild-Slider
import 'package:hotshop/features/home/controllers/home_controller.dart'; // GetX-Controller für den Slider-Index
import 'package:hotshop/utils/constants/colors.dart'; // Farbkonstanten (TColors)
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX für DI/Reaktivität

import '../../../../common/widgets/custom_shapes/containers/circular_container.dart'; // Kleines, rundes/abgerundetes Container-Widget
import '../../../../common/widgets/images/rounded_image.dart'; // Bild-Widget mit abgerundeten Ecken
import '../../../../utils/constants/sizes.dart'; // Abstands-/Größenkonstanten

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, 
    required this.banners, // Liste der Banner-Bild-URLs
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    // Registriert/Holt den HomeController (enthält carousalCurrentIndex als RxInt)
    final controller = Get.put(HomeController());

    return Column(
      children: [
        // Bildkarussell über die übergebenen Banner-URLs
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1, // jedes Slide nimmt 100% Breite ein
            onPageChanged: (index, _) => controller.updatePageIndicator(index), // Index im Controller aktualisieren
          ),
          // Jedes Banner als TRoundedImage rendern
          items: banners.map((url) => TRoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        // Punkt-/Balken-Indikator in der Mitte
        Center(
          child: Obx(
            // Reaktives Neuaufbauen bei Index-Änderung
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Für jedes Banner einen schmalen Indikator-Balken zeichnen
                for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    // Aktives Slide: Primärfarbe, sonst grau
                    backgroundColor: controller.carousalCurrentIndex.value == i 
                      ? TColors.primary 
                      : TColors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
