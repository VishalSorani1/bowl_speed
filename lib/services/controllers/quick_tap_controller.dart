import 'dart:async';

import 'package:bowl_speed/utils/colors.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class QuickTapController extends GetxController {
  static QuickTapController get instance => Get.find();

  static String get timerId => "timerId";
  static String get speedId => "speedId";
  static String get durationId => "durationId";
  bool isTimerOn = false;

  //TextEditingController
  TextEditingController meterTextController =
      TextEditingController(text: "20.0");

  String formattedTime = '00:00:00';
  String speed = "--";
  int _milliseconds = 0;
  Timer? _timer;
  double distance = 20.0;
  double speedInKmph = 0.0;
  double speedInMph = 0.0;

  final CountDownController countDownController = CountDownController();

  void startTimer() {
    isTimerOn = true;
    speed = "00.0 km/h - 00.0 mph";
    formattedTime = "00:00:00";
    update([speedId]);
    countDownController.start();

    _milliseconds = 0;
    formattedTime = _formatTime(_milliseconds);

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      _milliseconds += 3;

      formattedTime = _formatTime(_milliseconds);

      update([durationId]);
    });

    update([timerId]);
  }

  String _formatTime(int milliseconds) {
    int hours = (milliseconds ~/ (1000 * 60 * 60)) % 24;
    int minutes = (milliseconds ~/ (1000 * 60)) % 60;
    int seconds = (milliseconds ~/ 1000) % 60;
    int millis = milliseconds % 1000;
    return '${_twoDigits(hours)}:${_twoDigits(minutes)}:${_twoDigits(seconds)}:${_fourDigits(millis)}';
  }

  String _twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  String _fourDigits(int n) {
    return n.toString().padLeft(4, '0');
  }

  void stopTimer() {
    isTimerOn = false;
    _timer?.cancel();
    countDownController.pause();

    showResult();
    update([timerId]);
  }

  void showResult() {
    calculateSpeed();
    Get.defaultDialog(
      titleStyle: GoogleFonts.rubik(fontSize: 18),
      middleTextStyle: GoogleFonts.rubik(fontSize: 14),
      barrierDismissible: false,
      title: "Result",
      middleText:
          "${speedInKmph.toStringAsFixed(1)} km/h - ${speedInMph.toStringAsFixed(1)} mph",
      confirm: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.textWhiteColor,
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text("Save"),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
          countDownController.reset();
          update([durationId, timerId]);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.textDarkColor,
          backgroundColor: AppColors.textWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text("Cancel"),
      ),
    );
  }

  void calculateSpeed() {
    double distanceInKilometers = distance / 1000.0;

    double timeInHours = _milliseconds / (1000.0 * 60 * 60);
    // if (timeInHours == 0) {
    //   throw ArgumentError("Time cannot be zero");
    // }
    speedInKmph = distanceInKilometers / timeInHours;
    speedInMph = speedInKmph * 0.621371;
    speed =
        "${speedInKmph.toStringAsFixed(1)} km/h - ${speedInMph.toStringAsFixed(1)} mph";
    update([speedId]);
  }

  void changeDistance() {
    Get.defaultDialog(
      title: "Change Pitch Meter",
      titleStyle: GoogleFonts.rubik(fontSize: 18),
      titlePadding: const EdgeInsets.all(16.0),
      barrierDismissible: false,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: meterTextController,
          // initialValue: "20.0",
          keyboardType: TextInputType.number,
          maxLength: 5,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            filled: true,
            label: const Text("Enter Meter"),
            labelStyle: GoogleFonts.rubik(color: AppColors.primaryColor),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
            fillColor: AppColors.containerColor,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Please Enter something";
            }
            return null;
          },
        ),
      ),
      cancel: ElevatedButton.icon(
        onPressed: () {
          Get.back();
          countDownController.reset();
          update([durationId, timerId]);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.textDarkColor,
          backgroundColor: AppColors.containerColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: const Icon(Iconsax.close_circle),
        label: const Text("Cancel"),
      ),
      confirm: ElevatedButton.icon(
        onPressed: () {
          distance = double.parse(meterTextController.text);
          Get.back();
          countDownController.reset();
          update([durationId, timerId]);
        },
        style: ElevatedButton.styleFrom(
          iconColor: AppColors.textWhiteColor,
          foregroundColor: AppColors.textWhiteColor,
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: const Icon(
          Iconsax.save_add,
          size: 20,
        ),
        label: const Text("Save"),
      ),
    );
  }
}
