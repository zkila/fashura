// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fashura/home/controller/home_controller.dart';
import 'package:fashura/product/controller/quantity_controller.dart';
import 'package:fashura/product/controller/size_selector_controller.dart';
import 'package:fashura/product/controller/variation_controller.dart';

import 'package:fashura/product/widgets/product_appbar.dart';
import 'package:fashura/product/widgets/product_buttons.dart';
import 'package:fashura/product/widgets/product_filter.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:fashura/util/sizes.dart';
import 'package:fashura/util/spacing_styles.dart';
import 'package:fashura/util/widget/primary_header_nongradient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  final ListCheck homedata;
  final SizeSelectorController sizeController =
      Get.put(SizeSelectorController());
  final VariationController varController = Get.put(VariationController());
  final QuantityController quantityController = Get.put(QuantityController());

  ProductScreen({super.key, required this.homedata});
  final HomeListController responseController = Get.find();

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Obx(() {
        if (responseController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                // === Custom Header ===
                TPrimaryHeaderContainerNonGradient(
                  child: Column(
                    children: [
                      ProductAppbar(
                        produk: homedata.name,
                      ),
                      Padding(
                        padding: TSpacingCustomStyle.paddingWithCustomTopBottom(
                            10, 50),
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            Stack(alignment: Alignment.topRight, children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    TSizes.borderRadiusLg),
                                child: Image.asset(
                                  homedata.imagePath,
                                  height: 300,
                                  width: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
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
                                    homedata.discount, // Discount text
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      TSpacingCustomStyle.paddingWithCustomTopBottom(10, 0),
                  child: Column(
                    children: [
                      Text(
                        homedata.fullName,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: dark ? Colors.white : Colors.white,
                            ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        homedata.price,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: dark ? Colors.white : Colors.white,
                                fontSize: TSizes.fontSizeMd),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        homedata.description,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: dark ? Colors.white : Colors.white,
                                fontSize: TSizes.fontSizeMd),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ProductFilter(
                          sizeController: sizeController,
                          varController: varController,
                          quantityController: quantityController),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      ProductButtons(),
                      SizedBox(
                        height: 64,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
