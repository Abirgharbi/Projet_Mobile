import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyTokenPage extends StatelessWidget {
  const VerifyTokenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the token from the arguments
    final args = Get.arguments;
    final String? token = args != null ? args['token'] : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Verifying Token')),
      body: Center(
        child:
            token == null
                ? const Text("No token received.")
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Token received: $token",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    FutureBuilder(
                      future: _verifyToken(token),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }

                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.data == true) {
                          return ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/landing');
                            },
                            child: const Text('Token Verified! Go to Home'),
                          );
                        } else {
                          return ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/login');
                            },
                            child: const Text('Invalid Token! Go to Login'),
                          );
                        }
                      },
                    ),
                  ],
                ),
      ),
    );
  }

  Future<bool> _verifyToken(String token) async {
    await Future.delayed(const Duration(seconds: 2));
    // Simulate verification logic
    return token.isNotEmpty; // Replace with real backend call
  }
}
