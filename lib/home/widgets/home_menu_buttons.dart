import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:fashura/util/sizes.dart';
import 'package:flutter/material.dart';

class HomeMenuButtons extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback function;

  const HomeMenuButtons({
    super.key,
    required this.icon,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SizedBox(
      width: 150,
      height: 150,
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
              icon,
              size: TSizes.iconLg * 2,
              color: dark ? TColors.brown1 : TColors.primary,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              text,
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: dark ? TColors.brown1 : TColors.primary,
                  fontWeightDelta: 0,
                  fontSizeDelta: -3),
            )
          ],
        ),
      ),
    );
  }
}
