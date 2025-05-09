import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/service/network_handler.dart';

class VerifyTokenController extends GetxController {
  var isLoading = true.obs;
  var isSuccess = false.obs;
  var isError = false.obs;
  var errorMessage = ''.obs;

  Future<void> verifyToken(String token) async {
    try {
      isLoading.value = true;
      isError.value = false;

      final response = await NetworkHandler.get('verifyMagicLink?token=$token');
      final data = jsonDecode(response);

      if (data['success'] == true) {
        isSuccess.value = true;
        await Future.delayed(const Duration(seconds: 1));
        Get.toNamed('/landing');
      } else {
        isSuccess.value = false;
        errorMessage.value = 'Invalid token!';
        isError.value = true;
      }
    } catch (e) {
      isError.value = true;
      errorMessage.value = 'Server error occurred!';
      print('VerifyTokenController error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
