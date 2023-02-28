import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_active_button_overlay.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_button_overlay.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_velvet_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HSBarToggleButton extends StatelessWidget {
  const HSBarToggleButton(
      {Key? key, required this.onTap, required this.isToggled, required this.activeFilters, required this.width})
      : super(key: key);
  final double width;
  final bool isToggled;
  final int activeFilters;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 0.875.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const HSVelvetBorder(),
          const HSButtonOverlay(),
          if (isToggled) const HSActiveButtonOverlay(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 7.w),
            child: OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.vanDykeBrown, side: const BorderSide(
                  color: Colors.transparent,
                ),
                textStyle: FontStyles.bold15VanDykeBrown,

                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
              ),
              child: SvgPicture.asset(
                assetPath(SUBFOLDER_MISC, "filter",
                    fileExtension: SVG_EXTENSION),
                fit: BoxFit.fill,
                color: AppColors.bistreBrown,
                width: 30.w,
              ),
            ),
          ),
          _showFilterBubble(activeFilters),
        ],
      ),
    );
  }

  Widget _showFilterBubble(int activeFilters) {
    if (activeFilters > 0) {
      return Positioned(
        bottom: 1.75.h,
        right: 4.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(assetPath("misc", "filter_number_bubble"), width: 20.w),
            Text(
              activeFilters.toString(),
              textAlign: TextAlign.center,
              style: FontStyles.bold15,
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }
}
