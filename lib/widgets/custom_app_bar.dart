import 'package:bowl_speed/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBack;
  final Function onHistory;
  final Color color;
  final bool? isHistoryBtnVisible;
  // final List<PopupMenuEntry> popupMenuItems;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onBack,
    required this.onHistory,
    this.color = AppColors.primaryColor1,
    this.isHistoryBtnVisible = true,
    // required this.popupMenuItems,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      // leading: IconButton(
      //   onPressed: onBack,
      //   icon: const Icon(Iconsax.arrow_left),
      // ),
      backgroundColor: color,
      foregroundColor: AppColors.textWhiteColor,
      title: Text(
        title,
        style: GoogleFonts.rubik(),
      ),
      actions: [
        if (isHistoryBtnVisible == true)
          IconButton(
            onPressed: () {
              onHistory();
            },
            icon: const Icon(Iconsax.timer_start),
          ),
        PopupMenuButton(
          itemBuilder: (context) => [
            buildMenuItem('Rate us'),
            buildMenuItem('Share app'),
            buildMenuItem('Contact us'),
            buildMenuItem('Privacy Policy'),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
