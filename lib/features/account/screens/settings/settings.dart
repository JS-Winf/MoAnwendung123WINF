import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blueAccent],
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Text('Account', 
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white)
                    ),
                    const SizedBox(height: 20),
                    // User Profile
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/content/user.png'),
                      ),
                      title: const Text('John Doe', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('john.doe@email.com', style: TextStyle(color: Colors.white70)),
                      trailing: IconButton(
                        icon: const Icon(Iconsax.edit, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Menu Items
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Account Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  
                  _buildMenuItem(Iconsax.safe_home, 'My Addresses', 'Set shopping delivery address'),
                  _buildMenuItem(Iconsax.shopping_cart, 'My Cart', 'Add, remove products and move to checkout'),
                  _buildMenuItem(Iconsax.bag_tick, 'My Orders', 'In-progress and Completed Orders'),
                  _buildMenuItem(Iconsax.bank, 'Bank Account', 'Withdraw balance to registered bank account'),
                  _buildMenuItem(Iconsax.discount_shape, 'My Coupons', 'List of all the discounted coupons'),
                  _buildMenuItem(Iconsax.notification, 'Notifications', 'Set any kind of notifications message'),
                  
                  const SizedBox(height: 32),
                  const Text('App Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  
                  _buildMenuItem(Iconsax.document_upload, 'Load Data', 'Upload Data to your Cloud firebase'),
                  _buildSwitchMenuItem(Iconsax.location, 'Geolocation', 'Set recommendation based on location', true),
                  _buildSwitchMenuItem(Iconsax.security_user, 'Safe Mode', 'Search result is safe for all ages', false),
                  _buildSwitchMenuItem(Iconsax.image, 'HD Image Quality', 'Set image quality to be seen', false),

                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async {
                        await AuthenticationRepository.instance.logout();
                      },
                      child: const Text('Logout'),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  Widget _buildSwitchMenuItem(IconData icon, String title, String subtitle, bool value) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(value: value, onChanged: (newValue) {}),
    );
  }
}