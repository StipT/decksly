import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_type.dart';
import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSModeBadge extends StatelessWidget {
  const HSModeBadge({required this.type, required this.isSelected, required this.onTap});

  final DeckType type;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
      ),
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 6,
              child: Stack(
                children: [
                  _getImage(type),
                  if (isSelected) Image.asset(assetPath(kSubfolderMisc, "deckbuilder_tab_selected")),
                ],
              ),
            ),
            Container(
              child: _getTitle(type, isSelected),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getImage(DeckType type) {
    switch (type) {
      case DeckType.standard:
        return Stack(
          children: [
            Image.asset(assetPath(kSubfolderMisc, "deckbuilder_tab_standard")),
          ],
        );
      case DeckType.classic:
        return Image.asset(assetPath(kSubfolderMisc, "deckbuilder_tab_classic"));
      case DeckType.wild:
        return Image.asset(assetPath(kSubfolderMisc, "deckbuilder_tab_wild"));
    }
  }

  Widget _getTitle(DeckType type, bool isSelected) {
    switch (type) {
      case DeckType.standard:
        return AutoSizeText(
          LocaleKeys.standard.tr(),
          style: _getTextStyle(isSelected),
          maxLines: 1,
        );
      case DeckType.classic:
        return AutoSizeText(
          LocaleKeys.classic.tr(),
          style: _getTextStyle(isSelected),
          maxLines: 1,
        );

      case DeckType.wild:
        return AutoSizeText(
          LocaleKeys.wild.tr(),
          style: _getTextStyle(isSelected),
          maxLines: 1,
        );
    }
  }

  TextStyle _getTextStyle(bool isSelected) {
    switch (isSelected) {
      case true:
        return FontStyles.bold15;
      default:
        return FontStyles.bold15;
    }
  }
}
