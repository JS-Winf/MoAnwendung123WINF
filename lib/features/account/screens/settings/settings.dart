import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/theme/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Obx(() {
        final mode = theme.themeMode.value;

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ===================== ACCOUNT =====================
            const _SectionHeader('Account'),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profile'),
              subtitle: const Text('Name, E-Mail, Passwort'),
              onTap: () {
                // TODO: Profil-Screen öffnen
                // Get.to(() => const ProfileScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: const Text('Address Book'),
              subtitle: const Text('Liefer- & Rechnungsadressen'),
              onTap: () {
                // TODO: AddressBook öffnen
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment_outlined),
              title: const Text('Payment Methods'),
              subtitle: const Text('Karten, PayPal, …'),
              onTap: () {
                // TODO: Zahlungsarten öffnen
              },
            ),
            const Divider(height: 32),

            // ===================== PREFERENCES (inkl. NEU: Theme) =====================
            const _SectionHeader('Preferences'),
            // Theme Mode (NEU)
            ListTile(
              leading: const Icon(Icons.brightness_6_outlined),
              title: const Text('Theme'),
              subtitle: Text(
                switch (mode) {
                  ThemeMode.light => 'Light',
                  ThemeMode.dark => 'Dark',
                  ThemeMode.system => 'System',
                },
              ),
              trailing: SegmentedButton<ThemeMode>(
                segments: const [
                  ButtonSegment(value: ThemeMode.light, label: Text('Light')),
                  ButtonSegment(value: ThemeMode.dark, label: Text('Dark')),
                  ButtonSegment(value: ThemeMode.system, label: Text('System')),
                ],
                selected: {mode},
                onSelectionChanged: (s) => theme.setMode(s.single),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.brightness_auto),
              title: const Text('Quick Toggle'),
              subtitle: const Text('Light → Dark → System'),
              trailing: IconButton(
                icon: const Icon(Icons.brightness_6),
                onPressed: theme.toggle,
                tooltip: 'Switch Theme',
              ),
            ),
            // HIER kannst du weitere alte Preferences belassen/ergänzen …

            const Divider(height: 32),

            // ===================== NOTIFICATIONS =====================
            const _SectionHeader('Notifications'),
            SwitchListTile(
              secondary: const Icon(Icons.notifications_active_outlined),
              title: const Text('Push Notifications'),
              value: true, // TODO: Setting anbinden
              onChanged: (v) {
                // TODO: speichern
                Get.snackbar('Saved', 'Push: ${v ? "on" : "off"}');
              },
            ),
            SwitchListTile(
              secondary: const Icon(Icons.email_outlined),
              title: const Text('Email Updates'),
              value: false, // TODO: Setting anbinden
              onChanged: (v) {
                // TODO: speichern
                Get.snackbar('Saved', 'Email: ${v ? "on" : "off"}');
              },
            ),
            const Divider(height: 32),

            // ===================== PRIVACY =====================
            const _SectionHeader('Privacy'),
            ListTile(
              leading: const Icon(Icons.lock_outline),
              title: const Text('Privacy Settings'),
              subtitle: const Text('Tracking, Personalisierung'),
              onTap: () {
                // TODO: Privacy Screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.security_outlined),
              title: const Text('Security'),
              subtitle: const Text('Zwei-Faktor, Geräte'),
              onTap: () {
                // TODO: Security Screen
              },
            ),
            const Divider(height: 32),

            // ===================== ABOUT =====================
            const _SectionHeader('About'),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('App Info'),
              subtitle: const Text('Version, Lizenzen'),
              onTap: () => showAboutDialog(
                context: context,
                applicationName: 'Hotshop',
                applicationVersion: '0.1.0',
                children: const [Text('Thanks for trying Hotshop!')],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.description_outlined),
              title: const Text('Licenses'),
              onTap: () => showLicensePage(
                context: context,
                applicationName: 'Hotshop',
                applicationVersion: '0.1.0',
              ),
            ),

            const SizedBox(height: 24),

            // ===================== SESSION =====================
            const _SectionHeader('Session'),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // TODO: Session clear + Redirect
                // Get.offAll(() => const OnBoardingScreen());
                Get.snackbar('Logout', 'Du wurdest abgemeldet (Demo)');
              },
            ),
          ],
        );
      }),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String text;
  const _SectionHeader(this.text);

  @override
  Widget build(BuildContext context) {
    final onBg = Theme.of(context).colorScheme.onBackground;
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              // Nutze withOpacity für maximale Kompatibilität
              color: onBg.withOpacity(0.8),
            ),
      ),
    );
  }
}
