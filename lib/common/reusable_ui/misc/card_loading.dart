import "package:decksly/common/design/colors.dart";
import "package:decksly/common/dev/asset_loader.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:shimmer/shimmer.dart";

class CardLoading extends StatelessWidget {
  const CardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.75.h, horizontal: 20.w),
      child: Shimmer.fromColors(
        baseColor: AppColors.spanishGrey,
        highlightColor: AppColors.shimmerGrey,
        child: Image.asset(
          assetPath(kSubfolderMisc, "card_template_grey"),
        ),
      ),
    );
  }
}
