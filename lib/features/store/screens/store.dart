import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
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
                        child: const Row(
                          children: [
                            Icon(Iconsax.search_normal, color: Colors.grey),
                            SizedBox(width: 8),
                            Text('Search in Store', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // Featured brands section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Featured Brands', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          TextButton(onPressed: () {}, child: const Text('View All')),
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
                                  color: Colors.blue.shade100,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(Iconsax.shop, color: Colors.blue),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Brand ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                    Text('${(index + 1) * 25} Products', style: const TextStyle(fontSize: 12, color: Colors.grey)),
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
                bottom: const TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              _buildCategoryTab('Sports'),
              _buildCategoryTab('Furniture'),
              _buildCategoryTab('Electronics'),
              _buildCategoryTab('Clothes'),
              _buildCategoryTab('Cosmetics'),
            ],
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
          Text('$category Products', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                final categoryProducts = {
                  'Sports': ['assets/images/products/NikeAirMax.png', 'assets/images/products/Adidas_Football.png', 'assets/images/products/tennis_racket.png'],
                  'Electronics': ['assets/images/products/iphone_14_pro.png', 'assets/images/products/samsung_s9_mobile.png', 'assets/images/products/acer_laptop_1.png'],
                  'Clothes': ['assets/images/products/leather_jacket_1.png', 'assets/images/products/tshirt_blue_collar.png', 'assets/images/products/product-jeans.png'],
                  'Furniture': ['assets/images/products/office_chair_1.png', 'assets/images/products/bedroom_bed.png', 'assets/images/products/kitchen_counter.png'],
                  'Cosmetics': [],
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
                            child: imagePath != null
                                ? Image.asset(
                                    imagePath,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Center(
                                      child: Icon(_getCategoryIcon(category), size: 40, color: Colors.blue),
                                    ),
                                  )
                                : Center(
                                    child: Icon(_getCategoryIcon(category), size: 40, color: Colors.blue),
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
                              Text('Brand Name', 
                                style: TextStyle(color: Colors.grey.shade600, fontSize: 10)
                              ),
                              const Spacer(),
                              Text('\$${(index + 1) * 25}.99', 
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 12)
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
      case 'Sports': return Iconsax.activity;
      case 'Furniture': return Iconsax.home;
      case 'Electronics': return Iconsax.mobile;
      case 'Clothes': return Iconsax.user;
      case 'Cosmetics': return Iconsax.heart;
      default: return Iconsax.shop;
    }
  }
}