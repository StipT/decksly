import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/data/card_class.dart';
import 'package:decksly/features/deck_selector/ui/screen/widgets/hs_mode_badge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ClassBadgeType {
  deathKnight,
  demonHunter,
  druid,
  hunter,
  mage,
  paladin,
  priest,
  rogue,
  shaman,
  warlock,
  warrior,
}

class HSClassBadge extends StatelessWidget {
  const HSClassBadge({
    required this.modeType,
    required this.classType,
    required this.isSelected,
    required this.onTap,
  });

  final ClassBadgeType classType;
  final ModeBadgeType modeType;
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
                if (isSelected) Image.asset(assetPath(SUBFOLDER_MISC, "class_badge_selected")),
              ],
            ),
            Positioned(
              left: 37.5.w,
              bottom: 7.5.h,
              height: 10.h,
              width: 66.w,
              child: Container(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  _getTitle(classType),
                  maxLines: 1,
                  minFontSize: 8,
                  style: FontStyles.bold12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getImage(ClassBadgeType type, bool isSelected, bool isDisabled) {
    return Image.asset(
      assetPath(SUBFOLDER_CLASS, _getImageAsset(type)),
      color: isDisabled ? const Color.fromRGBO(255, 255, 255, 0.4) : null,
      colorBlendMode: isDisabled ? BlendMode.modulate : BlendMode.srcIn,
    );
  }

  String _getImageAsset(ClassBadgeType type) {
    switch (type) {
      case ClassBadgeType.deathKnight:
        return "death_knight_badge";
      case ClassBadgeType.demonHunter:
        return "demon_hunter_badge";
      case ClassBadgeType.druid:
        return "druid_badge";
      case ClassBadgeType.hunter:
        return "hunter_badge";
      case ClassBadgeType.mage:
        return "mage_badge";
      case ClassBadgeType.paladin:
        return "paladin_badge";
      case ClassBadgeType.priest:
        return "priest_badge";
      case ClassBadgeType.rogue:
        return "rogue_badge";
      case ClassBadgeType.shaman:
        return "shaman_badge";
      case ClassBadgeType.warlock:
        return "warlock_badge";
      case ClassBadgeType.warrior:
        return "warrior_badge";
    }
  }

  String _getTitle(ClassBadgeType type) {
    switch (type) {
      case ClassBadgeType.deathKnight:
        return CardClass.deathKnight.localized();

      case ClassBadgeType.demonHunter:
        return CardClass.demonHunter.localized();

      case ClassBadgeType.druid:
        return CardClass.druid.localized();

      case ClassBadgeType.hunter:
        return CardClass.hunter.localized();

      case ClassBadgeType.mage:
        return CardClass.mage.localized();

      case ClassBadgeType.paladin:
        return CardClass.paladin.localized();

      case ClassBadgeType.priest:
        return CardClass.priest.localized();

      case ClassBadgeType.rogue:
        return CardClass.rogue.localized();

      case ClassBadgeType.shaman:
        return CardClass.shaman.localized();

      case ClassBadgeType.warlock:
        return CardClass.warlock.localized();

      case ClassBadgeType.warrior:
        return CardClass.warrior.localized();
    }
  }

  bool _isClassDisabled(ModeBadgeType modeType, ClassBadgeType classType) {
    if (modeType == ModeBadgeType.classic) {
      switch (classType) {
        case ClassBadgeType.deathKnight:
        case ClassBadgeType.demonHunter:
          return true;

        case ClassBadgeType.druid:
        case ClassBadgeType.hunter:
        case ClassBadgeType.mage:
        case ClassBadgeType.paladin:
        case ClassBadgeType.priest:
        case ClassBadgeType.rogue:
        case ClassBadgeType.shaman:
        case ClassBadgeType.warlock:
        case ClassBadgeType.warrior:
          return false;
      }
    }
    return false;
  }
}
