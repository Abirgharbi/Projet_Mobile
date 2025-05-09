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
    // TODO: implement onInit
    super.onInit();

    // Fetch data from SharedPreferences and set text controllers
    name.text = await sharedPrefs.getPref('customerName') ?? '';
    phoneNumber.text = await sharedPrefs.getPref('customerPhoneNumber') ?? '';
  }

  void updateProfile(String? imageUrl) async {
    // Get customer email from SharedPreferences
    final customerEmail = await sharedPrefs.getPref('customerEmail');

    // Create a new CustomerModel with the updated data
    CustomerModel customerModel = CustomerModel(
      name: name.text,
      email: customerEmail,
      image: imageUrl, // Nullable image URL
      phone: phoneNumber.text,
    );

    // Fetch customer ID from SharedPreferences
    final id = await sharedPrefs.getPref('customerId');

    // Send a PUT request to update the profile on the server
    var response = await NetworkHandler.put(
      customerModelToJson(customerModel),
      "user/customer/update/$id",
    );

    // Update SharedPreferences with the new data
    sharedPrefs.setPref('customerName', name.text);

    // Check if imageUrl is not null before saving
    if (imageUrl != null) {
      sharedPrefs.setPref('customerImage', imageUrl); // Only set if not null
    } else {
      sharedPrefs.setPref(
        'customerImage',
        '',
      );
    }

    sharedPrefs.setPref('customerPhoneNumber', phoneNumber.text);


  }
}
