import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../utils/constants/app_strings.dart'; // Lokalisierte/konstante Strings (Titel, Labels)
import '../../../utils/constants/language_controller.dart'; // GetX-Controller für Sprache/Übersetzungen

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Beispielhafte Brand-Daten (normalerweise aus Repository/API)
    final brands = [
      {'name': 'Nike', 'products': 120, 'icon': 'assets/icons/brands/nike.png'},
      {'name': 'Adidas', 'products': 95, 'icon': 'assets/icons/brands/adidas-logo.png'},
      {'name': 'Apple', 'products': 80, 'icon': 'assets/icons/brands/apple-logo.png'},
      {'name': 'Puma', 'products': 75, 'icon': 'assets/icons/brands/puma-logo.png'},
      {'name': 'Jordan', 'products': 65, 'icon': 'assets/icons/brands/jordan-logo.png'},
      {'name': 'Zara', 'products': 55, 'icon': 'assets/icons/brands/zara-logo.png'},
      {'name': 'IKEA', 'products': 45, 'icon': 'assets/icons/brands/ikea_logo.png'},
      {'name': 'Acer', 'products': 35, 'icon': 'assets/icons/brands/acer_logo.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        // Titel reagiert auf Sprachwechsel
        title: GetBuilder<LanguageController>(
          builder: (_) => Text(AppStrings.allBrands),
        ),
        // Zurück-Pfeil (Pop der aktuellen Route)
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Außenabstand für den Gridbereich
        child: GridView.builder(
          // 2 Spalten, gleichmäßige Abstände, feste Kartenhöhe (mainAxisExtent)
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 100,
          ),
          itemCount: brands.length,
          itemBuilder: (context, index) {
            final brand = brands[index];
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  // Kreisförmiger Icon-Container mit hellem Markenakzent
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF764ba2).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        brand['icon'] as String,
                        fit: BoxFit.contain,
                        // Fallback-Icon, wenn Asset nicht geladen werden kann
                        errorBuilder: (context, error, stackTrace) =>
                          const Icon(Iconsax.shop, color: Color(0xFF764ba2)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Markenname + Produktanzahl (links ausgerichtet, vertikal zentriert)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          brand['name'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${brand['products']} Products',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
