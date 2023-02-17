import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_active_button_overlay.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_button_overlay.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_velvet_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSBarToggleButton extends StatelessWidget {
  const HSBarToggleButton(
      {Key? key, this.icon, required this.onTap, required this.isToggled, required this.activeFilters, required this.width})
      : super(key: key);
  final double width;
  final Widget? icon;
  final bool isToggled;
  final int activeFilters;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const HSVelvetBorder(),
          const HSButtonOverlay(),
          if (isToggled) const HSActiveButtonOverlay(),
          OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Colors.transparent,
              ),
              textStyle: FontStyles.bold15VanDykeBrown,
              padding: EdgeInsets.symmetric(
                vertical: 10.w,
                horizontal: 8.h,
              ),
              primary: AppColors.vanDykeBrown,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
            ),
            child: Container(
              alignment: Alignment.center,
              child: icon ?? const SizedBox(),
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
        bottom: 1.h,
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
