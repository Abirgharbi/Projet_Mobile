import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_ecommerce_meuble/ViewModel/signup_controller.dart';

import '../../../Model/service/network_handler.dart';
import '../../../ViewModel/login_controller.dart';

import '../../../utils/colors.dart';
import '../../../utils/sizes.dart';
import '../../widgets/form_textfiled.dart';

var loginController = Get.put(LoginController());
var signUpController = Get.put(SignupScreenController());

const String apiKey = '674684268545591';
const String apiSecret = 'QbAEIGv7obzNQFMgfVCIwXQnKLs';
const String cloudName = 'dbkivxzek';
const String folder = 'ARkea';
const String uploadPreset = 'ARkea-dashboard';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }


}

