import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/presentation/resources/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SideMenuItemType {
  cardLibrary,
  deckBuilder,
}

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({required this.type, required this.isSelected});

  final SideMenuItemType type;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(
        top: 10.h,
        left: 5.w,
        right: 5.w,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getImage(type, isSelected),
          Expanded(
            child: Container(child: _getTitle(type, isSelected), padding: EdgeInsets.only(left: 5.w),),
          ),
        ],
      ),
    );
  }

  Widget _getImage(SideMenuItemType type, bool isSelected) {
    switch (type) {
      case SideMenuItemType.cardLibrary:
        return Image.asset(assetPath(SUBFOLDER_MISC, isSelected ? "card_library_selected" : "card_library"));
      case SideMenuItemType.deckBuilder:
        return Image.asset(assetPath(SUBFOLDER_MISC, isSelected ? "deck_builder_selected" : "deck_builder"));
    }
  }

  Widget _getTitle(SideMenuItemType type, bool isSelected) {
    switch (type) {
      case SideMenuItemType.cardLibrary:
        return Text(
          LocaleKeys.cardLibrary.tr(),
          style: _getTextStyle(isSelected),
        );
      case SideMenuItemType.deckBuilder:
        return Text(
          LocaleKeys.deckBuilder.tr(),
          style: _getTextStyle(isSelected),
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
