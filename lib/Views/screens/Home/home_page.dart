
import 'package:flutter/material.dart' hide SearchBar;


import 'package:get/get.dart';

import '../../../Model/product_model.dart';
import '../../../ViewModel/product_controller.dart';

import '../../../utils/colors.dart';
import '../../widgets/product_card.dart';
import '../../widgets/search_bar.dart';

var productController = Get.put(ProductController());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> filteredProductList = [];

  @override
  void initState() {
    super.initState();
    // filteredProductList = productController.mostLikedProductList +
    //     productController.recentProductsList;
  }


  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  
}


