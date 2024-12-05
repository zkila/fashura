// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fashura/product/controller/quantity_controller.dart';
import 'package:fashura/product/controller/size_selector_controller.dart';
import 'package:fashura/product/controller/variation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductFilter extends StatelessWidget {
  const ProductFilter({
    super.key,
    required this.sizeController,
    required this.varController,
    required this.quantityController,
  });

  final SizeSelectorController sizeController;
  final VariationController varController;
  final QuantityController quantityController;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
          verticalInside: BorderSide.none, horizontalInside: BorderSide.none),
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Text(
              'Size/Type',
              style: TextStyle(fontSize: 16),
            ),
            Obx(() {
              return DropdownButton<String>(
                value: sizeController.selectedSize.value.isEmpty
                    ? null
                    : sizeController.selectedSize.value,
                hint: Text('Select size'),
                items: sizeController.sizes
                    .map((size) => DropdownMenuItem<String>(
                          value: size,
                          child: Text(size),
                        ))
                    .toList(),
                onChanged: sizeController.updateSize,
              );
            })
          ],
        ),
        TableRow(
          children: <Widget>[
            Text(
              'Color/Variation',
              style: TextStyle(fontSize: 16),
            ),
            Obx(() {
              return DropdownButton<String>(
                value: varController.selectedVar.value.isEmpty
                    ? null
                    : varController.selectedVar.value,
                hint: Text('Select var'),
                items: varController.vars
                    .map((size) => DropdownMenuItem<String>(
                          value: size,
                          child: Text(size),
                        ))
                    .toList(),
                onChanged: varController.updateVar,
              );
            })
          ],
        ),
        TableRow(
          children: <Widget>[
            Text(
              'Quantity',
              style: TextStyle(fontSize: 16),
            ),
            Obx(() {
              return DropdownButton<String>(
                value: quantityController.selectedNum.value.isEmpty
                    ? null
                    : quantityController.selectedNum.value,
                hint: Text('Select quan'),
                items: quantityController.nums
                    .map((size) => DropdownMenuItem<String>(
                          value: size,
                          child: Text(size),
                        ))
                    .toList(),
                onChanged: quantityController.updateNum,
              );
            })
          ],
        ),
      ],
    );
  }
}
