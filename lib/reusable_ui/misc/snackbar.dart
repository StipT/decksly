import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum HSSnackBarType {
  message,
  alert,
}

class HSSnackBar {
  HSSnackBar._();

  static Image _snackBarImage(HSSnackBarType type) {
    switch (type) {
      case HSSnackBarType.alert:
        return Image.asset(
          assetPath(SUBFOLDER_MISC, "alert"),
          height: 30.h,
        );
      case HSSnackBarType.message:
        return Image.asset(
          assetPath(SUBFOLDER_MISC, "beer"),
          height: 30.h,
        );
    }
  }

  static show(BuildContext context, HSSnackBarType type, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.white,
        width: 400.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.r),
          ),
          side: BorderSide(
            width: 1.sp,
            color: AppColors.gold,
          ),
        ),
        elevation: 10.sp,
        content: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _snackBarImage(type),
            Expanded(
              child: AutoSizeText(
                message,
                textAlign: TextAlign.center,
                style: FontStyles.regular15Black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
