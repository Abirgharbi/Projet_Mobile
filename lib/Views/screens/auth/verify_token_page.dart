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

    if (token != null) {
      controller.verifyToken(token);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Verifying Token')),
      body: Center(
        child:
            token == null
                ? const Text("No token received.")
                : Obx(() {
                  if (controller.isLoading.value) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Verifying your token...'),
                      ],
                    );
                  } else if (controller.isError.value) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.errorMessage.value,
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/login');
                          },
                          child: const Text('Back to Login'),
                        ),
                      ],
                    );
                  } else if (controller.isSuccess.value) {
                    return const Text(
                      "Welcome! Redirecting...",
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
