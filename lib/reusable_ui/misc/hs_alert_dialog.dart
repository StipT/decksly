import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_wood_horizontal_border.dart';
import 'package:decksly/reusable_ui/button/hs_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum HSDialogType {
  alert,
}

class HSDialog {
  HSDialog._();

  static Image _dialogImage(HSDialogType type) {
    switch (type) {
      case HSDialogType.alert:
        return Image.asset(
          assetPath(kSubfolderMisc, "alert"),
          fit: BoxFit.fill,
        );
    }
  }

  static Widget _dialogMessage(HSDialogType type) {
    switch (type) {
      case HSDialogType.alert:
        return Text(
          "You will lose your existing deck. Are you sure?",
          textAlign: TextAlign.center,
          style: FontStyles.bold22,
        );
    }
  }

  static String _dialogPrimaryButtonTitle(HSDialogType type) {
    switch (type) {
      case HSDialogType.alert:
        return "Yes";
    }
  }

  static String? _dialogSecondaryButtonTitle(HSDialogType type) {
    switch (type) {
      case HSDialogType.alert:
        return "No";
    }
  }

  static show(
    BuildContext context,
    HSDialogType type,
    Function(BuildContext context) onPrimaryButtonTap,
    Function(BuildContext context) onSecondaryButtonTap,
  ) {
    return showDialog(
        context: context,
        builder: (dialogContext) {
          return Container(
            alignment: Alignment.center,
            child: Container(
              width: 450.w,
              height: 175.h,
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
                padding: EdgeInsets.symmetric(vertical: 8.75.h, horizontal: 25.w),
                width: 450.w,
                height: 175.h,
                child: Row(
                  children: [
                    Expanded(child: _dialogImage(type)),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.75.h, horizontal: 5.w),
                              child: _dialogMessage(type),
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
                                              margin: EdgeInsets.only(left: 30.w, right: 30.w),
                                              child: HSButton(
                                                isDisabled: false,
                                                label: _dialogPrimaryButtonTitle(type),
                                                onTap: () => onPrimaryButtonTap(dialogContext),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (_dialogSecondaryButtonTitle(type) != null)
                                    Expanded(
                                      child: Container(
                                        child: Stack(
                                          children: [
                                            const HSWoodHorizontalBorder(),
                                            Container(
                                                margin: EdgeInsets.only(left: 30.w, right: 30.w),
                                                child: HSButton(
                                                  isDisabled: false,
                                                  label: _dialogSecondaryButtonTitle(type),
                                                  onTap: () => onSecondaryButtonTap(dialogContext),
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
}
