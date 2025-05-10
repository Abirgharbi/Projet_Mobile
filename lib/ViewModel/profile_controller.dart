import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projet_ecommerce_meuble/utils/shared_preferences.dart';

import '../Model/customer_model.dart';
import '../Model/service/network_handler.dart';
import '../Views/screens/profil_page/profil_page.dart';

class ProfileController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

  @override
  void onInit() async {
    super.onInit();

    // Fetch data from SharedPreferences and set text controllers
    name.text = await sharedPrefs.getPref('customerName') ?? '';
    phoneNumber.text = await sharedPrefs.getPref('customerPhoneNumber') ?? '';
  }

  Future<bool> updateProfile() async {
    final customerEmail = await sharedPrefs.getPref('customerEmail');
    final id = await sharedPrefs.getPref('customerId');

    if (customerEmail == null || id == null) {
      print("Missing email or ID in shared preferences.");
      return false;
    }

    CustomerModel customerModel = CustomerModel(
      name: name.text,
      email: customerEmail,
      image: null,
      phone: phoneNumber.text,
    );

    var response = await NetworkHandler.put(
      customerModelToJson(customerModel),
      "user/customer/update/$id",
    );

    sharedPrefs.setPref('customerName', name.text);
    sharedPrefs.setPref('customerPhoneNumber', phoneNumber.text);

    return true;
  }
}
