import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/data/card_class.dart';
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
  const HSClassBadge({required this.type, required this.isSelected, required this.onTap});

  final ClassBadgeType type;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: InkWell(
        onTap: () => onTap(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Stack(
              children: [
                _getImage(type, isSelected),
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
                  _getTitle(type),
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

  Widget _getImage(ClassBadgeType type, bool isSelected) {
    switch (type) {
      case ClassBadgeType.deathKnight:
        return Image.asset(assetPath(SUBFOLDER_CLASS, "death_knight_badge"));
      case ClassBadgeType.demonHunter:
        return Image.asset(assetPath(SUBFOLDER_CLASS, "demon_hunter_badge"));
      case ClassBadgeType.druid:
        return Image.asset(assetPath(SUBFOLDER_CLASS, "druid_badge"));
      case ClassBadgeType.hunter:
        return Image.asset(assetPath(SUBFOLDER_CLASS, "hunter_badge"));
      case ClassBadgeType.mage:
        return Image.asset(assetPath(SUBFOLDER_CLASS, "mage_badge"));
      case ClassBadgeType.paladin:
        return Image.asset(assetPath(SUBFOLDER_CLASS, "paladin_badge"));
      case ClassBadgeType.priest:
        return Image.asset(assetPath(SUBFOLDER_CLASS, "priest_badge"));
      case ClassBadgeType.rogue:
        return Image.asset(assetPath(SUBFOLDER_CLASS, "rogue_badge"));
      case ClassBadgeType.shaman:
        return Image.asset(assetPath(SUBFOLDER_CLASS, "shaman_badge"));
      case ClassBadgeType.warlock:
        return Image.asset(assetPath(SUBFOLDER_CLASS, "warlock_badge"));
      case ClassBadgeType.warrior:
        return Image.asset(assetPath(SUBFOLDER_CLASS, "warrior_badge"));
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
}
