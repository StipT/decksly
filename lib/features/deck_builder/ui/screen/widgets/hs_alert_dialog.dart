import 'dart:async';

import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_wood_horizontal_border.dart';
import 'package:decksly/reusable_ui/button/hs_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> hsAlertDialog(BuildContext context, Function(String) onConfirm) {
  return showDialog(
      context: context,
      builder: (builderContext) {
        final TextEditingController _dateController = TextEditingController();
        return Container(
          alignment: Alignment.center,
          child: Container(
            width: 500.w,
            height: 110.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.vanDykeBrown, width: 2.sp),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.r,
                ),
              ),
              image: DecorationImage(
                image: AssetImage(assetPath("background", "alert_dialog_background")),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 25.w),
              width: 400.w,
              height: 100.h,
              child: Row(
                children: [
                  Expanded(
                      child: Image.asset(
                    assetPath(SUBFOLDER_MISC, "alert"),
                    height: 100.h,
                    fit: BoxFit.fill,
                  )),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                            child: Text(
                              "You will lose your existing deck. Are you sure?",
                              textAlign: TextAlign.center,
                              style: FontStyles.bold22,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Stack(
                                      children: [
                                        const HSWoodHorizontalBorder(),
                                        Container(
                                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                                            child: HSButton(
                                              width: 112.5.w,
                                              isDisabled: false,
                                              label: "Yes",
                                              onTap: () {
                                                //   CardGalleryRoute.open(context);
                                              },
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Stack(
                                      children: [
                                        const HSWoodHorizontalBorder(),
                                        Container(
                                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                                            child: HSButton(
                                              width: 112.5.w,
                                              isDisabled: false,
                                              label: "No",
                                              onTap: () {
                                                //   CardGalleryRoute.open(context);
                                              },
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
