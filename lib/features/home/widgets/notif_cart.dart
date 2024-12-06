// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fashura/util/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifCart extends StatelessWidget {
  const NotifCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.snackbar(
          'Error!',
          'Sorry, not available yet',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      },
      child: Row(
        children: [
          // Notifications icon with badge
          Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(
                Icons.notifications,
                color: Colors.white,
                size: TSizes.iconLg,
              ),
              Positioned(
                right: 0,
                top: -5,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '3', // Notification count
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16), // Add some spacing between icons
          // Shopping cart icon with badge
          Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: TSizes.iconLg,
              ),
              Positioned(
                right: 0,
                top: -5,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '5', // Cart item count
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
