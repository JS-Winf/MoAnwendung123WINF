import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/language_controller.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<LanguageController>(
          builder: (_) => Text(AppStrings.wishlist, style: Theme.of(context).textTheme.headlineMedium),
        ),
        actions: [
          IconButton(icon: const Icon(Iconsax.add), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  final wishlistProducts = [
                    {'name': 'Leather Jacket', 'brand': 'Fashion', 'price': '89.99', 'image': 'assets/images/products/leather_jacket_1.png'},
                    {'name': 'Samsung Galaxy', 'brand': 'Samsung', 'price': '799.99', 'image': 'assets/images/products/samsung_s9_mobile.png'},
                    {'name': 'Office Desk', 'brand': 'Furniture', 'price': '299.99', 'image': 'assets/images/products/office_desk_1.png'},
                    {'name': 'Blue T-Shirt', 'brand': 'Clothing', 'price': '29.99', 'image': 'assets/images/products/tshirt_blue_collar.png'},
                  ];
                  final product = wishlistProducts[index];
                  
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
                        Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                  child: Image.asset(
                                    product['image']!,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Center(
                                      child: Icon(Iconsax.heart, size: 40, color: Colors.grey.shade400),
                                    ),
                                  ),
                                ),
                              ),
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
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product['name']!, 
                                  style: const TextStyle(fontWeight: FontWeight.bold)
                                ),
                                Text(product['brand']!, 
                                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12)
                                ),
                                const Spacer(),
                                Text('\$${product['price']}', 
                                  style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF764ba2))
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
          )
        )
      )
    );
  }
}