// ignore_for_file: prefer_const_constructors

import 'package:fashura/features/home/widgets/home_card_list_view.dart';
import 'package:fashura/features/home/widgets/notif_cart.dart';
import 'package:fashura/features/profile/widgets/profile_menu.dart';
import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:fashura/util/sizes.dart';
import 'package:fashura/util/spacing_styles.dart';
import 'package:fashura/util/widget/appbar.dart';
import 'package:fashura/util/widget/primary_header_nongradient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreProfile extends StatelessWidget {
  const StoreProfile(
      {super.key,
      required this.storeName,
      required this.img,
      required this.desc});

  final String storeName;
  final String img;
  final String desc;

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
                  StoreAppbar(
                    storeName: storeName,
                  ),
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
                  const SizedBox(height: 48),
                ],
              ),
            ),
            Padding(
              padding: TSpacingCustomStyle.paddingWithCustomTopBottom(10, 0),
              child: Column(
                children: [
                  Text(
                    storeName,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: dark ? Colors.white : TColors.brown8,
                        ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      // If index is less than rating, show a full star; otherwise, an empty star
                      return Icon(
                        index < 4 ? Icons.star : Icons.star_border,
                        size: 24.0, // Adjust size as needed
                        color: index < 4
                            ? Colors.amber
                            : Colors.grey, // Optional: use color
                      );
                    }),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    desc,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: dark ? Colors.white : TColors.brown8,
                        fontSize: TSizes.fontSizeMd),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Card(
                    color: TColors.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(
                            'Highlights',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: dark ? Colors.white : Colors.white,
                                    fontSize: TSizes.fontSizeSm),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          HomeCardListView(),
                        ],
                      ),
                    ),
                  ),
                  TProfileMenu(
                    title: 'Available Vouchers',
                    state: '5*',
                    icon: Icons.card_giftcard,
                    onPressed: () {},
                  ),
                  TProfileMenu(
                    title: 'Product Catalogue',
                    state: '',
                    icon: Icons.shopping_cart_outlined,
                    onPressed: () {},
                  ),
                  TProfileMenu(
                    title: 'Rating & Reviews',
                    state: '',
                    icon: Icons.star,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 64,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreAppbar extends StatelessWidget {
  const StoreAppbar({super.key, required this.storeName});

  final String storeName;

  @override
  Widget build(BuildContext context) {
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
          storeName,
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
