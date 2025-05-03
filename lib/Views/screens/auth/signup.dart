import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text("Inscription",
              style: Theme.of(context).textTheme.headlineMedium,
            ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),

            const SizedBox(height: 30),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nom"),
            ).animate().fadeIn(duration: 500.ms),

            const SizedBox(height: 20),

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
                // Inscription ici
              },
              child: const Text("S'inscrire"),
            ).animate().fadeIn(duration: 500.ms, delay: 700.ms).scale()
          ],
        ),
      ),
    );
  }
}
