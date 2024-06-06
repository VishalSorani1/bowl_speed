// ignore_for_file: prefer_const_constructors

import 'package:bowl_speed/services/controllers/menu_feature_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMenuFeatures extends GetView<MenuFeatureController> {
  const CustomMenuFeatures(this.message, {super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      iconColor: Colors.white,
      onSelected: (String result) {
        switch (result) {
          case 'Rate Us':
            controller.rateUs();
            break;
          case 'Share App':
            controller.shareApp(message);
            break;
          case 'Privacy Policy':
            controller.openPrivacyPolicy();
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Rate Us',
          child: Text('Rate Us'),
        ),
        const PopupMenuItem<String>(
          value: 'Share App',
          child: Text('Share App'),
        ),
        const PopupMenuItem<String>(
          value: 'Privacy Policy',
          child: Text('Privacy Policy'),
        ),
      ],
    );
  }
}
