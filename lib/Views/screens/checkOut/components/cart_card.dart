import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_ecommerce_meuble/utils/colors.dart';
import 'package:projet_ecommerce_meuble/utils/sizes.dart';

import '../../../../Model/cart_model.dart';

import '../../../../ViewModel/order_controller.dart';
import '../../../widgets/rounded_icon_btn.dart';

var orderController = Get.put(OrderController());

class CartCard extends StatefulWidget {
  final Cart cart;
  OrderController orderController = Get.put(OrderController());

  CartCard({Key? key, required this.cart}) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
