// ignore_for_file: prefer_const_constructors

import 'package:bowl_speed/services/controllers/manual_calc_controller.dart';
import 'package:bowl_speed/utils/constants.dart';
import 'package:bowl_speed/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManualCalcHistory extends GetView<ManualCalculatorController> {
  const ManualCalcHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: StringConstants.historyTitle,
        onBack: () {},
        onHistory: () {},
        isHistoryBtnVisible: false,
      ),
      body: controller.historyList.isEmpty
          ? Center(child: Text("No History Found"))
          : ListView.builder(
              itemBuilder: (context, index) =>
                  ListTile(title: Text(controller.historyList[index].date)),
              itemCount: controller.historyList.length),
    );
  }
}
