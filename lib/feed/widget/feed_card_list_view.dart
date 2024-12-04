// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fashura/feed/controller/feed_controller.dart';
import 'package:fashura/feed/widget/feed_post.dart';
import 'package:fashura/feed/widget/feed_user.dart';
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
                    FeedUser(itemPerbaikan: itemPerbaikan),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                      child: FeedPost(dark: dark, itemPerbaikan: itemPerbaikan),
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
