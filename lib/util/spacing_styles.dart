import 'package:fashura/util/sizes.dart';
import 'package:flutter/material.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
      top: TSizes.appBarHeight,
      left: TSizes.defaultSpace,
      bottom: TSizes.defaultSpace,
      right: TSizes.defaultSpace);
}

class TSpacingCustomStyle {
  static EdgeInsetsGeometry paddingWithCustomTopBottom(
      double top, double bottom) {
    return EdgeInsets.only(
      top: top,
      left: TSizes.defaultSpace,
      bottom: bottom,
      right: TSizes.defaultSpace,
    );
  }
}
