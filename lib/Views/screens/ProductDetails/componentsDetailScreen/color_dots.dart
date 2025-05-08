
import 'package:flutter/material.dart';
import 'package:projet_ecommerce_meuble/utils/color_utils.dart';

import 'package:projet_ecommerce_meuble/utils/colors.dart';
import 'package:projet_ecommerce_meuble/utils/sizes.dart';


import '../../../../Model/product_model.dart';

class ColorImage extends StatefulWidget {
  const ColorImage({
    super.key,
    this.color,
    this.isSelected = false,
    required this.product,
  });
  final Color? color;
  final bool isSelected;
  final Product product;

  @override
  State<ColorImage> createState() => ColorImageState();
}

class ColorImageState extends State<ColorImage> {
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gHeight / 20),
      child: Row(
        children: [
          ...List.generate(
              widget.product.colors.length,
              (index) => productPreview(index,
                  ColorUtils.stringToColor(widget.product.colors[index]))),
        ],
      ),
    );
  }

  GestureDetector productPreview(int index, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 2),
        padding: EdgeInsets.all((8 / 375.0) * gWidth),
        height: (40 / 375.0) * gWidth,
        width: (40 / 375.0) * gWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              color: MyColors.btnBorderColor
                  .withOpacity(selectedColor == index ? 1 : 0)),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
                color: widget.isSelected
                    ? MyColors.btnBorderColor
                    : Colors.transparent),
            shape: BoxShape.circle,
          ),
        ),
      ),

      //widget.product.images[index]
    );
  }
}
