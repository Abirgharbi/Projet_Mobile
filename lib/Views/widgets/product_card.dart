import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../Model/product_model.dart';
import '../../ViewModel/product_controller.dart';

import 'package:get/get.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    required this.product,
    super.key,
  });
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

bool isLiked = false;
var productController = Get.put(ProductController());

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
