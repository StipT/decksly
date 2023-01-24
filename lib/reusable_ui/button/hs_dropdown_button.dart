import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HSDropdownButton extends StatelessWidget {
  const HSDropdownButton({
    required this.height,
    required this.assetImagePath,
    required this.text,
    this.hideText = false,
  });

  final double height;
  final String assetImagePath;
  final String text;
  final bool hideText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (assetImagePath.isNotEmpty) _getImage(),
          if (!hideText)
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10.w),
                child: AutoSizeText(
                  text,
                  minFontSize: 10,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FontStyles.bold15VanDykeBrown,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _getImage() {
    if (assetImagePath.isEmpty) {
      return const SizedBox();
    }

    final isSvg = assetImagePath.substring(assetImagePath.length - 3).contains(SVG_EXTENSION);
    return Container(
      padding: EdgeInsets.only(left: 4.w),
      child: isSvg
          ? SvgPicture.asset(
              assetImagePath,
              height: height - 27.5.h,
              fit: BoxFit.fitHeight,
              color: AppColors.gold,
            )
          : Image.asset(
              height: height - 25.h,
              assetImagePath,
              fit: BoxFit.fitHeight,
            ),
    );
  }
}
