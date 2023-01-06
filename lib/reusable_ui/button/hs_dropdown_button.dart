import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/colors.dart';
import 'package:decksly/common/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HSDropdownButton extends StatelessWidget {
  const HSDropdownButton({
    required this.assetImagePath,
    required this.text,
    this.hideText = false,
  });

  final String assetImagePath;
  final String text;
  final bool hideText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 0.004.sw,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(assetImagePath.isNotEmpty)
          _getImage(),
          if(!hideText)
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 0.01.sw),
              child: AutoSizeText(
                text,
                minFontSize: 8,
                maxLines: 1,
                style: FontStyles.bold15Button,
              ),
              //padding: EdgeInsets.only(top: 0.03.sh, bottom: 0.03.sh, left: 0.008.sw),
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

    final isSvg = assetImagePath.substring(assetImagePath.length - 3).contains("svg");
    return Flexible(
      child: isSvg
          ? SvgPicture.asset(
              assetImagePath,
              fit: BoxFit.fill,
              color: AppColors.gold,
              width: 30.sp,
            )
          : Image.asset(
              assetImagePath,
              fit: BoxFit.fill,
              width: 30.sp,
            ),
    );
  }
}
