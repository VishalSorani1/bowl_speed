import 'package:bowl_speed/utils/labels.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/controllers/bowler_controller.dart';
import '../utils/colors.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.list,
    required this.label,
  });

  final List<String>? list;
  final String label;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        style: GoogleFonts.rubik(
            color: AppColors.textDarkColor,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          // labelText: 'Select an option',
          filled: true,
          fillColor: AppColors.containerColor,
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.primaryColor1),
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        value: list?[0],
        onChanged: (String? newValue) {
          if (label == Labels.bowlerType) {
            BowlerController.instance
                .setSelectedBowlerType(newValue!);
          } else {
            BowlerController.instance
                .setSelectedBowlerStyle(newValue!);
          }
        },
        items: list!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        validator: (value) =>
            value == null ? 'Please select an option' : null,
      );
  }
}
