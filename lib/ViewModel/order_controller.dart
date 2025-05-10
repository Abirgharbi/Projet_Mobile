import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_ecommerce_meuble/Model/cart_model.dart';
import 'package:projet_ecommerce_meuble/Model/product_card_model.dart';
import 'package:projet_ecommerce_meuble/Model/product_model.dart';
import 'package:projet_ecommerce_meuble/ViewModel/product_controller.dart';
import 'package:projet_ecommerce_meuble/utils/colors.dart';
import 'package:projet_ecommerce_meuble/utils/shared_preferences.dart';

import '../Model/order_model.dart';

import '../Model/service/network_handler.dart';

var productController = Get.put(ProductController());

class OrderController extends GetxController {

  RxBool exist = false.obs;
  late Cart foundProduct;
  RxDouble orderSum = 0.0.obs;
  double orderCost = 0.0;
  RxString message = "".obs;
  RxList productCarts = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void addToCart(Product product) {
    Cart cart = Cart(product: product);
    if (product.quantity! > 0) {
      product.quantity = product.quantity! - 1;

      verifyProductExistence(cart);
      if (exist.isTrue) {
        final index = productCarts.indexOf(foundProduct);
        productCarts[index].quantity = productCarts[index].quantity + 1;
        exist.value = false;
      } else {
        productCarts.add(cart);
        sharedPrefs.setStringList(
          "cart",
          productCarts.map((e) => jsonEncode(e.toJson())).toList(),
        );
      }

      orderSum.value = 0.0; 
      orderCost = 0.0; 

      for (var i = 0; i < productCarts.length; i++) {
        orderSum.value +=
            productCarts[i].product.price * productCarts[i].quantity;
        sharedPrefs.setPref('orderSum', orderSum.value.toString());

        orderCost +=
            productCarts[i].product.productCost! * productCarts[i].quantity;
      }
    } else {
      Get.snackbar("Error", "Product out of stock");
    }
  }

  void decreaseQuantity(Product product) {
    Cart cart = Cart(product: product);

    product.quantity = product.quantity! + 1;

    final index = productCarts.indexOf(foundProduct);

    productCarts[index].quantity -= 1;

    orderSum.value -= product.price;
    sharedPrefs.setPref('orderSum', orderSum.value.toString());

    orderCost -= product.productCost!;
  }

  void verifyProductExistence(Cart cart) {
    exist.value = false;

    for (var i = 0; i < productCarts.length; i++) {
      if (productCarts[i].product.id == cart.product.id) {
        exist.value = true;
        foundProduct = productCarts[i];
        break;
      }
    }
  }
}
