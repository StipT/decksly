import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class SetListItem {
  Widget build(BuildContext context);
}

class SetDropdownHeader extends StatelessWidget implements SetListItem {
  const SetDropdownHeader({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: FontStyles.bold17Grey,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 0.5.h,
        horizontal: 2.w,
      ),
    );
  }
}

class SetDropdownItem extends StatelessWidget implements SetListItem {
  const SetDropdownItem({
    required this.assetImagePath,
    required this.text,
    required this.isSelected,
  });

  final String assetImagePath;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 6.w,
        right: 6.w,
      ),
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          assetImagePath.isNotEmpty
              ? SvgPicture.asset(
                  assetImagePath,
                  fit: BoxFit.fill,
                  color: AppColors.gold,
                  width: 30.w,
                )
              : const SizedBox(),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 6.w),
              child: AutoSizeText(
                text,
                style: isSelected ? FontStyles.bold15Gold : FontStyles.bold15,
                overflow: TextOverflow.fade,
                minFontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
