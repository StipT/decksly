import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum DeckClass {
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

extension DeckClassLocalized on DeckClass {
  String localized() {
    switch (this) {
      case DeckClass.deathKnight:
        return LocaleKeys.deathKnight.tr();
      case DeckClass.demonHunter:
        return LocaleKeys.demonHunter.tr();
      case DeckClass.druid:
        return LocaleKeys.druid.tr();
      case DeckClass.hunter:
        return LocaleKeys.hunter.tr();
      case DeckClass.mage:
        return LocaleKeys.mage.tr();
      case DeckClass.paladin:
        return LocaleKeys.paladin.tr();
      case DeckClass.priest:
        return LocaleKeys.priest.tr();
      case DeckClass.rogue:
        return LocaleKeys.rogue.tr();
      case DeckClass.shaman:
        return LocaleKeys.shaman.tr();
      case DeckClass.warlock:
        return LocaleKeys.warlock.tr();
      case DeckClass.warrior:
        return LocaleKeys.warrior.tr();
    }
  }
}

DeckClass deckClassFromValue(String deckClass) {
  switch (deckClass) {
    case "deathKnight":
      return DeckClass.deathKnight;
    case "demonHunter":
      return DeckClass.demonHunter;
    case "druid":
      return DeckClass.druid;
    case "hunter":
      return DeckClass.hunter;
    case "mage":
      return DeckClass.mage;
    case "paladin":
      return DeckClass.paladin;
    case "priest":
      return DeckClass.priest;
    case "rogue":
      return DeckClass.rogue;
    case "shaman":
      return DeckClass.shaman;
    case "warlock":
      return DeckClass.warlock;
    case "warrior":
      return DeckClass.warrior;
    default:
      return DeckClass.warrior;
  }
}
