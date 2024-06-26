import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/controllers/quick_tap_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_lable_text.dart';
import '../bowler/bowler_detail.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.47,
      child: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.46,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor1,
            ),
            child: Stack(
              children: [
                CustomAppBar(
                  color: AppColors.primaryColor1,
                  title: "",
                  onBack: () {},
                  onHistory: () {
                    QuickTapController.instance.getHistory();
                  },
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  child: SizedBox(
                    width: Get.width / 2,
                    child: CustomLabelText(
                      label: "BOWLING SPEED METER",
                      style: GoogleFonts.rubik(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textWhiteColor),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 20,
                  child: SizedBox(
                    width: Get.width,
                    child: CustomLabelText(
                      label: "Measure Your Bowling Speed",
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textWhiteColor.withOpacity(0.6)),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const BowlerDetailScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                    ),
                    child: const Text(
                      "Bowler Detail",
                      style: TextStyle(color: AppColors.textWhiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 0,
            child: Image.asset(
              'assets/images/player4.png',
              fit: BoxFit.cover,
              height: Get.height * 0.34,
            ),
          ),
        ],
      ),
    );
  }
}
