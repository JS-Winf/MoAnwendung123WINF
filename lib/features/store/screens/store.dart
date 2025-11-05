import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/language_controller.dart';
import 'all_brands.dart';
import '../../cart/screens/cart.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: GetBuilder<LanguageController>(
            builder: (_) => Text(AppStrings.store, style: Theme.of(context).textTheme.headlineMedium),
          ),
          actions: [
            IconButton(
              onPressed: () => Get.to(() => const CartScreen()),
              icon: const Icon(Iconsax.shopping_bag)
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: 16),
                      // Search bar
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Iconsax.search_normal, color: Colors.grey),
                            SizedBox(width: 8),
                            GetBuilder<LanguageController>(
                              builder: (_) => Text(AppStrings.searchInStore, style: TextStyle(color: Colors.grey)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // Featured brands section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<LanguageController>(
                            builder: (_) => Text(AppStrings.featuredBrands, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          GetBuilder<LanguageController>(
                            builder: (_) => TextButton(
                              onPressed: () => Get.to(() => const AllBrandsScreen()),
                              child: Text(AppStrings.viewAll)
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          mainAxisExtent: 80,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          final brands = [
                            {'name': 'Nike', 'products': 120, 'icon': 'assets/icons/brands/nike.png'},
                            {'name': 'Adidas', 'products': 95, 'icon': 'assets/icons/brands/adidas-logo.png'},
                            {'name': 'Apple', 'products': 80, 'icon': 'assets/icons/brands/apple-logo.png'},
                            {'name': 'Puma', 'products': 75, 'icon': 'assets/icons/brands/puma-logo.png'},
                          ];
                          final brand = brands[index];
                          
                          return Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF764ba2).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      brand['icon'] as String,
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) => 
                                        const Icon(Iconsax.shop, color: Color(0xFF764ba2)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        brand['name'] as String,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      GetBuilder<LanguageController>(
                                        builder: (_) => Text(
                                          '${brand['products']} ${AppStrings.products}',
                                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                                        ),
                                      ),
                                    ],
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
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(child: GetBuilder<LanguageController>(builder: (_) => Text(AppStrings.sports))),
                    Tab(child: GetBuilder<LanguageController>(builder: (_) => Text(AppStrings.furniture))),
                    Tab(child: GetBuilder<LanguageController>(builder: (_) => Text(AppStrings.electronics))),
                    Tab(child: GetBuilder<LanguageController>(builder: (_) => Text(AppStrings.clothes))),
                    Tab(child: GetBuilder<LanguageController>(builder: (_) => Text(AppStrings.cosmetics))),
                  ],
                ),
              )
            ];
          },
          body: GetBuilder<LanguageController>(
            builder: (_) => TabBarView(
              children: [
                _buildCategoryTab(AppStrings.sports),
                _buildCategoryTab(AppStrings.furniture),
                _buildCategoryTab(AppStrings.electronics),
                _buildCategoryTab(AppStrings.clothes),
                _buildCategoryTab(AppStrings.cosmetics),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTab(String category) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<LanguageController>(
            builder: (_) => Text('$category ${AppStrings.products}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final categoryData = {
                  'Sports': [
                    {'image': 'assets/images/products/NikeAirMax.png', 'name': 'Nike Air Max'},
                    {'image': 'assets/images/products/Adidas_Football.png', 'name': 'Nike Football'},
                    {'image': 'assets/images/products/tennis_racket.png', 'name': 'Tennis Racket'},
                  ],
                  'Sport': [
                    {'image': 'assets/images/products/NikeAirMax.png', 'name': 'Nike Air Max'},
                    {'image': 'assets/images/products/Adidas_Football.png', 'name': 'Nike Football'},
                    {'image': 'assets/images/products/tennis_racket.png', 'name': 'Tennis Racket'},
                  ],
                  'Electronics': [
                    {'image': 'assets/images/products/iphone_14_pro.png', 'name': 'iPhone 14 Pro'},
                    {'image': 'assets/images/products/samsung_s9_mobile.png', 'name': 'Samsung Galaxy S9'},
                    {'image': 'assets/images/products/acer_laptop_1.png', 'name': 'Acer Laptop'},
                  ],
                  'Elektronik': [
                    {'image': 'assets/images/products/iphone_14_pro.png', 'name': 'iPhone 14 Pro'},
                    {'image': 'assets/images/products/samsung_s9_mobile.png', 'name': 'Samsung Galaxy S9'},
                    {'image': 'assets/images/products/acer_laptop_1.png', 'name': 'Acer Laptop'},
                  ],
                  'Clothes': [
                    {'image': 'assets/images/products/leather_jacket_1.png', 'name': 'Leather Jacket'},
                    {'image': 'assets/images/products/tshirt_blue_collar.png', 'name': 'Blue T-Shirt'},
                    {'image': 'assets/images/products/product-jeans.png', 'name': 'Denim Jeans'},
                  ],
                  'Kleidung': [
                    {'image': 'assets/images/products/leather_jacket_1.png', 'name': 'Leather Jacket'},
                    {'image': 'assets/images/products/tshirt_blue_collar.png', 'name': 'Blue T-Shirt'},
                    {'image': 'assets/images/products/product-jeans.png', 'name': 'Denim Jeans'},
                  ],
                  'Furniture': [
                    {'image': 'assets/images/products/office_chair_1.png', 'name': 'Leather Armchair'},
                    {'image': 'assets/images/products/bedroom_bed.png', 'name': 'Bedroom Bed'},
                    {'image': 'assets/images/products/kitchen_counter.png', 'name': 'Kitchen Counter'},
                  ],
                  'Möbel': [
                    {'image': 'assets/images/products/office_chair_1.png', 'name': 'Leather Armchair'},
                    {'image': 'assets/images/products/bedroom_bed.png', 'name': 'Bedroom Bed'},
                    {'image': 'assets/images/products/kitchen_counter.png', 'name': 'Kitchen Counter'},
                  ],
                  'Cosmetics': [],
                  'Kosmetik': [],
                };
                final products = categoryData[category] ?? [];
                final product = index < products.length ? products[index] : null;
                final imagePath = product?['image'];
                final productName = product?['name'] ?? '$category Item ${index + 1}';
                
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                            child: Stack(
                              children: [
                                imagePath != null
                                    ? Image.asset(
                                        imagePath,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) => Center(
                                          child: Icon(_getCategoryIcon(category), size: 40, color: Color(0xFF764ba2)),
                                        ),
                                      )
                                    : Center(
                                        child: Icon(_getCategoryIcon(category), size: 40, color: Color(0xFF764ba2)),
                                      ),
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
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(productName, 
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)
                              ),
                              GetBuilder<LanguageController>(
                                builder: (_) => Text(AppStrings.brandName, 
                                  style: TextStyle(color: Colors.grey.shade600, fontSize: 10)
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('\$${(index + 1) * 25}.99', 
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF764ba2), fontSize: 12)
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF764ba2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 12),
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
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Sports':
      case 'Sport': return Iconsax.activity;
      case 'Furniture':
      case 'Möbel': return Iconsax.home;
      case 'Electronics':
      case 'Elektronik': return Iconsax.mobile;
      case 'Clothes':
      case 'Kleidung': return Iconsax.user;
      case 'Cosmetics':
      case 'Kosmetik': return Iconsax.heart;
      default: return Iconsax.shop;
    }
  }
}