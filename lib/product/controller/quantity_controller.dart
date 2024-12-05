// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:get/get.dart';

class QuantityController extends GetxController {
  var selectedNum = ''.obs;

  final List<String> nums = ['1', '2', 'x'];

  void updateNum(String? newNum) {
    if (newNum != null) {
      selectedNum.value = newNum;
    }
  }
}
