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
            ListTile(
              title: const Text('Theme'),
              subtitle: Text(switch (mode) {
                ThemeMode.light  => 'Light',
                ThemeMode.dark   => 'Dark',
                ThemeMode.system => 'System',
              }),
              trailing: SegmentedButton<ThemeMode>(
                segments: const [
                  ButtonSegment(value: ThemeMode.light , label: Text('Light')),
                  ButtonSegment(value: ThemeMode.dark  , label: Text('Dark')),
                  ButtonSegment(value: ThemeMode.system, label: Text('System')),
                ],
                selected: {mode},
                onSelectionChanged: (s) => theme.setMode(s.single),
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              title: const Text('Quick Toggle'),
              subtitle: const Text('Light → Dark → System'),
              trailing: IconButton(
                icon: const Icon(Icons.brightness_6),
                onPressed: theme.toggle,
              ),
            ),
          ],
        );
      }),
    );
  }
}
