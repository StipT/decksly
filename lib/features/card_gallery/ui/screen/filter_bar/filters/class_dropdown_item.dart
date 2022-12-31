import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassDropdownItem extends StatelessWidget {
  const ClassDropdownItem({
    required this.assetImagePath,
    required this.className,
  });

  final String assetImagePath;
  final String className;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 0.01.sh,
        right: 0.01.sw,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          assetImagePath.isNotEmpty
              ? Image.asset(
                  assetImagePath,
                  width: 40.sp,
                )
              : const SizedBox(),
          Container(
            padding: EdgeInsets.only(left: 0.005.sw),
            child: AutoSizeText(
              className,
              style: FontStyles.bold17,
            ),
            //padding: EdgeInsets.only(top: 0.03.sh, bottom: 0.03.sh, left: 0.008.sw),
          ),
        ],
      ),
    );
  }
}
