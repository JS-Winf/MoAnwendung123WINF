import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotshop/navigation_menu.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl  = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _onLogin() {
    final email = _emailCtrl.text.trim();
    final pass  = _passCtrl.text;

    if (email.isEmpty || pass.isEmpty) {
      Get.snackbar('Fehler', 'Bitte E-Mail und Passwort eingeben');
      return;
    }

    // TODO: echte Authentifizierung einbauen (API-Call, Token speichern, etc.)
    Get.snackbar('Success', 'Login successfully');

    // Nach dem „Login“ zur Hauptnavigation wechseln (Stack leeren):
    Get.offAll(() => const NavigationMenu());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passCtrl,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _onLogin,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
