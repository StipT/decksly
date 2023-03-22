import "package:auto_size_text/auto_size_text.dart";
import "package:decksly/common/design/colors.dart";
import "package:decksly/common/design/fonts.dart";
import "package:decksly/common/dev/asset_loader.dart";
import "package:decksly/domain/card_gallery/model/card_filters/card_filter/card_filter.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";

class SetDropdownHeader extends StatelessWidget {
  const SetDropdownHeader({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 0.875.h,
        horizontal: 2.w,
      ),
      child: Text(
        text,
        style: FontStyles.bold17Grey(),
      ),
    );
  }
}

class SetDropdownItem extends StatelessWidget {
  const SetDropdownItem({
    super.key,
    required this.cardFilter,
    required this.isSelected,
  });

  final CardFilter cardFilter;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 6.w,
        right: 6.w,
      ),
      padding: EdgeInsets.symmetric(vertical: 2.5.h),
      child: Row(
        children: [
          SvgPicture.asset(
            assetPath(kSubfolderSet, _assetName(), fileExtension: kSVGExtension),
            fit: BoxFit.fill,
            color: AppColors.gold,
            width: 30.w,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 6.w),
              child: AutoSizeText(
                cardFilter.localized(),
                style: isSelected ? FontStyles.bold15Gold() : FontStyles.bold15(),
                overflow: TextOverflow.fade,
                minFontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _assetName() {
    return cardFilter.toString().split(".")[1];
  }
}
