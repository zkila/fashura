// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fashura/home/widgets/notif_cart.dart';
import 'package:fashura/navigation_menu.dart';
import 'package:fashura/util/colors.dart';
import 'package:fashura/util/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();
    return TAppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     // SizedBox(height: 16),
          //     Text("Fashura",
          //         style: Theme.of(context)
          //             .textTheme
          //             .headlineMedium!
          //             .apply(color: TColors.white, fontWeightDelta: 0)),
          //     Text("Selamat Datang, $username",
          //         style: Theme.of(context)
          //             .textTheme
          //             .headlineSmall!
          //             .apply(color: TColors.white, fontWeightDelta: -1))
          //   ],
          // ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  controller.selectedIndex.value = 2;
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: const Image(
                    image: AssetImage('assets/temp/ava1.png'),
                    fit: BoxFit.fill,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text("Selamat Datang, Rizky",
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                      color: TColors.white,
                      fontWeightDelta: -1,
                      fontSizeDelta: -2)),
            ],
          ),
          NotifCart()
        ],
      ),
    );
  }
}
