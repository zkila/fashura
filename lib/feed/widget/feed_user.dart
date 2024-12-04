// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fashura/feed/controller/feed_controller.dart';
import 'package:fashura/util/colors.dart';
import 'package:flutter/material.dart';

class FeedUser extends StatelessWidget {
  const FeedUser({
    super.key,
    required this.itemPerbaikan,
  });

  final Feed itemPerbaikan;

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
                    '         ${itemPerbaikan.username}',
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
