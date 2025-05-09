import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projet_ecommerce_meuble/Model/product_model.dart';
import 'package:projet_ecommerce_meuble/utils/shared_preferences.dart';
import 'package:projet_ecommerce_meuble/utils/sizes.dart';

// import '../../ViewModel/product_controller.dart';
import '../widgets/product_card.dart';

class favorite extends StatefulWidget {
  const favorite({super.key});

  @override
  State<favorite> createState() => _favoriteState();
}

// var productController = Get.put(ProductController());

class _favoriteState extends State<favorite> {
  List<Product> wishlisted = [];
  @override
  void initState() {
    super.initState();
    getWhishlist();
  }

  getWhishlist() async {
    List<String> wishlist = await sharedPrefs.getStringList("wishlist");
    wishlisted = wishlist.map((e) => Product.fromJson(jsonDecode(e))).toList();
    setState(() {
      wishlisted = wishlisted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.toNamed('/landing');
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "favorites",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:
          wishlisted.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/empty-favorite.png',
                      width: gWidth,
                      height: gHeight / 2,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Your favorite list still empty',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
              : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7, // Ajusté pour éviter overflow
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: wishlisted.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = wishlisted[index];
                  return ProductCard(product: product);
                },
              ),
    );
  }
}
