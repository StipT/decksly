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
        bottom: 1.h,
        left: 1.w,
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
                  width: 15.w,
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                    child: assetImagePath.isNotEmpty
                        ? Image.asset(
                            assetImagePath,
                            fit: BoxFit.fill,
                            width: 12.5.w,
                          )
                        : const SizedBox()),
              ),
            ]),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 3.w),
              child: AutoSizeText(
                text,
                maxLines: 1,
                style: isSelected ? FontStyles.bold17Gold : FontStyles.bold17,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
