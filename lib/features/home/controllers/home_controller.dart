import 'package:get/get.dart'; // GetX-Paket für State-Management und Reaktivität

class HomeController extends GetxController {
  // Bequemer Zugriff auf die bereits registrierte Controller-Instanz
  static HomeController get instance => Get.find();

  // Reaktiver Index für ein Carousel/Slider (z. B. aktuell sichtbare Seite)
  final carousalCurrentIndex = 0.obs;

  // Aktualisiert den Carousel-Indikator mit dem übergebenen Seitenindex
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}
