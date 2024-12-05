// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  var selectedVar = ''.obs;

  final List<String> vars = ['Variant 1', 'Variant 2', 'Variant x'];

  void updateVar(String? newVar) {
    if (newVar != null) {
      selectedVar.value = newVar;
      debugPrint(selectedVar.value);
    }
  }
}
