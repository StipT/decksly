import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSDropdownItem extends StatelessWidget {
  const HSDropdownItem({
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
      height: 50.h,
      margin: EdgeInsets.only(
        bottom: 0.01.sh,
        left: 0.001.sw,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (assetImagePath.isNotEmpty)
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
                maxLines: 1,
                style: isSelected ? FontStyles.bold17Gold : FontStyles.bold17,
                overflow: TextOverflow.fade,
              ),
              //padding: EdgeInsets.only(top: 0.03.sh, bottom: 0.03.sh, left: 0.008.sw),
            ),
          ),
        ],
      ),
    );
  }
}
