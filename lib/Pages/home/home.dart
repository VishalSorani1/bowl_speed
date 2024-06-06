// ignore_for_file: unused_local_variable

import 'package:bowl_speed/services/controllers/quick_tap_controller.dart';
import 'package:bowl_speed/utils/colors.dart';
import 'package:bowl_speed/utils/constants.dart';
import 'package:bowl_speed/widgets/custom_lable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../services/controllers/video_measure_controller.dart';
import 'home_banner.dart';
import 'menu_section_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final controller = Get.put(VideoMeasureController());
    final quick = Get.put(QuickTapController());

    return GetBuilder<VideoMeasureController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.textWhiteColor,
        // appBar: CustomAppBar(
        //   title: StringConstants.videoTitle,
        //   onBack: () {},
        //   onHistory: () {
        //     QuickTapController.instance.getHistory();
        //   },
        // ),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: Get.height * 0.47,
                maxHeight: Get.height * 0.47,
                child: const HomeBanner(),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // QuickTap & Video Tap section
                  const MenuSectionCard(),

                  // Information section
                  const InformationSection(),

                  // Calculation & Converters section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0)
                        .copyWith(bottom: 14),
                    child: Column(
                      children: [
                        CustomLabelText(
                          label: StringConstants.caculatorSection,
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Icon(
                                  Iconsax.add_square,
                                  size: 32,
                                  color: AppColors.primaryColor1,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                CustomLabelText(
                                  label: StringConstants.manual,
                                  style: GoogleFonts.rubik(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(
                                  Iconsax.arrow_swap_horizontal,
                                  size: 32,
                                  color: AppColors.primaryColor1,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                CustomLabelText(
                                  label: StringConstants.unit,
                                  style: GoogleFonts.rubik(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class InformationSection extends StatelessWidget {
  const InformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration:
          BoxDecoration(color: AppColors.containerColor.withOpacity(0.5)),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomRoundedIcon(
              icon: Iconsax.receipt_2,
              iconColor: AppColors.textWhiteColor.withOpacity(0.8),
              label: "Bowler Report",
            ),
            CustomRoundedIcon(
              icon: Iconsax.setting_2,
              iconColor: AppColors.textWhiteColor.withOpacity(0.8),
              label: "Settings",
            ),
            CustomRoundedIcon(
              icon: Iconsax.info_circle,
              iconColor: AppColors.textWhiteColor.withOpacity(0.8),
              label: "How to use",
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRoundedIcon extends StatelessWidget {
  const CustomRoundedIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
  });
  final IconData icon;
  final String label;
  // final TextStyle? style;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.textBlueColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              icon,
              color: iconColor,
              size: 30,
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Flexible(
          child: CustomLabelText(
              label: label,
              style:
                  GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}
