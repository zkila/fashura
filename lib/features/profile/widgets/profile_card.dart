// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fashura/util/colors.dart';
import 'package:fashura/util/sizes.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      required this.dark,
      required this.icon1,
      required this.icon2,
      required this.icon3,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.function,
      required this.title});

  final bool dark;
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final String text1;
  final String text2;
  final String text3;
  final String title;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: TSizes.sm),
      color: dark ? TColors.darkerGrey : TColors.lightGrey,
      elevation: 4,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: double.infinity, // Adjust width for horizontal layout
        height: 220, // Take full height
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall!.apply(
                    color: dark ? TColors.brown1 : TColors.primary,
                    fontWeightDelta: 0,
                    fontSizeDelta: -1),
              ),
              Divider(
                thickness: 2,
                color: dark ? TColors.brown1 : TColors.brown9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileCardButton(
                      function: function,
                      dark: dark,
                      icon1: icon1,
                      text1: text1),
                  ProfileCardButton(
                      function: function,
                      dark: dark,
                      icon1: icon2,
                      text1: text2),
                  ProfileCardButton(
                      function: function,
                      dark: dark,
                      icon1: icon3,
                      text1: text3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCardButton extends StatelessWidget {
  const ProfileCardButton({
    super.key,
    required this.function,
    required this.dark,
    required this.icon1,
    required this.text1,
  });

  final VoidCallback function;
  final bool dark;
  final IconData icon1;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: dark ? TColors.dark : TColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 3,
          shadowColor: TColors.black,
          side: BorderSide.none,
        ).copyWith(
          elevation: WidgetStateProperty.resolveWith<double>((states) {
            if (states.contains(WidgetState.pressed)) {
              return 0;
            }
            return 3;
          }),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon1,
              size: TSizes.iconLg * 2,
              color: dark ? TColors.brown1 : TColors.primary,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              text1,
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: dark ? TColors.brown1 : TColors.primary,
                  fontWeightDelta: 0,
                  fontSizeDelta: -4),
            )
          ],
        ),
      ),
    );
  }
}
