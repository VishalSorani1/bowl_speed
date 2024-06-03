
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void customSnackbar(String message) {
  Get.snackbar(
    'Error',
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.black,
    colorText: Colors.white,
  );
}