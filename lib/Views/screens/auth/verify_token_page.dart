import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../ViewModel/verify_token_controller.dart';

class VerifyTokenPage extends StatelessWidget {
  const VerifyTokenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final String? token = args != null ? args['token'] : null;

    final controller = Get.put(VerifyTokenController());

    // Verify the token if it's not null
    if (token != null) {
      controller.verifyToken(token);
    }
    print("Token: $token"); // Debug print
    return Scaffold(
      appBar: null, // Removed the AppBar to hide the navbar
      body: Center(
        child:
            token == null
                ? const Text("Server Error: No token found.")
                : Obx(() {
                  if (controller.isLoading.value) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.orange,
                          ), // Set loading color to orange
                        ),
                        SizedBox(height: 16),
                        Text('Verifying your account...'),
                      ],
                    );
                  } else if (controller.isError.value) {
                    // Automatically navigate to login if there's an error
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Get.offAllNamed('/login'); // Navigate to login
                    });

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.errorMessage.value,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    );
                  } else if (controller.isSuccess.value) {
                    // Automatically navigate to landing page if success
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Get.offAllNamed('/landing'); // Navigate to landing
                    });

                    return const Text(
                      "KOA Home , C'est chez toi ou Quoi ?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    return const Text("Unexpected state.");
                  }
                }),
      ),
    );
  }
}
