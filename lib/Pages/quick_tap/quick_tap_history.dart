import 'package:bowl_speed/services/controllers/quick_tap_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_card_row.dart';
import '../../widgets/custom_lable_text.dart';
import '../../widgets/menu_item.dart';

class QuickTapHistoryScreen extends GetView<QuickTapController> {
  const QuickTapHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Iconsax.arrow_left),
        ),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.textWhiteColor,
        title: Text(
          StringConstants.historyTitle,
          style: GoogleFonts.rubik(),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              buildMenuItem('Rate us'),
              buildMenuItem('Share app'),
              buildMenuItem('Contact us'),
              buildMenuItem('Privacy Policy'),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              controller.historyList.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.historyList.length,
                      itemBuilder: (context, index) {
                        final history = controller.historyList[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.containerColor,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildHeader(history.bowler),
                                  const SizedBox(height: 16.0),
                                  _buildCustomCardRow(StringConstants.distance,
                                      history.distance.toString()),
                                  _buildDivider(),
                                  _buildCustomCardRow(
                                      StringConstants.time, history.time),
                                  _buildDivider(),
                                  _buildCustomCardRow(StringConstants.speedKmh,
                                      history.kmh.toStringAsFixed(2)),
                                  _buildDivider(),
                                  _buildCustomCardRow(StringConstants.speedMhp,
                                      history.mps.toStringAsFixed(2)),
                                  _buildDivider(),
                                  _buildCustomCardRow(
                                      StringConstants.measureType,
                                      history.measurementType),
                                  _buildDivider(),
                                  _buildCustomCardRow(
                                      StringConstants.dateTime, history.date),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const Text("Not Found"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String bowler) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomLabelText(
          label: bowler,
          style: GoogleFonts.rubik(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        CustomLabelText(
          label: StringConstants.cricket,
          style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildCustomCardRow(String label, String value) {
    return CustomCardRow(
      label: label,
      value: value,
    );
  }

  Widget _buildDivider() {
    return const Divider();
  }
}
