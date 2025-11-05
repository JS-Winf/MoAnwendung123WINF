import 'package:flutter/material.dart'; // Material-Widgets und -Themes
import 'package:iconsax/iconsax.dart'; // Iconsax-Iconset (Fallback-Icon für Bilder)
import 'package:get/get.dart'; // GetX (Navigation & State-Management)
import '../../../utils/constants/app_strings.dart'; // Lokalisierte String-Konstanten (z. B. "My Cart")
import '../../../utils/constants/language_controller.dart'; // Controller für Sprach-/Lokalisierungswechsel

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Beispielhafte Warenkorb-Daten (lokal im Widget; in echt kämen diese aus einem State/Repository)
    final cartItems = [
      {'name': 'Nike Air Max', 'brand': 'Nike', 'price': '129.99', 'quantity': 1, 'image': 'assets/images/products/NikeAirMax.png'},
      {'name': 'iPhone 14 Pro', 'brand': 'Apple', 'price': '999.99', 'quantity': 1, 'image': 'assets/images/products/iphone_14_pro.png'},
      {'name': 'Leather Jacket', 'brand': 'Fashion', 'price': '89.99', 'quantity': 2, 'image': 'assets/images/products/leather_jacket_1.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        // Titel reagiert auf Sprachwechsel via GetBuilder<LanguageController>
        title: GetBuilder<LanguageController>(
          builder: (_) => Text(AppStrings.myCart),
        ),
        // Zurück-Navigation
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          // Scrollbare Liste der Cart-Items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
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
                  ),
                  child: Row(
                    children: [
                      // Produktbild mit abgerundeten Ecken + Fallback-Icon
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item['image']! as String,
                            fit: BoxFit.cover,
                            // Falls Bild fehlt/fehlschlägt → Einkaufstaschen-Icon
                            errorBuilder: (context, error, stackTrace) => 
                              const Icon(Iconsax.shopping_bag, color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Produktdetails (Name, Marke, Preis, Menge)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Produktname
                            Text(
                              item['name']! as String,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // Marke/Brand (dezenter)
                            Text(
                              item['brand']! as String,
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                            ),
                            const SizedBox(height: 8),
                            // Preis (farblich hervorgehoben) + Menge rechts
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${item['price']! as String}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF764ba2),
                                  ),
                                ),
                                Text('Qty: ${item['quantity']! as int}'),
                              ],
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
          // Fußbereich mit Gesamtsumme und Checkout-Button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Gesamtsumme (hier statisch; in echt berechnet aus cartItems)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Total:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$1,309.96',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF764ba2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Checkout-Button (volle Breite)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {}, // TODO: Checkout-Flow starten
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF764ba2),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
