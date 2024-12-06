// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:get/get.dart';

class SizeSelectorController extends GetxController {
  var selectedSize = ''.obs;

  final List<String> sizes = ['Small', 'Medium', 'Large'];

  void updateSize(String? newSize) {
    if (newSize != null) {
      selectedSize.value = newSize;
    }
  }
}
