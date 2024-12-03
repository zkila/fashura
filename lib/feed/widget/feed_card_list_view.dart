// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fashura/feed/controller/feed_controller.dart';
import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:fashura/util/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedCardListView extends StatelessWidget {
  final FeedListController listPerbaikanController =
      Get.put(FeedListController());

  FeedCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Obx(
        () {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: listPerbaikanController.listPerbaikan.length,
            itemBuilder: (context, index) {
              var itemPerbaikan = listPerbaikanController.listPerbaikan[index];
              return GestureDetector(
                onTap: () {
                  debugPrint('pencet ${itemPerbaikan.username}');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double
                          .infinity, // You can set a specific width if needed
                      height: 60, // Set a height for the stack
                      child: Stack(
                        children: [
                          // Positioned Container to the right of the image
                          Positioned(
                            top: 14,
                            left: 14,
                            child: Container(
                              decoration: BoxDecoration(
                                color: TColors.brown1, // Background color
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
                                  child: Text(
                                    '         ${itemPerbaikan.username}',
                                    style: TextStyle(color: TColors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // ClipRRect for the image, positioned to the left
                          Positioned(
                            top: 8,
                            left: 8, // Position the image on the left
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  50), // Match the shadow's border radius
                              child: Image(
                                image: AssetImage(itemPerbaikan.imagePath),
                                fit: BoxFit.cover,
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: TSizes.sm),
                        color: dark ? TColors.darkerGrey : TColors.lightGrey,
                        elevation: 4,
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          width: double
                              .infinity, // Adjust width for horizontal layout
                          height: 260, // Take full height
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: TSizes.md),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          itemPerbaikan.imagePath,
                                          width: 120,
                                          height: 150,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Icon(Icons.broken_image,
                                                size: 80);
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width: TSizes
                                            .sm), // Add horizontal space between image and text
                                    Expanded(
                                      // Wrap the text with Expanded widget
                                      child: Text(
                                        itemPerbaikan.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: TSizes.fontSizeLg,
                                        ),
                                        softWrap: true, // Enable soft wrapping
                                        maxLines:
                                            4, // Optional: limit to 2 lines
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              50), // Match the ClipRRect's border radius
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                  0.25), // Shadow color
                                              spreadRadius:
                                                  1, // Controls the spread of the shadow
                                              blurRadius:
                                                  5, // Controls the blur intensity of the shadow
                                              offset: Offset(0,
                                                  4), // Horizontal and vertical offset of the shadow
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              50), // Match the shadow's border radius
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/temp/ava1.png'),
                                            fit: BoxFit.cover,
                                            height: 50,
                                            width: 50,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 10, // 40% of the width
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: TColors
                                              .brown1, // Background color
                                          borderRadius: BorderRadius.circular(
                                              50), // Optional: rounded corners
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                  0.2), // Shadow color
                                              blurRadius: 5, // Shadow blur
                                              offset: Offset(0,
                                                  4), // Shadow position (X, Y)
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              'comment...',
                                              style: TextStyle(
                                                  color: TColors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: TSizes.lg)
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
