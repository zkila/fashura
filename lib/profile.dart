import 'package:fashura/login.dart';
import 'package:fashura/util/colors.dart';
import 'package:fashura/util/sizes.dart';
import 'package:fashura/util/spacing_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: TSpacingCustomStyle.paddingWithCustomTopBottom(150, 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: TSizes.spaceBtwSections),
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
        ));
  }
}
