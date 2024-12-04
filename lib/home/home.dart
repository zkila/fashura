// ignore_for_file: prefer_const_constructors

import 'package:fashura/home/widgets/home_appbar.dart';
import 'package:fashura/home/widgets/home_card_list_view.dart';
import 'package:fashura/home/widgets/home_menu_buttons.dart';
import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:fashura/util/widget/primary_header_container.dart';
import 'package:fashura/util/sizes.dart';
import 'package:fashura/util/widget/textfield.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> buttonData = [
    {
      'icon': Icons.store_mall_directory_rounded,
      'text': 'Store',
      'function': () {
        // Get.to(() => Report());
        debugPrint('store');
      },
    },
    {
      'icon': Icons.menu_book_rounded,
      'text': 'Catalogue',
      'function': () {
        // Get.to(() => Report());
        debugPrint('catalogue');
      },
    },
    {
      'icon': Icons.insert_drive_file,
      'text': 'Documents',
      'function': () {
        // Get.to(() => BeritaAcara());
        debugPrint('documents');
      },
    },
    {
      'icon': Icons.assignment_ind_outlined,
      'text': 'Courses',
      'function': () {
        // Get.to(() => ListAssets());
        debugPrint('courses');
      },
    },
    {
      'icon': Icons.spatial_audio_off,
      'text': 'Campaign',
      'function': () {
        // Get.to(() => Report());
        debugPrint('campaign');
      },
    },
    {
      'icon': Icons.settings,
      'text': 'Settings',
      'function': () {
        // Get.to(() => Approval());
        debugPrint('settings');
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // === Custom Header ===
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const SizedBox(height: TSizes.spaceBtwSections),
                  HomeAppbar(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: TSizes.md, vertical: TSizes.sm),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 10, // 60% of the width
                            child: Container(
                              decoration: BoxDecoration(
                                color: dark
                                    ? TColors.brown7
                                    : TColors.brown1, // Background color
                                borderRadius: BorderRadius.circular(
                                    50), // Optional: rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // Shadow color
                                    blurRadius: 5, // Shadow blur
                                    offset:
                                        Offset(0, 4), // Shadow position (X, Y)
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text('Coins: 900'),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 7, // 40% of the width
                            child: Container(
                              decoration: BoxDecoration(
                                color: dark
                                    ? TColors.brown7
                                    : TColors.brown1, // Background color
                                borderRadius: BorderRadius.circular(
                                    50), // Optional: rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // Shadow color
                                    blurRadius: 5, // Shadow blur
                                    offset:
                                        Offset(0, 4), // Shadow position (X, Y)
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text('Coupons: 1'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                    child: TTextField(
                      hintText: 'Search!',
                      controller: searchController,
                      icon: Icons.search,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                    child: GridView.builder(
                      itemCount: buttonData.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisExtent: 150,
                              mainAxisSpacing: TSizes.gridViewSpacing,
                              crossAxisSpacing: TSizes.gridViewSpacing),
                      itemBuilder: (_, index) {
                        final button = buttonData[index];
                        return HomeMenuButtons(
                          icon: button['icon'],
                          text: button['text'],
                          function: button['function'],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 40)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.access_time_sharp,
                    color: dark ? TColors.brown1 : TColors.primary,
                    size: TSizes.lg,
                  ),
                  const SizedBox(width: TSizes.sm),
                  Text(
                    'New Stuff!',
                    style: TextStyle(
                        color: dark ? TColors.brown1 : TColors.primary,
                        fontSize: TSizes.fontSizeLg,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.md),
            // ElevatedButton(
            //     onPressed: () {
            //       responseController.initializeUrl();
            //       responseController.fetchData();
            //     },
            //     child: Text('bro')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: Column(
                children: [
                  HomeCardListView(),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.md, vertical: TSizes.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.auto_awesome_rounded,
                    color: dark ? TColors.brown1 : TColors.primary,
                    size: TSizes.lg,
                  ),
                  const SizedBox(width: TSizes.sm),
                  Text(
                    'New Deals!',
                    style: TextStyle(
                        color: dark ? TColors.brown1 : TColors.primary,
                        fontSize: TSizes.fontSizeLg,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: Column(
                children: [
                  HomeCardListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
