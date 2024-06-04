// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/labels.dart';

class UnitConversionController extends GetxController {
  TextEditingController distanceController = TextEditingController(text: '1.0');
  TextEditingController speedController = TextEditingController(text: '1.0');

  // List of units
  List<String> distanceUnits = [
    Labels.meter,
    Labels.kilometer,
    Labels.miles,
    Labels.yard,
    Labels.nauticalMiles
  ];

  List<String> speedUnits = [
    Labels.meterPerSecond,
    Labels.kilometerPerHour,
    Labels.milesPerHour,
    Labels.nauticalMilesPerHour,
  ];

  // Selected units and values
  String inputDistanceUnit = Labels.meter;
  String outputDistanceUnit = Labels.kilometer;
  String inputSpeedUnit = Labels.meterPerSecond;
  String outputSpeedUnit = Labels.kilometerPerHour;
  double distanceConversionFactor = Constants.meterToKilometer;
  double speedConversionFactor = Constants.meterPerSecondToKilometerPerHour;
  late double distanceResult;
  late double speedResult;

  @override
  void onInit() {
    calculateDistanceConversion();
    calculateSpeedConversion();
    super.onInit();
  }

  double get distance => double.tryParse(distanceController.text) ?? 1.0;
  double get speed => double.tryParse(speedController.text) ?? 1.0;

  // Methods for distance conversion
  void updateInputDistanceUnit(String? value) {
    inputDistanceUnit = value ?? inputDistanceUnit;
    calculateDistanceConversion();
  }

  void updateOutputDistanceUnit(String? value) {
    outputDistanceUnit = value ?? outputDistanceUnit;
    calculateDistanceConversion();
  }

  void updateDistanceForm(String value) {
    log("value : $value");
    calculateDistanceConversion();
  }

  void calculateDistanceConversion() {
    distanceConversionFactor = getDistanceConversionFactor();
    log("converstion factor : $distanceConversionFactor");

    distanceResult = distance * distanceConversionFactor;
    log("distance result : $distanceResult");
    update();
  }

  /// Methods for speed conversion
  void updateInputSpeedUnit(String? value) {
    inputSpeedUnit = value ?? inputSpeedUnit;
    calculateSpeedConversion();
  }

  void updateOutputSpeedUnit(String? value) {
    outputSpeedUnit = value ?? outputSpeedUnit;
    calculateSpeedConversion();
  }

  void updateSpeedForm(String value) {
    log("value : $value");
    calculateSpeedConversion();
  }

  void calculateSpeedConversion() {
    speedConversionFactor = getSpeedConversionFactor();
    log("converstion factor : $speedConversionFactor");

    speedResult = speed * speedConversionFactor;
    log("speed result : $speedResult");
    update();
  }

  // Calculate conversion

  double getDistanceConversionFactor() {
    switch (inputDistanceUnit) {
      case Labels.meter:
        switch (outputDistanceUnit) {
          case Labels.meter:
            break;
          case Labels.kilometer:
            return Constants.meterToKilometer;

          case Labels.miles:
            return Constants.meterToMiles;

          case Labels.yard:
            return Constants.meterToYard;

          case Labels.nauticalMiles:
            return Constants.meterToNauticalMiles;
        }

      case Labels.kilometer:
        switch (outputDistanceUnit) {
          case Labels.meter:
            return 1 / Constants.meterToKilometer;

          case Labels.kilometer:
            break;

          case Labels.miles:
            return Constants.kilometerToMiles;

          case Labels.yard:
            return Constants.kilometerToYard;

          case Labels.nauticalMiles:
            return Constants.kilometerToNauticalMiles;
        }

      case Labels.miles:
        switch (outputDistanceUnit) {
          case Labels.meter:
            return 1 / Constants.meterToMiles;

          case Labels.kilometer:
            return 1 / Constants.kilometerToMiles;

          case Labels.miles:
            break;

          case Labels.yard:
            return Constants.milesToYard;

          case Labels.nauticalMiles:
            return Constants.milesToNauticalMiles;
        }

      case Labels.yard:
        switch (outputDistanceUnit) {
          case Labels.meter:
            return 1 / Constants.meterToYard;

          case Labels.kilometer:
            return 1 / Constants.kilometerToYard;

          case Labels.miles:
            return 1 / Constants.meterToYard;

          case Labels.yard:
            break;

          case Labels.nauticalMiles:
            return Constants.yardToNauticalMiles;
        }

      case Labels.nauticalMiles:
        switch (outputDistanceUnit) {
          case Labels.meter:
            return 1 / Constants.meterToNauticalMiles;

          case Labels.kilometer:
            return 1 / Constants.kilometerToNauticalMiles;

          case Labels.miles:
            return 1 / Constants.milesToNauticalMiles;

          case Labels.yard:
            return 1 / Constants.yardToNauticalMiles;

          case Labels.nauticalMiles:
            break;
        }
      default:
        break;
    }
    return 1.0;
  }

