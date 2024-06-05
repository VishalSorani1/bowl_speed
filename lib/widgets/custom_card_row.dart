// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/quick_tap/quick_tap_screen.dart';
import '../utils/colors.dart';
import 'custom_lable_text.dart';

class CustomCardRow extends StatelessWidget {
  const CustomCardRow({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomLabelText(
            label: label,
            style: GoogleFonts.rubik(
                fontSize: 12,
                color: AppColors.textDarkColor.withOpacity(0.7),
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.only(left: Get.width * 0),
            child: CustomLabelText(
              label: value,
              style:
                  GoogleFonts.rubik(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
