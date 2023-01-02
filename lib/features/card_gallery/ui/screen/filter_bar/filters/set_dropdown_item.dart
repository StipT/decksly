import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/colors.dart';
import 'package:decksly/common/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class SetListItem {
  Widget build(BuildContext context);
}

class SetDropdownHeader extends StatelessWidget implements  SetListItem {
  const SetDropdownHeader({
    required this.text,
  });

  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(child: Text(text, style: FontStyles.bold17Grey,),
    padding: EdgeInsets.symmetric(vertical: 0.025.sh, horizontal: 0.01.sw,),);
  }
}

class SetDropdownItem extends StatelessWidget implements SetListItem {
  const SetDropdownItem({
    required this.assetImagePath,
    required this.text,
  });

  final String assetImagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 0.01.sh,
        left: 0.004.sw,
        right: 0.004.sw,
      ),
      padding: EdgeInsets.symmetric(vertical: 0.0075.sh),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          assetImagePath.isNotEmpty ? SvgPicture.asset(
            assetImagePath,
            fit: BoxFit.fill,
            color: AppColors.gold,
            width: 30.sp,
          ) : const SizedBox(),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 0.005.sw),
              child: AutoSizeText(
                text,
                style: FontStyles.bold17,
                minFontSize: 7,
              ),
              //padding: EdgeInsets.only(top: 0.03.sh, bottom: 0.03.sh, left: 0.008.sw),
            ),
          ),
        ],
      ),
    );
  }
}