  double getSpeedConversionFactor() {
    switch (inputSpeedUnit) {
      case Labels.meterPerSecond:
        switch (outputSpeedUnit) {
          case Labels.meterPerSecond:
            break;
          case Labels.kilometerPerHour:
            return Constants.meterPerSecondToKilometerPerHour;
          case Labels.milesPerHour:
            return Constants.meterPerSecondToMilesPerHour;
          case Labels.nauticalMilesPerHour:
            return Constants.meterPerSecondToNauticalMilesPerHour;
        }

      case Labels.kilometerPerHour:
        switch (outputSpeedUnit) {
          case Labels.meterPerSecond:
            return 1 / Constants.meterPerSecondToKilometerPerHour;
          case Labels.kilometerPerHour:
            break;
          case Labels.milesPerHour:
            return Constants.kilometerPerHourToMilesPerHour;
          case Labels.nauticalMilesPerHour:
            return Constants.kilometerPerHourToNauticalMilesPerHour;
        }

      case Labels.milesPerHour:
        switch (outputSpeedUnit) {
          case Labels.meterPerSecond:
            return 1 / Constants.meterPerSecondToMilesPerHour;
          case Labels.kilometerPerHour:
            return 1 / Constants.kilometerPerHourToMilesPerHour;
          case Labels.milesPerHour:
            break;
          case Labels.nauticalMilesPerHour:
            return Constants.milesPerHourToNauticalMilesPerHour;
        }

      case Labels.nauticalMilesPerHour:
        switch (outputSpeedUnit) {
          case Labels.meterPerSecond:
            return 1 / Constants.meterPerSecondToNauticalMilesPerHour;
          case Labels.kilometerPerHour:
            return 1 / Constants.kilometerPerHourToNauticalMilesPerHour;
          case Labels.milesPerHour:
            return 1 / Constants.milesPerHourToNauticalMilesPerHour;
          case Labels.nauticalMilesPerHour:
            break;
        }

      default:
        break;
    }
    return 1.0;
  }
}

class Constants {
  /// Distance Constants
  static const double meterToKilometer = 0.001;
  static const double meterToMiles = 0.000621371;
  static const double meterToYard = 1.09361;
  static const double meterToNauticalMiles = 0.000539957;
  static const double kilometerToMiles = 0.621371;
  static const double kilometerToYard = 1093.61;
  static const double kilometerToNauticalMiles = 0.539957;
  static const double milesToYard = 1760.0;
  static const double milesToNauticalMiles = 0.868976;
  static const double yardToNauticalMiles = 0.000493737;

  /// Speed Constants
  static const double meterPerSecondToKilometerPerHour = 3.6;
  static const double meterPerSecondToMilesPerHour = 2.237;
  static const double meterPerSecondToNauticalMilesPerHour = 1.943;
  static const double kilometerPerHourToMilesPerHour = 0.621371;
  static const double kilometerPerHourToNauticalMilesPerHour = 0.539957;
  static const double milesPerHourToNauticalMilesPerHour = 0.8681;
}
