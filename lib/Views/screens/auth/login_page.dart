import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Connexion",
              style: Theme.of(context).textTheme.headlineMedium,
            ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),

            const SizedBox(height: 30),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ).animate().fadeIn(duration: 500.ms, delay: 300.ms),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Mot de passe"),
            ).animate().fadeIn(duration: 500.ms, delay: 500.ms),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                // Connexion ici
              },
              child: const Text("Se connecter"),
            ).animate().fadeIn(duration: 500.ms, delay: 700.ms).scale()
          ],
        ),
      ),
    );
  }
}
