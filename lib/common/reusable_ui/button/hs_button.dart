import "package:auto_size_text/auto_size_text.dart";
import "package:decksly/common/design/colors.dart";
import "package:decksly/common/design/fonts.dart";
import "package:decksly/common/reusable_ui/backgrounds/hs_button_overlay.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class HSButton extends StatelessWidget {
  const HSButton({
    super.key,
    this.label,
    this.icon,
    required this.onTap,
    required this.isDisabled,
  });

  final String? label;
  final Widget? icon;
  final bool isDisabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 1.75.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const HSButtonOverlay(),
          OutlinedButton(
            onPressed: isDisabled ? null : onTap,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.vanDykeBrown,
              side: const BorderSide(
                color: Colors.transparent,
              ),
              textStyle: FontStyles.bold15VanDykeBrown,
              padding: EdgeInsets.only(
                top: 8.75.h,
                bottom: 8.75.h,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 9.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (icon != null)
                    Container(
                      margin: EdgeInsets.only(top: 1.75.h, bottom: 1.75.h, left: 5.w),
                      child: icon,
                    ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        label ?? "",
                        maxLines: 1,
                        minFontSize: 6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
