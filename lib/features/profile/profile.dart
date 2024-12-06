// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fashura/features/login/login.dart';
import 'package:fashura/features/profile/widgets/profile_card.dart';
import 'package:fashura/features/profile/widgets/profile_menu.dart';
import 'package:fashura/features/profile/widgets/profile_app_bar.dart';
import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:fashura/util/sizes.dart';
import 'package:fashura/util/widget/primary_header_nongradient.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        TPrimaryHeaderContainerNonGradient(
          child: Column(
            children: const [
              TProfileAppBar(),
              SizedBox(
                height: 36,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: TSizes.md, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: dark
                            ? TColors.black
                            : TColors.brown1, // Background color
                        borderRadius: BorderRadius.circular(
                            50), // Optional: rounded corners
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.2), // Shadow color
                            blurRadius: 5, // Shadow blur
                            offset: Offset(0, 4), // Shadow position (X, Y)
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Rizky Maulana',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .apply(
                                  color: dark ? TColors.white : TColors.black,
                                  fontWeightDelta: 0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: TSizes.spaceBtwItems * 1),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Outer gradient circle
                        Container(
                          height: 88, // Slightly larger than the image
                          width: 88,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                TColors.brown1,
                                TColors.brown8,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                        // Inner image with rounded corners
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image(
                            image: AssetImage('assets/temp/ava1.png'),
                            fit: BoxFit.fill,
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              ProfileCard(
                dark: dark,
                icon1: Icons.wallet_rounded,
                icon2: Icons.wallet_giftcard_rounded,
                icon3: Icons.currency_exchange,
                title: 'Wallet & Others',
                text1: 'Wallet',
                text2: 'Coupons',
                text3: 'Coins',
                function: () => debugPrint('tes'),
              ),
              const Divider(),
              ProfileCard(
                dark: dark,
                icon1: Icons.shopping_bag_rounded,
                icon2: Icons.local_shipping_rounded,
                icon3: Icons.stars,
                title: 'Orders & Others',
                text1: 'Packed',
                text2: 'Delivered',
                text3: 'Rated',
                function: () => debugPrint('tes'),
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TProfileMenu(
                title: 'Start Selling!',
                state: 'Free Registration',
                icon: Entypo.bag,
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Fashura Member',
                state: 'Member: Classic',
                icon: Icons.card_membership_rounded,
                onPressed: () {
                  debugPrint('stuff');
                },
              ),
              TProfileMenu(
                title: 'Favorites',
                state: '12',
                icon: FontAwesome.heart,
                onPressed: () {
                  debugPrint('stuff');
                },
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    Get.offAll(() => LoginPage());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.error,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(TSizes.borderRadiusLg),
                    ),
                    elevation: 3,
                    shadowColor: TColors.black,
                    side: BorderSide.none,
                  ).copyWith(
                    elevation:
                        WidgetStateProperty.resolveWith<double>((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return 0;
                      }
                      return 3;
                    }),
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.logout),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),
                      Text(
                        'Sign Out',
                        style: Theme.of(context).textTheme.headlineSmall!.apply(
                              color: TColors.white,
                              fontWeightDelta: -1,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
