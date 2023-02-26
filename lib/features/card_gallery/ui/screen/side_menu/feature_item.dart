import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum FeatureItemType {
  cardLibrary,
  deckBuilder,
}

class FeatureItem extends StatelessWidget {
  const FeatureItem(
      {required this.type, required this.isSelected, required this.onTap});

  final FeatureItemType type;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10.h,
        left: 10.w,
        right: 10.w,
      ),
      child: InkWell(
        onTap: () => onTap(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _getImage(type, isSelected),
            Expanded(
              child: Container(
                child: _getTitle(type, isSelected),
                padding: EdgeInsets.only(left: 5.w),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getImage(FeatureItemType type, bool isSelected) {
    switch (type) {
      case FeatureItemType.cardLibrary:
        return Image.asset(
          assetPath(SUBFOLDER_MISC,
              isSelected ? "card_library_selected" : "card_library"),
          width: 75.w,
          fit: BoxFit.fill,
        );
      case FeatureItemType.deckBuilder:
        return Image.asset(
          assetPath(SUBFOLDER_MISC,
              isSelected ? "deck_builder_selected" : "deck_builder"),
          width: 75.w,
          fit: BoxFit.fill,
        );
    }
  }

  Widget _getTitle(FeatureItemType type, bool isSelected) {
    switch (type) {
      case FeatureItemType.cardLibrary:
        return AutoSizeText(
          LocaleKeys.cardLibrary.tr(),
          style: _getTextStyle(isSelected),
          maxLines: 2,
        );
      case FeatureItemType.deckBuilder:
        return AutoSizeText(
          LocaleKeys.deckBuilder.tr(),
          style: _getTextStyle(isSelected),
          maxLines: 2,
        );
    }
  }

  TextStyle _getTextStyle(bool isSelected) {
    switch (isSelected) {
      case true:
        return FontStyles.bold22GoldWithShadow;
      default:
        return FontStyles.bold22WithShadow;
    }
  }
}
