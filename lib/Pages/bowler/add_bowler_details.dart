import 'package:bowl_speed/services/controllers/bowler_controller.dart';
import 'package:bowl_speed/services/models/bowler_model.dart';
import 'package:bowl_speed/utils/colors.dart';
import 'package:bowl_speed/widgets/custom_lable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';
import '../../utils/db_helper.dart';
import '../../utils/formate_functions.dart';
import '../../widgets/custom_app_bar.dart';

class AddBowlerDetails extends StatelessWidget {
  const AddBowlerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BowlerController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: StringConstants.addBowler,
        onBack: () {},
        onHistory: () {},
        isHistoryBtnVisible: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CustomFormField(
                label: "Bowler Name",
                controller: controller.nameController,
              ),
              CustomFormField(
                label: "Bowler Age",
                keyboardType: TextInputType.number,
                controller: controller.ageController,
              ),
              CustomFormField(
                label: "Bowler Type",
                isDropDown: true,
                controller: TextEditingController(),
                list: controller.bowlersType,
              ),
              CustomFormField(
                label: "Bowler Style",
                isDropDown: true,
                controller: TextEditingController(),
                list: controller.bowlersStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    BowlerDetails bowler = BowlerDetails(
                        name: controller.nameController.text,
                        age: int.parse(controller.ageController.text),
                        type: controller.selectedBowlerType,
                        style: controller.selectedBowlerStyle,
                        date: formatDateTime(DateTime.now()));
                    await DatabaseHelper.instance.insertBowlerDetails(bowler);
                    controller.getAllBowlers();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all details')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor1.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 14.0,
                  ),
                ),
                child: const Text(
                  "Bowler Detail",
                  style: TextStyle(color: AppColors.textWhiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.label,
    required this.controller,
    this.isDropDown = false,
    this.list,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final bool isDropDown;
  final List<String>? list;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomLabelText(
            label: label,
            style: GoogleFonts.rubik(
                fontSize: 16,
                color: AppColors.textDarkColor.withOpacity(0.7),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          isDropDown
              ? DropdownButtonFormField<String>(
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
                    if (label == "Bowler Type") {
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
                )
              : TextFormField(
                  keyboardType: keyboardType,
                  autofocus: false,
                  controller: controller,
                  cursorColor: AppColors.primaryColor1,
                  cursorErrorColor: Colors.red,
                  decoration: InputDecoration(
                    hintText: label,
                    hintStyle: GoogleFonts.rubik(
                        fontSize: 14,
                        height: 1.3,
                        color: AppColors.textDarkColor),
                    filled: true,
                    fillColor: AppColors.containerColor,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.greenColor),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.primaryColor1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "$label is required";
                    }
                    return null;
                  },
                ),
        ],
      ),
    );
  }
}
