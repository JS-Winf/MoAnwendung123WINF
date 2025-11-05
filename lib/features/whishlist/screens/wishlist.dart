import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../utils/constants/app_strings.dart'; // Lokalisierte/konstante Strings (Titel etc.)
import '../../../utils/constants/language_controller.dart'; // GetX-Controller für Sprache/Übersetzung

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Titel reagiert auf Sprachwechsel durch LanguageController
        title: GetBuilder<LanguageController>(
          builder: (_) => Text(
            AppStrings.wishlist,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        actions: [
          // Optionaler Action-Button (derzeit ohne Funktion)
          IconButton(icon: const Icon(Iconsax.add), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Außenabstand
          child: Column(
            children: [
              // Rasterdarstellung der Wunschlisten-Artikel
              GridView.builder(
                shrinkWrap: true, // Grid in Column einbetten
                physics: const NeverScrollableScrollPhysics(), // Scroll übernimmt der Parent
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,       // 2 Spalten
                  crossAxisSpacing: 16,     // horizontaler Abstand
                  mainAxisSpacing: 16,      // vertikaler Abstand
                  childAspectRatio: 0.8,    // Kartenproportionen
                ),
                itemCount: 4, // Anzahl der Beispielprodukte
                itemBuilder: (context, index) {
                  // Demo-Daten für die Wunschliste
                  final wishlistProducts = [
                    {'name': 'Leather Jacket', 'brand': 'Fashion',   'price': '89.99',  'image': 'assets/images/products/leather_jacket_1.png'},
                    {'name': 'Samsung Galaxy', 'brand': 'Samsung',   'price': '799.99', 'image': 'assets/images/products/samsung_s9_mobile.png'},
                    {'name': 'Office Desk',    'brand': 'Furniture', 'price': '299.99', 'image': 'assets/images/products/office_desk_1.png'},
                    {'name': 'Blue T-Shirt',   'brand': 'Clothing',  'price': '29.99',  'image': 'assets/images/products/tshirt_blue_collar.png'},
                  ];
                  final product = wishlistProducts[index];
                  
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        // zweistufiger Schatten für „card“-Look
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                        BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Oberer Bildbereich mit „Favorit“-Badge
                        Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              // Produktbild mit abgerundeten oberen Ecken
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                  child: Image.asset(
                                    product['image']!,                 // Asset-Pfad
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    // Fallback: Herz-Icon, wenn Bild nicht geladen werden kann
                                    errorBuilder: (context, error, stackTrace) => Center(
                                      child: Icon(Iconsax.heart, size: 40, color: Colors.grey.shade400),
                                    ),
                                  ),
                                ),
                              ),
                              // Roter Favorit-Indikator oben rechts
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Iconsax.heart5, color: Colors.white, size: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Unterer Text-/Preisbereich
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Produktname (fett)
                                Text(
                                  product['name']!,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                // Marke (dezente Farbe)
                                Text(
                                  product['brand']!,
                                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                                ),
                                const Spacer(),
                                // Preis (akzentuiert)
                                Text(
                                  '\$${product['price']}',
                                  style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF764ba2)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
