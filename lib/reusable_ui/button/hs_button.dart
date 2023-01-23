import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_active_button_overlay.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_button_overlay.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_velvet_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSButton extends StatelessWidget {
  const HSButton(
      {Key? key, this.label, this.icon, required this.onTap, required this.width, required this.isDisabled,})
      : super(key: key);
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
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            const HSButtonOverlay(),
         //   if (isToggled) const HSActiveButtonOverlay(),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                right: 5.w,
                top: 10.h,
                bottom: 10.h,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 2.5.w),
                        child: icon ?? const SizedBox(),

                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      label ?? "",
                      style: FontStyles.bold15VanDykeBrown,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
