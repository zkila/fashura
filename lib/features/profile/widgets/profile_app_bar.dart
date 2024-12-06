// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fashura/features/home/widgets/notif_cart.dart';
import 'package:fashura/navigation_menu.dart';
import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:fashura/util/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProfileAppBar extends StatelessWidget {
  const TProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.find<NavigationController>();
    return TAppBar(
        title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                controller.selectedIndex.value = 0;
              },
              child: const Icon(
                Icons.arrow_back,
                size: 32,
                color: TColors.white,
              ),
            ),
            const SizedBox(width: 80 - 32),
          ],
        ),
        Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: dark ? Colors.white : Colors.white,
              ),
        ),
        // const SizedBox(
        //   width: 32,
        // )
        const NotifCart(),
      ],
    ));
  }
}
