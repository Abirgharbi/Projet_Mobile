import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:projet_ecommerce_meuble/ViewModel/order_controller.dart';
import 'package:projet_ecommerce_meuble/ViewModel/product_controller.dart';
import 'package:projet_ecommerce_meuble/ViewModel/signup_controller.dart';
import 'package:projet_ecommerce_meuble/Views/screens/checkOut/cart_screen.dart';
import 'package:projet_ecommerce_meuble/Views/screens/profil_page/profil_page.dart';

import '../../Model/product_model.dart';
import '../../ViewModel/login_controller.dart';
import '../../utils/colors.dart';
import '../../utils/shared_preferences.dart';
import 'Home/home_page.dart';
import 'package:badges/badges.dart' as badges;

import 'favorite_screen.dart';

final loginController = Get.put(LoginController());
final signUpController = Get.put(SignupScreenController());
final orderController = Get.put(OrderController());
final productController = Get.put(ProductController());

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, this.yes});
  final bool? yes;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // List<Product> addedProducts = [];
  // List<String> productsCart = [];
  @override
  void initState() {
    super.initState();
    // getWhishlist();
  }

  // getWhishlist() async {
  //   productsCart = await sharedPrefs.getStringList("cart");
  //   addedProducts =
  //       productsCart.map((e) => Product.fromJson(jsonDecode(e))).toList();
  //   setState(() {
  //     addedProducts = addedProducts;
  //   });
  // }

  int currentIndex = 0;

  static List<Widget> pages = [
    const HomeScreen(),
    CartScreen(),
    const favorite(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          gap: 8,
          selectedIndex: currentIndex,
          onTabChange: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          activeColor: MyColors.btnBorderColor,
          tabBackgroundColor: Colors.grey.shade100,
          tabs: [
            const GButton(icon: Icons.home, text: "Home"),
            GButton(icon: Icons.shopping_cart_outlined, text: "Cart"),
            GButton(icon: Icons.shopping_cart_outlined, text: "Cart"),
            const GButton(icon: Icons.person_outline, text: "Profile"),
          ],
        ),
      ),
      body: pages[currentIndex],
    );
  }
}
