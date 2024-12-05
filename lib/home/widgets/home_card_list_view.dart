import 'package:fashura/home/controller/home_controller.dart';
import 'package:fashura/product/product.dart';
import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:fashura/util/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCardListView extends StatelessWidget {
  final HomeListController listPerbaikanController =
      Get.put(HomeListController());

  HomeCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Obx(
        () {
          return SizedBox(
            height: 180, // Set a fixed height for the ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Set horizontal scrolling
              shrinkWrap: true,
              physics:
                  const BouncingScrollPhysics(), // Optional: for smooth scrolling
              itemCount: listPerbaikanController.listPerbaikan.length,
              itemBuilder: (context, index) {
                var itemPerbaikan =
                    listPerbaikanController.listPerbaikan[index];

                return GestureDetector(
                    onTap: () {
                      // Handle on tap action here
                      // debugPrint('pencet ${itemPerbaikan.name}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductScreen(homedata: itemPerbaikan),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                      color: dark ? TColors.darkerGrey : TColors.lightGrey,
                      elevation: 4,
                      clipBehavior: Clip.hardEdge,
                      child: SizedBox(
                        width: 160, // Width for each card
                        height: 360, // Height for each card
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment
                                    .topRight, // Align to the top right
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      itemPerbaikan
                                          .imagePath, // Use Image.asset for assets
                                      width: 200,
                                      height: 120,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.broken_image,
                                            size: 80);
                                      },
                                    ),
                                  ),
                                  // Positioned discount label
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors
                                            .red, // Background color for the discount
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        itemPerbaikan.discount, // Discount text
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: TSizes.sm),
                              Text(
                                itemPerbaikan.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
              },
            ),
          );
        },
      ),
    );
  }
}
