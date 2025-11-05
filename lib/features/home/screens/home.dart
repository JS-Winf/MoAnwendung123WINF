// ============================================================================
// HOME SCREEN - HAUPTSEITE DER APP
// Zeigt: Personalisierte Begrüßung, Suchfunktion, Promo-Banner, Produkte
// ============================================================================

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../utils/constants/app_strings.dart'; // Lokalisierte String-Konstanten
import '../../../utils/constants/language_controller.dart'; // GetX-Controller für Sprache
import '../../../data/repositories/authentication/authentication_repository.dart'; // Auth0/Repo-Zugriff
import '../../cart/screens/cart.dart'; // Warenkorb-Screen

/// Stateless Widget für bessere Performance
/// Implementiert Material Design Guidelines
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Registriert/holt den LanguageController (für dynamische Texte)
    final languageController = Get.put(LanguageController());
    return Scaffold(
      body: SingleChildScrollView( // Ermöglicht Scrollen durch den gesamten Inhalt
        child: Column(
          children: [
            // ========== HEADER BEREICH ==========
            /// Gradient Header mit App Bar, Suche und Freunde-Sektion
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient( // Verlaufs-Hintergrund
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                ),
                boxShadow: [
                  BoxShadow( // Weicher Schatten unter dem Header
                    color: Colors.blue.shade200.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: SafeArea( // Vermeidet Notch/Statusbar-Überlappung
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // ========== PERSONALISIERTE APP BAR ==========
                      /// Zeigt dynamische Begrüßung basierend auf Auth0 User
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Linke Seite: Begrüßungstitel + dynamischer Name
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GetBuilder<LanguageController>( // Reagiert auf Sprachwechsel
                                builder: (_) => Text(
                                  AppStrings.goodDay,
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white70),
                                ),
                              ),
                              FutureBuilder<String>( // Lädt asynchron den (Vor-)Namen
                                future: _getUserName(),
                                builder: (context, snapshot) {
                                  final name = snapshot.data ?? 'Guest';
                                  return GetBuilder<LanguageController>(
                                    builder: (_) => Text(
                                      '${AppStrings.hello} $name',
                                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          // Rechte Seite: Warenkorb-Icon mit Badge
                          Stack(
                            children: [
                              IconButton(
                                icon: const Icon(Iconsax.shopping_bag, color: Colors.white),
                                onPressed: () => Get.to(() => const CartScreen()), // Navigation zum Cart
                              ),
                              Positioned( // Roter Badge oben rechts
                                right: 0,
                                top: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Text('3', style: TextStyle(color: Colors.white, fontSize: 10)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      
                      // ========== SUCHFUNKTION ==========
                      /// Responsive Suchfeld mit Material Design
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Iconsax.search_normal, color: Colors.grey), // Lupe-Icon
                            SizedBox(width: 8),
                            GetBuilder<LanguageController>(
                              builder: (_) => Text(
                                AppStrings.searchInStore, // Platzhaltertext
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // ========== SOZIALE FUNKTIONEN ==========
                      /// Freunde-Avatars für soziale Interaktion
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GetBuilder<LanguageController>(
                              builder: (_) => Text(
                                AppStrings.yourFriends,
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 70,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal, // Horizontal scrollbarer Avatarstreifen
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                // Lokale Demo-Avatar-Liste
                                final avatars = [
                                  'assets/images/content/user.png',
                                  'assets/images/reviews/review_profile_image_1.jpg',
                                  'assets/images/reviews/review_profile_image_2.jpeg',
                                  'assets/images/reviews/review_profile_image_3.jpeg',
                                  'assets/images/content/user.png',
                                ];
                                return Container(
                                  margin: const EdgeInsets.only(right: 12),
                                  child: Column(
                                    children: [
                                      // Kreis-Avatar mit weißem Rand & Schatten
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white, width: 2),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              blurRadius: 4,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.white,
                                          backgroundImage: AssetImage(avatars[index]),
                                          onBackgroundImageError: (exception, stackTrace) {},
                                          // Fallback-Initialen, falls Bild fehlt
                                          child: Image.asset(
                                            avatars[index],
                                            errorBuilder: (context, error, stackTrace) => Text(
                                              'F${index + 1}',
                                              style: const TextStyle(color: Color(0xFF764ba2), fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      GetBuilder<LanguageController>(
                                        builder: (_) => Text(
                                          AppStrings.friend,
                                          style: TextStyle(color: Colors.white70, fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
            
            // Body Content (unterhalb des Headers)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // ========== MARKETING BEREICH ==========
                  /// Promo-Banner Slider für Angebote und Werbung
                  SizedBox(
                    height: 200,
                    child: PageView.builder( // Einfache PageView-Variante (kein Indikator)
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        final banners = [
                          'assets/images/products/promo-banner-1.png',
                          'assets/images/products/promo-banner-2.png',
                          'assets/images/products/promo-banner-3.png',
                        ];
                        
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              banners[index],
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                              // Fallback: farbiger Gradient mit Platzhaltertext
                              errorBuilder: (context, error, stackTrace) => Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Colors.blue.shade400, Colors.purple.shade600],
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.shade200,
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: GetBuilder<LanguageController>(
                                    builder: (_) => Text(
                                      '${AppStrings.promoBanner} ${index + 1}',
                                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // ========== PRODUKT SHOWCASE ==========
                  /// Grid-Layout für beliebte Produkte
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder<LanguageController>(
                        builder: (_) => Text(
                          AppStrings.popularProducts,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Products Grid (4 Beispiel-Items)
                  GridView.builder(
                    shrinkWrap: true, // Grid in Column einbetten
                    physics: const NeverScrollableScrollPhysics(), // Scroll übernimmt der übergeordnete ListView
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 Spalten
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final products = [
                        {'name': 'Nike Air Max', 'brand': 'Nike', 'price': '129.99', 'image': 'assets/images/products/NikeAirMax.png'},
                        {'name': 'iPhone 14 Pro', 'brand': 'Apple', 'price': '999.99', 'image': 'assets/images/products/iphone_14_pro.png'},
                        {'name': 'Leather Jacket', 'brand': 'Fashion', 'price': '89.99', 'image': 'assets/images/products/leather_jacket_1.png'},
                        {'name': 'Leather Armchair', 'brand': 'Furniture', 'price': '199.99', 'image': 'assets/images/products/office_chair_1.png'},
                      ];
                      final product = products[index];
                      
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
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
                            // Oberer Bildbereich mit Wunschlisten-Icon
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                ),
                                child: Stack(
                                  children: [
                                    // Produktbild mit Fallback
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                      child: Image.asset(
                                        product['image']!,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) => Center(
                                          child: Icon(Iconsax.shopping_bag, size: 40, color: Colors.grey.shade400),
                                        ),
                                      ),
                                    ),
                                    // Kleines Herz-Icon oben rechts
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.9),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Iconsax.heart, color: Colors.grey, size: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Unterer Text-/Preis-/Buttonbereich
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product['name']!,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      product['brand']!,
                                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Preis (hervorgehoben)
                                        Text(
                                          '\$${product['price']}',
                                          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF764ba2)),
                                        ),
                                        // Mini-Warenkorb-Button (ohne Funktion)
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF764ba2),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Liefert eine hübsch aufbereitete Benutzer-Anzeige (Vorname/Nickname/aus E-Mail extrahiert).
  Future<String> _getUserName() async {
    try {
      final authRepo = AuthenticationRepository.instance;
      final user = await authRepo.currentUser();
      
      if (user != null) {
        // 1) Bevorzugt: Vollständiger Name (ohne E-Mail-Anteil)
        if (user.name != null && user.name!.isNotEmpty && !user.name!.contains('@')) {
          final firstName = user.name!.split(' ').first;
          return firstName;
        }
        
        // 2) Fallback: Nickname (sofern nicht wie eine E-Mail)
        if (user.nickname != null && user.nickname!.isNotEmpty && !user.nickname!.contains('@')) {
          return user.nickname!;
        }
        
        // 3) Fallback: Name aus E-Mail extrahieren (Ziffern/Sonderzeichen entfernen)
        if (user.email != null && user.email!.isNotEmpty) {
          final emailPart = user.email!.split('@').first;
          final cleanName = emailPart.replaceAll(RegExp(r'[0-9._-]'), '');
          if (cleanName.isNotEmpty) {
            return cleanName.substring(0, 1).toUpperCase() + cleanName.substring(1).toLowerCase();
          }
        }
      }
      
      // Demo-User-Fallback (z. B. für Demo-Modus)
      final storage = authRepo.deviceStorage;
      if (storage.read('demoUser') == true) {
        return 'Demo User';
      }
      
      return 'Guest';
    } catch (e) {
      // Fehler → generischer Fallback
      return 'Guest';
    }
  }
}
