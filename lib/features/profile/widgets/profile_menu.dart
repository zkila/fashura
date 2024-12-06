// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:fashura/util/sizes.dart';
import 'package:flutter/material.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.title,
    required this.state,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title;
  final String state;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(TSizes.spaceBtwItems / 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: TSizes.iconLg,
                  color: dark ? TColors.white : TColors.black,
                ),
                const SizedBox(width: 15),
                Text(title,
                    // style: Theme.of(context).textTheme.bodySmall,
                    style: TextStyle(
                        color: dark ? TColors.brown1 : TColors.black,
                        fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis),
              ],
            ),
            Row(
              children: [
                Text(
                  state,
                  // style: Theme.of(context).textTheme.bodySmall,
                  style: TextStyle(
                      color: dark ? TColors.brown1 : TColors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: TSizes.fontSizeSm - 2),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
