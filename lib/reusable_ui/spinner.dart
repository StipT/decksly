import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HSSpinner extends StatelessWidget {
  const HSSpinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.w,
      height: 25.h,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Shimmer.fromColors(
        baseColor: AppColors.spanishGrey,
        highlightColor: AppColors.shimmerGrey,
        child: Image.asset(
          assetPath(SUBFOLDER_BACKGROUND, "splash_icon"),
          height: 10.h,
          width: 10.w,
        ),
      ),
    );
  }
}
