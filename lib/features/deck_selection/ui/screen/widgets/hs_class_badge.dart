import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/data/card_class.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_class.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HSClassBadge extends StatelessWidget {
  const HSClassBadge({
    required this.modeType,
    required this.classType,
    required this.isSelected,
    required this.onTap,
  });

  final DeckClass classType;
  final DeckType modeType;
  final bool isSelected;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDisabled = _isClassDisabled(modeType, classType);
    return Container(
      width: 120.w,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: InkWell(
        onTap: () => isDisabled ? null : onTap(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Stack(
              children: [
                _getImage(classType, isSelected, isDisabled),
                //    if (isSelected) Image.asset(assetPath(SUBFOLDER_MISC, "class_badge_selected")),
              ],
            ),
            Positioned(
              left: 37.5.w,
              bottom: 11.h,
              height: 17.5.h,
              width: 66.w,
              child: Container(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  _getTitle(classType),
                  maxLines: 1,
                  minFontSize: 8,
                  style: FontStyles.bold11WithShadow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getImage(DeckClass type, bool isSelected, bool isDisabled) {
    return Image.asset(
      assetPath(SUBFOLDER_CLASS, _getImageAsset(type)),
      color: isDisabled ? const Color.fromRGBO(255, 255, 255, 0.4) : null,
      colorBlendMode: isDisabled ? BlendMode.modulate : BlendMode.srcIn,
    );
  }

  String _getImageAsset(DeckClass type) {
    switch (type) {
      case DeckClass.deathknight:
        return "death_knight_badge";
      case DeckClass.demonhunter:
        return "demon_hunter_badge";
      case DeckClass.druid:
        return "druid_badge";
      case DeckClass.hunter:
        return "hunter_badge";
      case DeckClass.mage:
        return "mage_badge";
      case DeckClass.paladin:
        return "paladin_badge";
      case DeckClass.priest:
        return "priest_badge";
      case DeckClass.rogue:
        return "rogue_badge";
      case DeckClass.shaman:
        return "shaman_badge";
      case DeckClass.warlock:
        return "warlock_badge";
      case DeckClass.warrior:
        return "warrior_badge";
    }
  }

  String _getTitle(DeckClass type) {
    switch (type) {
      case DeckClass.deathknight:
        return CardClass.deathKnight.localized();

      case DeckClass.demonhunter:
        return CardClass.demonHunter.localized();

      case DeckClass.druid:
        return CardClass.druid.localized();

      case DeckClass.hunter:
        return CardClass.hunter.localized();

      case DeckClass.mage:
        return CardClass.mage.localized();

      case DeckClass.paladin:
        return CardClass.paladin.localized();

      case DeckClass.priest:
        return CardClass.priest.localized();

      case DeckClass.rogue:
        return CardClass.rogue.localized();

      case DeckClass.shaman:
        return CardClass.shaman.localized();

      case DeckClass.warlock:
        return CardClass.warlock.localized();

      case DeckClass.warrior:
        return CardClass.warrior.localized();
    }
  }

  bool _isClassDisabled(DeckType modeType, DeckClass classType) {
    if (modeType == DeckType.classic) {
      switch (classType) {
        case DeckClass.deathknight:
        case DeckClass.demonhunter:
          return true;

        case DeckClass.druid:
        case DeckClass.hunter:
        case DeckClass.mage:
        case DeckClass.paladin:
        case DeckClass.priest:
        case DeckClass.rogue:
        case DeckClass.shaman:
        case DeckClass.warlock:
        case DeckClass.warrior:
          return false;
      }
    }
    return false;
  }
}
