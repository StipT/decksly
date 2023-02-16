import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_button_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSButton extends StatelessWidget {
  const HSButton({
    Key? key,
    this.label,
    this.icon,
    required this.onTap,
    required this.width,
    required this.isDisabled,
  }) : super(key: key);
  final String? label;
  final double width;
  final Widget? icon;
  final bool isDisabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 1.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const HSButtonOverlay(),
          //   if (isToggled) const HSActiveButtonOverlay(),
          OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Colors.transparent,
              ),
              textStyle: FontStyles.bold15VanDykeBrown,
              padding: EdgeInsets.only(
                right: 10.w,
                top: 5.h,
                bottom: 5.h,
              ),
              primary: AppColors.vanDykeBrown,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 1.h, bottom: 1.h, right: 2.5.w, left: 10.w),
                  child: icon ?? const SizedBox(),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      label ?? "",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
