// ignore_for_file: prefer_const_constructors

import 'package:bowl_speed/services/controllers/manual_calc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/labels.dart';

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
              itemCount: controller.historyList.length,
              itemBuilder: (context, index) {
                var obj = controller.historyList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRowForHistoryCard(
                            property: Labels.pitchSize,
                            value: obj.distance.toString(),
                          ),
                          Divider(),
                          CustomRowForHistoryCard(
                            property: Labels.timeOfTravel,
                            value: obj.time.toString(),
                          ),
                          Divider(),
                          CustomRowForHistoryCard(
                            property: Labels.kilometerPerHour,
                            value: obj.kmh.toString(),
                          ),
                          Divider(),
                          CustomRowForHistoryCard(
                            property: Labels.milesPerHour,
                            value: obj.mph.toString(),
                          ),
                          Divider(),
                          CustomRowForHistoryCard(
                            property: Labels.measurementType,
                            value: obj.measurementType.toString(),
                          ),
                          Divider(),
                          CustomRowForHistoryCard(
                            property: Labels.date,
                            value: obj.date.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class CustomRowForHistoryCard extends StatelessWidget {
  const CustomRowForHistoryCard(
      {super.key, required this.property, required this.value});

  final String property;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              property.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
