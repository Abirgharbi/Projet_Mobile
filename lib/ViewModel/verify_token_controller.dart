import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/service/network_handler.dart';

class VerifyTokenController extends GetxController {
  var isLoading = true.obs;
  var isSuccess = false.obs;
  var isError = false.obs;
  var errorMessage = ''.obs;

  Future<void> verifyToken(String token) async {
    try {
      // Check if the token is empty or invalid
      if (token == null || token.isEmpty) {
        errorMessage.value = 'Invalid token!';
        isError.value = true;
        Get.offAllNamed('/login');
        return;
      }

      // Start loading state
      isLoading.value = true;
      isError.value = false; // Reset error state before starting the request.

      // Call the API to verify the token
      final response = await NetworkHandler.get(
        'user/verifyMagicLink?token=$token',
      );
      print('Response: $response'); // Debug print
      final data = jsonDecode(response);
      print('Decoded Data: $data'); // Debug print

      // Check if the response contains success and token
      if (data != null && data['success'] == true) {
        isSuccess.value = true;
        final prefs = await SharedPreferences.getInstance();

        // Save token and customer info to SharedPreferences
        await prefs.setString('token', data['token']);
        await prefs.setString('customerName', data['customer']['name']);
        await prefs.setString('customerEmail', data['customer']['email']);
        await prefs.setString('customerId', data['customer']['_id']);
        // Navigate to the landing page after a slight delay
        await Future.delayed(const Duration(seconds: 1));
        Get.offAllNamed('/landing');
      } else {
        // Handle invalid token
        isSuccess.value = false;
        errorMessage.value = 'Invalid token!';
        isError.value = true;
        Get.offAllNamed('/login');
      }
    } catch (e) {
      // Handle unexpected errors
      print('Error: $e'); // Debug print
      isError.value = true;
      errorMessage.value = 'Server error occurred!';
      Get.offAllNamed('/login');
    } finally {
      isLoading.value = false;
    }
  }
}
