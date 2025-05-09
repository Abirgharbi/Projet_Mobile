import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../ViewModel/verify_token_controller.dart';

class VerifyTokenPage extends StatelessWidget {
  const VerifyTokenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final String? token = args != null ? args['token'] : null;

    final controller = Get.put(VerifyTokenController());

    if (token != null) {
      controller.verifyToken(token);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Verification'),
        backgroundColor: const Color(0xffFF7742),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child:
              token == null
                  ? const Text("Aucun token reçu.")
                  : Obx(() {
                    if (controller.isLoading.value) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(
                            color: Color(0xffFF7742),
                          ).animate().fade(duration: 500.ms),
                          const SizedBox(height: 16),
                          const Text(
                            'Vérification de votre compte...',
                            style: TextStyle(fontSize: 16),
                          ).animate().fadeIn(delay: 300.ms),
                        ],
                      );
                    } else if (controller.isError.value) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.errorMessage.value,
                            style: const TextStyle(color: Colors.red),
                          ).animate().shake(),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () => Get.toNamed('/login'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffFF7742),
                            ),
                            child: const Text('Retour à la connexion'),
                          ).animate().fadeIn(delay: 200.ms),
                        ],
                      );
                    } else if (controller.isSuccess.value) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Color(0xffFF7742),
                            size: 80,
                          ).animate().scale(duration: 400.ms),
                          const SizedBox(height: 16),
                          const Text(
                            "Bienvenue ! Redirection en cours...",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ).animate().fadeIn(duration: 600.ms),
                          const SizedBox(height: 24),
                          const Text(
                            "KOAHome, c’est chez toi ou quoi ?",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ).animate().fadeIn(delay: 800.ms),
                        ],
                      );
                    } else {
                      return const Text("État inattendu.");
                    }
                  }),
        ),
      ),
    );
  }
}
