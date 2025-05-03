import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_ecommerce_meuble/ViewModel/order_controller.dart';
import 'package:projet_ecommerce_meuble/utils/sizes.dart';

import '../../../../Model/cart_model.dart';
import '../../../../Model/product_model.dart';
import '../../../../utils/shared_preferences.dart';
import 'cart_card.dart';
import 'check_out_card.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
