// ignore_for_file: prefer_const_constructors

import 'package:bowl_speed/services/controllers/manual_calc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManualCalcHistory extends GetView<ManualCalculatorController> {
  const ManualCalcHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
        backgroundColor: Color(0xff006769),
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
