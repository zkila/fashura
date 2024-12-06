// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fashura/features/feed/widget/feed_appbar.dart';
import 'package:fashura/features/feed/widget/feed_card_list_view.dart';
import 'package:fashura/util/sizes.dart';
import 'package:fashura/util/widget/primary_header_nongradient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // === Custom Header ===
            TPrimaryHeaderContainerNonGradient(
              child: Column(
                children: [
                  const TScheduleAppBar(),
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
                  FeedCardListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: constant_identifier_names
enum FeedFiltereEnum { Trending, New, Top }

class FeedFilter extends StatelessWidget {
  const FeedFilter({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the FilterController instance
    final FilterController filterController = Get.put(FilterController());

    return Container(
      width: double.infinity, // Take up all available horizontal space
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Wrap(
            spacing: 5.0,
            runSpacing:
                5.0, // Adjust the vertical spacing between lines of chips
            children: FeedFiltereEnum.values.map((FeedFiltereEnum exercise) {
              return Obx(() {
                // Observing changes to selectedFilter
                return FilterChip(
                  label: Text(exercise.name),
                  selected: filterController.selectedFilter.value == exercise,
                  onSelected: (bool selected) {
                    // Update the selected filter in the controller
                    filterController.updateFilter(selected ? exercise : null);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Set the radius for rounding
                  ),
                );
              });
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class FilterController extends GetxController {
  var selectedFilter = Rx<FeedFiltereEnum?>(null); // Observable selected filter

  void updateFilter(FeedFiltereEnum? filter) {
    selectedFilter.value = filter;
  }
}
