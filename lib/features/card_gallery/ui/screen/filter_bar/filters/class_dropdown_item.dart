import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/asset_loader.dart';
import 'package:decksly/common/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassDropdownItem extends StatelessWidget {
  const ClassDropdownItem({
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
        left: 0.001.sw,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(children: [
            Center(
              child: Image.asset(
                assetPath("misc", "golden_circle_border"),
                fit: BoxFit.fill,
                width: 40.sp,
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(5.sp),
                  child: assetImagePath.isNotEmpty
                  ? Image.asset(
                assetImagePath,
                fit: BoxFit.fill,
                width: 30.sp,
              )
                  : const SizedBox()),
            ),
          ]),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 0.01.sw),
              child: AutoSizeText(
                text,
                style: FontStyles.bold15,
              ),
              //padding: EdgeInsets.only(top: 0.03.sh, bottom: 0.03.sh, left: 0.008.sw),
            ),
          ),
        ],
      ),
    );
  }
}
