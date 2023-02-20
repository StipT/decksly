import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum CardClass {
  allClasses,
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
  neutral,
}

extension CardClassValues on CardClass {
  String get value {
    switch (this) {
      case CardClass.allClasses:
        return "";
      case CardClass.deathKnight:
        return "deathknight";
      case CardClass.demonHunter:
        return "demonhunter";
      case CardClass.druid:
        return "druid";
      case CardClass.hunter:
        return "hunter";
      case CardClass.mage:
        return "mage";
      case CardClass.paladin:
        return "paladin";
      case CardClass.priest:
        return "priest";
      case CardClass.rogue:
        return "rogue";
      case CardClass.shaman:
        return "shaman";
      case CardClass.warlock:
        return "warlock";
      case CardClass.warrior:
        return "warrior";
      case CardClass.neutral:
        return "neutral";
    }
  }

  static List<CardClass> get values => [
        CardClass.allClasses,
        CardClass.deathKnight,
        CardClass.demonHunter,
        CardClass.druid,
        CardClass.hunter,
        CardClass.mage,
        CardClass.paladin,
        CardClass.priest,
        CardClass.rogue,
        CardClass.shaman,
        CardClass.warlock,
        CardClass.warrior,
    CardClass.neutral,
      ];
}

extension CardClassLocalized on CardClass {
  String localized() {
    switch (this) {
      case CardClass.allClasses:
        return LocaleKeys.allClasses.tr();
      case CardClass.deathKnight:
        return LocaleKeys.deathKnight.tr();
      case CardClass.demonHunter:
        return LocaleKeys.demonHunter.tr();
      case CardClass.druid:
        return LocaleKeys.druid.tr();
      case CardClass.hunter:
        return LocaleKeys.hunter.tr();
      case CardClass.mage:
        return LocaleKeys.mage.tr();
      case CardClass.paladin:
        return LocaleKeys.paladin.tr();
      case CardClass.priest:
        return LocaleKeys.priest.tr();
      case CardClass.rogue:
        return LocaleKeys.rogue.tr();
      case CardClass.shaman:
        return LocaleKeys.shaman.tr();
      case CardClass.warlock:
        return LocaleKeys.warlock.tr();
      case CardClass.warrior:
        return LocaleKeys.warrior.tr();
      case CardClass.neutral:
        return LocaleKeys.neutral.tr();
    }
  }
}

CardClass cardClassFromIndex(int index) {
  switch (index) {
    case 0:
      return CardClass.allClasses;
    case 1:
      return CardClass.deathKnight;
    case 2:
      return CardClass.demonHunter;
    case 3:
      return CardClass.druid;
    case 4:
      return CardClass.hunter;
    case 5:
      return CardClass.mage;
    case 6:
      return CardClass.paladin;
    case 7:
      return CardClass.priest;
    case 8:
      return CardClass.rogue;
    case 9:
      return CardClass.shaman;
    case 10:
      return CardClass.warlock;
    case 11:
      return CardClass.warrior;
    case 12:
      return CardClass.neutral;
    default:
      return CardClass.allClasses;
  }
}
