
import 'package:flutter/material.dart';

import '../../../../Model/product_model.dart';

class ArScreen extends StatelessWidget {
  final Product product;

  const ArScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        child: AspectRatio(
          aspectRatio: 1,
          child: Hero(
            tag: product.name.toString(),
            child:Text("hello")
            // widget.product.images[selectedImage]
          ),
        ),
      ),
    ]);
  }
}
