// ignore_for_file: prefer_const_constructors

import 'package:bowl_speed/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/controllers/settings_controller.dart';
import '../../utils/labels.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Labels.settings,
        onBack: () {},
        onHistory: () {},
        isHistoryBtnVisible: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// select Game
            Text(
              Labels.selectGameType,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.0,
            ),

            /// Two radio button options
            ListTile(
              contentPadding: EdgeInsets.zero,
              tileColor: Colors.amber[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomRadioButton(
                      value: Sport.cricket,
                      label: Labels.cricket,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CustomRadioButton(
                      value: Sport.baseBall,
                      label: Labels.baseBall,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),

            /// pitch size set label
            Text(
              Labels.setDefaultPitchmeter,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4.0,
            ),

            /// pitch size set
            CustomTile(
                label: Labels.cricket, onTap: () => controller.onCricket()),
            SizedBox(
              height: 8.0,
            ),
            CustomTile(
                label: Labels.baseBall, onTap: () => controller.onBaseBall()),
          ],
        ),
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  const CustomTile({super.key, required this.label, this.onTap});

  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      tileColor: Colors.amber[100],
      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onTap: onTap,
    );
  }
}

class CustomRadioButton extends GetWidget<SettingsController> {
  const CustomRadioButton(
      {super.key, required this.value, required this.label});
  final Sport value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      id: controller.gameTypeId,
      builder: (controller) {
        return Row(
          children: [
            Radio<Sport>(
              value: value,
              groupValue: controller.selectedSport,
              onChanged: (Sport? newValue) {
                if (newValue != null) {
                  controller.setSelectedSport(newValue);
                }
              },
            ),
            Text(label),
          ],
        );
      },
    );
  }
}
