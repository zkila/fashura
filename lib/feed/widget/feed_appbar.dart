import 'package:fashura/navigation_menu.dart';
import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:fashura/util/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TScheduleAppBar extends StatelessWidget {
  const TScheduleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();
    final dark = THelperFunctions.isDarkMode(context);

    return TAppBar(
        title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Text(
          'Feed',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: dark ? Colors.white : Colors.white,
              ),
        ),
        const SizedBox(
          width: 32,
        )
      ],
    ));
  }
}
