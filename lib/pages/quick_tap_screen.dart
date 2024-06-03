import 'dart:developer';
import 'package:bowl_speed/utils/colors.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../services/controllers/quick_tap_controller.dart';
import '../utils/constants.dart';

class QuickTapScreen extends StatelessWidget {
  const QuickTapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuickTapController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Iconsax.arrow_left)),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.textWhiteColor,
          title: Text(
            StringConstants.quickTapTitle,
            style: GoogleFonts.rubik(),
          ),
          actions: [
            PopupMenuButton(itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  onTap: () {},
                  padding: const EdgeInsets.only(left: 24.0),
                  textStyle: GoogleFonts.rubik(),
                  child: const Text("Rate us"),
                ),
                PopupMenuItem(
                  onTap: () {},
                  padding: const EdgeInsets.only(left: 24.0),
                  textStyle: GoogleFonts.rubik(),
                  child: const Text('Share app'),
                ),
                PopupMenuItem(
                  onTap: () {},
                  padding: const EdgeInsets.only(left: 24.0),
                  textStyle: GoogleFonts.rubik(),
                  child: const Text('Contact us'),
                ),
                PopupMenuItem(
                  onTap: () {},
                  padding: const EdgeInsets.only(left: 24.0),
                  textStyle: GoogleFonts.rubik(),
                  child: const Text('Privacy Policy'),
                ),
              ];
            })
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomLabelText(
                            label: StringConstants.gameType,
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          CustomLabelText(
                            label: StringConstants.cricket,
                            style: GoogleFonts.rubik(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomLabelText(
                              label: StringConstants.distance,
                              style: GoogleFonts.rubik(
                                  fontSize: 12,
                                  color:
                                      AppColors.textDarkColor.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                            GetBuilder<QuickTapController>(
                              id: QuickTapController.durationId,
                              builder: (ctx) => Flexible(
                                child: CustomLabelText(
                                  label:
                                      "${ctx.distance} ${StringConstants.meter}",
                                  style: GoogleFonts.rubik(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.changeDistance();
                              },
                              child: const Icon(
                                Iconsax.edit_2,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0, top: 4.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.31),
                              child: CustomLabelText(
                                label: StringConstants.speed,
                                style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    color: AppColors.textDarkColor
                                        .withOpacity(0.7),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            GetBuilder<QuickTapController>(
                                id: QuickTapController.speedId,
                                builder: (context) {
                                  return Flexible(
                                    child: CustomLabelText(
                                      label: controller.speed,
                                      style: GoogleFonts.rubik(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0)
                            .copyWith(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: Get.width * 0.32),
                              child: CustomLabelText(
                                label: StringConstants.timer,
                                style: GoogleFonts.rubik(
                                    fontSize: 12,
                                    color: AppColors.textDarkColor
                                        .withOpacity(0.7),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            GetBuilder<QuickTapController>(
                              id: QuickTapController.durationId,
                              builder: (controller) => Flexible(
                                child: CustomLabelText(
                                  label: controller.formattedTime,
                                  style: GoogleFonts.rubik(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Clock
              GetBuilder<QuickTapController>(
                  id: QuickTapController.timerId,
                  builder: (context) {
                    return Column(
                      children: [
                        CircularCountDownTimer(
                          duration: 60,
                          initialDuration: 0,
                          controller: controller.countDownController,
                          width: Get.width / 1.6,
                          height: Get.height / 2,
                          ringColor: Colors.grey[300]!,
                          ringGradient: null,
                          fillColor: AppColors.containerColor,
                          fillGradient: null,
                          backgroundColor: AppColors.primaryColor,
                          backgroundGradient: null,
                          strokeWidth: 20.0,
                          strokeCap: StrokeCap.square,
                          textStyle: const TextStyle(
                              fontSize: 33.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textFormat: CountdownTextFormat.S,
                          isReverse: false,
                          isReverseAnimation: false,
                          isTimerTextShown: true,
                          autoStart: false,
                          onStart: () {
                            log("started");
                          },
                          onComplete: () {
                            log("Completed");
                          },
                          onChange: (String timeStamp) {
                            log('Countdown Changed $timeStamp');
                            // controller.updateTime(duration);
                          },
                          timeFormatterFunction:
                              (defaultFormatterFunction, duration) {
                            if (duration.inSeconds == 0) {
                              return "Start";
                            } else {
                              // controller.updateTime(duration);

                              return Function.apply(
                                  defaultFormatterFunction, [duration]);
                            }
                          },
                        ),
                        SizedBox(
                          width: Get.width * 0.4,
                          height: Get.width * 0.13,
                          child: ElevatedButton(
                            onPressed: controller.isTimerOn
                                ? controller.stopTimer
                                : controller.startTimer,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: AppColors.textWhiteColor,
                            ),
                            child: Text(
                              controller.isTimerOn == true ? "Finish" : "Start",
                              style: GoogleFonts.rubik(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLabelText extends StatelessWidget {
  const CustomLabelText({
    super.key,
    required this.label,
    required this.style,
  });
  final String label;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      softWrap: true,
      textScaler: TextScaler.noScaling,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}
