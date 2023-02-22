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

  static show(
      BuildContext context, HSSnackBarType type, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        margin: EdgeInsets.symmetric(horizontal: 200.w, vertical: 5.h),

        content: Container(
          height: 30.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 10.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            border: Border.all(color: AppColors.gold, width: 1.sp),
            borderRadius: BorderRadius.all(
              Radius.circular(
                30.r,
              ),
            ),
          ),
          child: Row(
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
      ),
    );
  }
}
