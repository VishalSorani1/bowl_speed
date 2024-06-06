
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/controllers/unit_conversion_controller.dart';

class CustomOutputDropdown extends StatelessWidget {
  const CustomOutputDropdown(
      {super.key,
      required this.dropdownValue,
      required this.dropdownItems,
      this.dropdownonChanged,
      required this.result});

  final String result;
  final String dropdownValue;
  final List<String> dropdownItems;

  final void Function(String?)? dropdownonChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 5,
          child: DropdownButton<String>(
            value: dropdownValue,
            items: dropdownItems.map((String unit) {
              return DropdownMenuItem<String>(
                value: unit,
                child: Text(unit),
              );
            }).toList(),
            onChanged: dropdownonChanged,
          ),
        ),
        SizedBox(width: 6),
        Flexible(
          flex: 4,
          child: GetBuilder<UnitConversionController>(
              builder: (context) {
                return TextField(
                  readOnly: true,
                  decoration:
                      InputDecoration(labelText: result, enabled: false),
                );
              }),
        ),
      ],
    );
  }
}
