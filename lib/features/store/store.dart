// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:fashura/features/feed/feed.dart';
import 'package:fashura/features/home/widgets/notif_cart.dart';
import 'package:fashura/features/store/store_profile.dart';
import 'package:fashura/navigation_menu.dart';
import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:fashura/util/sizes.dart';
import 'package:fashura/util/widget/appbar.dart';
import 'package:fashura/util/widget/primary_header_nongradient.dart';
import 'package:fashura/util/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorePage extends StatelessWidget {
  StorePage({super.key});

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // === Custom Header ===
            TPrimaryHeaderContainerNonGradient(
              child: Column(
                children: [
                  const StoreAppbar(),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(height: 6),
                ],
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
            SizedBox(
              height: TSizes.md,
            ),
            FeedFilter(),
            SizedBox(
              height: TSizes.md,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: Column(
                children: [
                  StoreThing(
                    dark: dark,
                    desc:
                        'He has some brand new drops today, and his last few items is also on sale, so check him out!',
                    img: 'assets/temp/model1.jpg',
                    title: 'Recommended Store Today',
                    name: 'OfficialStore',
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  StoreThing(
                    dark: dark,
                    desc:
                        'She just joined today and is already offering a wide selection of goods, all with ensured quality. Check her stuff out!',
                    img: 'assets/temp/model2.jpg',
                    title: 'New Store Today',
                    name: 'LocalStore',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreThing extends StatelessWidget {
  const StoreThing({
    super.key,
    required this.dark,
    required this.desc,
    required this.img,
    required this.title,
    required this.name,
  });

  final bool dark;

  final String title;
  final String img;
  final String desc;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('ke $name');
        Get.to(StoreProfile(
          storeName: name,
          img: img,
          desc: desc,
        ));
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: TSizes.sm),
        color: dark ? TColors.darkerGrey : TColors.lightGrey,
        elevation: 4,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: double.infinity, // Adjust width for horizontal layout
          height: 240, // Take full height
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: TSizes
                            .sm), // Add horizontal space between image and text
                    Expanded(
                      // Wrap the text with Expanded widget
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: TSizes.fontSizeLg,
                        ),
                        softWrap: true, // Enable soft wrapping
                        maxLines: 4, // Optional: limit to 2 lines
                        overflow: TextOverflow
                            .ellipsis, // Optional: add ellipsis if text overflows
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1.5,
                  color: dark ? TColors.brown1 : TColors.brown9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: TSizes.md),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              img,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.broken_image, size: 80);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(name),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      // Wrap the text with Expanded widget
                      child: Text(
                        desc,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: TSizes.fontSizeSm,
                        ),
                        softWrap: true, // Enable soft wrapping
                        maxLines: 6, // Optional: limit to 2 lines
                        overflow: TextOverflow
                            .ellipsis, // Optional: add ellipsis if text overflows
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StoreAppbar extends StatelessWidget {
  const StoreAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<NavigationController>();
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
            const SizedBox(width: 80 - 32),
          ],
        ),
        Text(
          'Store',
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
