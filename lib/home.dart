import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:fashura/util/primary_header_container.dart';
import 'package:fashura/util/sizes.dart';
import 'package:fashura/util/widget/appbar.dart';
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
                  const HomeAppbar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
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
                    Icons.auto_awesome,
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
            const SizedBox(height: 6),
            // ElevatedButton(
            //     onPressed: () {
            //       responseController.initializeUrl();
            //       responseController.fetchData();
            //     },
            //     child: Text('bro')),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.md),
              child: Column(
                children: [
                  // HomeCardListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    var username = "admin";
    return TAppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 16),
              Text("Fashura",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: TColors.white, fontWeightDelta: 0)),
              Text("Selamat Datang, $username",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white, fontWeightDelta: -1))
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: const Image(
              image: AssetImage('assets/temp/ava1.png'),
              fit: BoxFit.fill,
              height: 50,
              width: 50,
            ),
          )
        ],
      ),
    );
  }
}
