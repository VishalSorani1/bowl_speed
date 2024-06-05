import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/controllers/video_measure_controller.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../widgets/card_item.dart';
import '../quick_tap/quick_tap_screen.dart';

class MenuSectionCard extends StatelessWidget {
  const MenuSectionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: double.maxFinite,
      // height: 130,
      decoration: const BoxDecoration(color: AppColors.textWhiteColor),
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CardItem(
                title: StringConstants.quickTapTitle,
                message: StringConstants.quickTapMessage,
                isReverse: false,
                onTap: () {
                  Get.to(() => const QuickTapScreen(),
                      transition: Transition.leftToRight,
                      duration: const Duration(milliseconds: 500));
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: CardItem(
                title: StringConstants.videoTitle,
                message: StringConstants.videoMessage,
                isReverse: true,
                onTap: () {
                  VideoMeasureController.instance.pickVideo();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
