// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fashura/features/courses/controller/courses_controller.dart';
import 'package:fashura/features/feed/feed.dart';
import 'package:fashura/features/home/widgets/notif_cart.dart';
import 'package:fashura/navigation_menu.dart';

import 'package:fashura/util/colors.dart';
import 'package:fashura/util/helper_functions.dart';
import 'package:fashura/util/widget/appbar.dart';
import 'package:fashura/util/widget/primary_header_nongradient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/sizes.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      // === Custom Header ===
      TPrimaryHeaderContainerNonGradient(
        child: Column(
          children: [
            const CoursesAppbar(),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
      FeedFilter(),
      SizedBox(
        height: TSizes.md,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
        child: Column(
          children: [
            CoursesCardListView(),
          ],
        ),
      ),
    ])));
  }
}

class CoursesAppbar extends StatelessWidget {
  const CoursesAppbar({
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
          'Courses',
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

class CoursesCardListView extends StatelessWidget {
  final CoursesController listCoursesController = Get.put(CoursesController());

  CoursesCardListView({super.key});

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
            itemCount: listCoursesController.listPerbaikan.length,
            itemBuilder: (context, index) {
              var itemPerbaikan = listCoursesController.listPerbaikan[index];
              return GestureDetector(
                onTap: () {
                  debugPrint('pencet ${itemPerbaikan.author}');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CourseAuthor(itemPerbaikan: itemPerbaikan),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                      child:
                          CoursePost(dark: dark, itemPerbaikan: itemPerbaikan),
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

class CourseAuthor extends StatelessWidget {
  const CourseAuthor({
    super.key,
    required this.itemPerbaikan,
  });

  final Courses itemPerbaikan;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // You can set a specific width if needed
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
                borderRadius:
                    BorderRadius.circular(50), // Optional: rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
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
                    '         ${itemPerbaikan.author}',
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
              borderRadius:
                  BorderRadius.circular(50), // Match the shadow's border radius
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
    );
  }
}

class CoursePost extends StatelessWidget {
  const CoursePost({
    super.key,
    required this.dark,
    required this.itemPerbaikan,
  });

  final bool dark;
  final Courses itemPerbaikan;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: TSizes.sm),
      color: dark ? TColors.darkerGrey : TColors.lightGrey,
      elevation: 4,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: double.infinity, // Adjust width for horizontal layout
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
                    padding: const EdgeInsets.only(right: TSizes.md),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        itemPerbaikan.imagePath,
                        width: 120,
                        height: 150,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.broken_image, size: 80);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                      width: TSizes
                          .sm), // Add horizontal space between image and text
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: 160, maxHeight: 140), // Set a maximum height
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemPerbaikan.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: TSizes.fontSizeLg,
                          ),
                          softWrap: true,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8), // Optional spacing
                        Text(
                          itemPerbaikan.duration,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: TSizes.fontSizeSm,
                          ),
                          softWrap: true,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: List.generate(5, (index) {
                            // If index is less than rating, show a full star; otherwise, an empty star
                            return Icon(
                              index < itemPerbaikan.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              size: 24.0, // Adjust size as needed
                              color: index < itemPerbaikan.rating
                                  ? Colors.amber
                                  : Colors.grey, // Optional: use color
                            );
                          }),
                        )
                      ],
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
                  SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            50), // Match the ClipRRect's border radius
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.25), // Shadow color
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
                          image: AssetImage('assets/temp/ava1.png'),
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
                        color: TColors.brown1, // Background color
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
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'comment...',
                            style: TextStyle(color: TColors.black),
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
    );
  }
}
