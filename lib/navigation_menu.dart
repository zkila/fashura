import 'package:fashura/feed/feed.dart';
import 'package:fashura/home/home.dart';
import 'package:fashura/profile/profile.dart';
import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
            // if (index == 2) {
            //   final ScheduleController scheduleController = Get.find();
            //   scheduleController.fetchDate(DateTime.now());
            // }
          },
          backgroundColor: darkMode ? TColors.black : TColors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.feed_rounded), label: 'Feed'),
            NavigationDestination(
                icon: Icon(Icons.account_circle), label: 'Profile')
          ],
        ),
      ),
      body: Obx(
        () => controller.screen[controller.selectedIndex.value],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final screen = [
    HomePage(),
    const FeedPage(),
    const ProfilePage(),
  ];
}
