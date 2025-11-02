import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/constants/language_controller.dart';

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
            IconButton(onPressed: () {}, icon: const Icon(Iconsax.shopping_bag)),
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
                            builder: (_) => TextButton(onPressed: () {}, child: Text(AppStrings.viewAll)),
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
                        itemBuilder: (context, index) => Container(
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
                                child: const Icon(Iconsax.shop, color: Color(0xFF764ba2)),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GetBuilder<LanguageController>(
                                      builder: (_) => Text('${AppStrings.brand} ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                    ),
                                    GetBuilder<LanguageController>(
                                      builder: (_) => Text('${(index + 1) * 25} ${AppStrings.products}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                final categoryProducts = {
                  'Sports': ['assets/images/products/NikeAirMax.png', 'assets/images/products/Adidas_Football.png', 'assets/images/products/tennis_racket.png'],
                  'Sport': ['assets/images/products/NikeAirMax.png', 'assets/images/products/Adidas_Football.png', 'assets/images/products/tennis_racket.png'],
                  'Electronics': ['assets/images/products/iphone_14_pro.png', 'assets/images/products/samsung_s9_mobile.png', 'assets/images/products/acer_laptop_1.png'],
                  'Elektronik': ['assets/images/products/iphone_14_pro.png', 'assets/images/products/samsung_s9_mobile.png', 'assets/images/products/acer_laptop_1.png'],
                  'Clothes': ['assets/images/products/leather_jacket_1.png', 'assets/images/products/tshirt_blue_collar.png', 'assets/images/products/product-jeans.png'],
                  'Kleidung': ['assets/images/products/leather_jacket_1.png', 'assets/images/products/tshirt_blue_collar.png', 'assets/images/products/product-jeans.png'],
                  'Furniture': ['assets/images/products/office_chair_1.png', 'assets/images/products/bedroom_bed.png', 'assets/images/products/kitchen_counter.png'],
                  'Möbel': ['assets/images/products/office_chair_1.png', 'assets/images/products/bedroom_bed.png', 'assets/images/products/kitchen_counter.png'],
                  'Cosmetics': [],
                  'Kosmetik': [],
                };
                final images = categoryProducts[category] ?? [];
                final imagePath = images.isNotEmpty && index < images.length ? images[index] : null;
                
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
                              Text('$category Item ${index + 1}', 
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