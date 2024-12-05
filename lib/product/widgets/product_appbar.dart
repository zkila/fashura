// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:fashura/util/sizes.dart';
import 'package:fashura/util/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAppbar extends StatelessWidget {
  ProductAppbar({
    super.key,
    required this.produk,
  });

  final String produk;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TAppBar(
        title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                size: 32,
                color: TColors.white,
              ),
            ),
            const SizedBox(width: 40 - 32),
          ],
        ),
        Text(
          produk,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: dark ? Colors.white : Colors.white,
              ),
        ),
        Stack(
          alignment: Alignment.topRight,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: TSizes.iconLg,
            ),
            Positioned(
              right: 0,
              top: -5,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '5', // Cart item count
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
