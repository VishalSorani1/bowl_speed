// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomInputDropdown extends StatelessWidget {
  const CustomInputDropdown(
      {super.key,
      required this.formController,
      required this.formOnChanged,
      required this.dropdownValue,
      required this.dropdownItems,
      this.dropdownonChanged});

  final String dropdownValue;
  final List<String> dropdownItems;
  final TextEditingController formController;
  final void Function(String)? formOnChanged;
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
            child: TextFormField(
              controller: formController,
              keyboardType: TextInputType.number,
              onChanged: formOnChanged,
            )),
      ],
    );
  }
}
