import 'package:decksly/common/asset_loader.dart';
import 'package:decksly/common/fonts.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_active_button_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSBarToggleButton extends StatelessWidget {
  const HSBarToggleButton(
      {Key? key, this.label, this.icon, required this.onTap, required this.isToggled, required this.activeFilters})
      : super(key: key);
  final String? label;
  final Widget? icon;
  final bool isToggled;
  final int activeFilters;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 20.h,
        maxHeight: 50.h,
        minWidth: 15.w,
        maxWidth: 30.w,
      ),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 1.h),
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: double.infinity,
                          child: Image.asset(
                            "assets/shared/border_left_outline.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: double.infinity,
                          child: Image.asset(
                            "assets/button/button_border_left.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.asset(
                              "assets/shared/border_center_outline.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.asset(
                              "assets/button/button_border_center.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Stack(
                      children: [
                        SizedBox(
                          height: double.infinity,
                          child: Image.asset(
                            "assets/shared/border_right_outline.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: double.infinity,
                          child: Image.asset(
                            "assets/button/button_border_right.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (isToggled) const HSActiveButtonOverlay(),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 5.w,
                  right: 5.w,
                  top: 10.h,
                  bottom: 10.h,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: icon ?? const SizedBox(),
                          width: 15.w,
                        ),
                      ],
                    ),
                    Text(
                      label ?? "",
                      style: FontStyles.bold15Button,
                    )
                  ],
                ),
              ),
              _showFilterBubble(activeFilters),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showFilterBubble(int activeFilters) {
    if (activeFilters.isFinite) {
      return Positioned(
        bottom: 2.h,
        right: 2.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(assetPath("misc", "filter_number_bubble"), width: 10.w),
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
