// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/controllers/unit_conversion_controller.dart';
import '../../utils/labels.dart';
import 'custom_input_dropdown.dart';
import 'custom_output_dropdown.dart';

class UnitConversionScreen extends GetView<UnitConversionController> {
  const UnitConversionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Labels.unitConversion,
          style: GoogleFonts.rubik(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(226, 1, 74, 177),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<UnitConversionController>(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Speed conversion
              Text(
                Labels.convertDistance,
                style: GoogleFonts.rubik(color: Colors.black, fontSize: 20),
              ),

              // Input Dropdown
              CustomInputDropdown(
                dropdownValue: controller.inputDistanceUnit,
                dropdownItems: controller.distanceUnits,
                dropdownonChanged: controller.updateInputDistanceUnit,
                formController: controller.distanceController,
                formOnChanged: controller.updateDistanceForm,
              ),

              // Output Dropdown
              CustomOutputDropdown(
                dropdownValue: controller.outputDistanceUnit,
                dropdownItems: controller.distanceUnits,
                result: controller.distanceResult.toStringAsFixed(3),
                dropdownonChanged: controller.updateOutputDistanceUnit,
              ),
              SizedBox(
                height: 20,
              ),

              /// Speed conversion
              Text(
                Labels.convertSpeed,
                style: GoogleFonts.rubik(color: Colors.black, fontSize: 20),
              ),

              // Input Dropdown
              CustomInputDropdown(
                dropdownValue: controller.inputSpeedUnit,
                dropdownItems: controller.speedUnits,
                dropdownonChanged: controller.updateInputSpeedUnit,
                formController: controller.speedController,
                formOnChanged: controller.updateSpeedForm,
              ),

              // Output Dropdown
              CustomOutputDropdown(
                dropdownValue: controller.outputSpeedUnit,
                dropdownItems: controller.speedUnits,
                result: controller.speedResult.toStringAsFixed(3),
                dropdownonChanged: controller.updateOutputSpeedUnit,
              ),
            ],
          );
        }),
      ),
    );
  }
}

