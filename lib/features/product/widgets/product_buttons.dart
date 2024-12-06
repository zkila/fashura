// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fashura/util/colors.dart';
import 'package:fashura/util/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductButtons extends StatelessWidget {
  const ProductButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            // Get.to(const ScannerScreen());
            debugPrint('tes add cart');
            Get.snackbar('Success!', 'Added to Cart');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.primary,
            elevation: 3,
            shadowColor: TColors.black,
            side: BorderSide.none,
          ).copyWith(
              elevation: WidgetStateProperty.resolveWith<double>((states) {
            if (states.contains(WidgetState.pressed)) {
              return 0;
            }
            return 3;
          })),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.add_shopping_cart_rounded,
                color: Colors.white,
                size: TSizes.iconLg,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Add to Cart!',
                style: Theme.of(context).textTheme.headlineSmall!.apply(
                      color: TColors.white,
                      fontWeightDelta: -1,
                      fontSizeDelta: -3,
                    ),
              ),
              SizedBox(
                width: 12,
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.brown8,
            elevation: 3,
            shadowColor: TColors.black,
            side: BorderSide.none,
          ).copyWith(
              elevation: WidgetStateProperty.resolveWith<double>((states) {
            if (states.contains(WidgetState.pressed)) {
              return 0;
            }
            return 3;
          })),
          onPressed: () {
            // Get.to(const ScannerScreen());
            debugPrint('tes add cart');
            Get.snackbar(
              'Error!',
              'Sorry, not available yet',
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.shopping_cart_checkout_rounded,
                color: Colors.white,
                size: TSizes.iconLg,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Checkout',
                style: Theme.of(context).textTheme.headlineSmall!.apply(
                      color: TColors.white,
                      fontWeightDelta: -1,
                      fontSizeDelta: -3,
                    ),
              ),
              SizedBox(
                width: 12,
              ),
            ],
          ),
        )
      ],
    );
  }
}
