import "package:decksly/domain/card_gallery/model/card_filters/card_filter/card_filter.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:easy_localization/easy_localization.dart";

enum CardClass implements CardFilter {
  allClasses(""),
  deathKnight("deathknight"),
  demonHunter("demonhunter"),
  druid("druid"),
  hunter("hunter"),
  mage("mage"),
  paladin("paladin"),
  priest("priest"),
  rogue("rogue"),
  shaman("shaman"),
  warlock("warlock"),
  warrior("warrior"),
  neutral("neutral");

  const CardClass(this.value);

  @override
  final String value;

  @override
  String localized() {
    switch (this) {
      case CardClass.allClasses:
        return LocaleKeys.allClasses.tr();
      case CardClass.deathKnight:
        return LocaleKeys.deathknight.tr();
      case CardClass.demonHunter:
        return LocaleKeys.demonhunter.tr();
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

  @override
  int id() {
    switch (this) {
      case CardClass.allClasses:
        return -1;
      case CardClass.deathKnight:
        return 1;
      case CardClass.demonHunter:
        return 14;
      case CardClass.druid:
        return 2;
      case CardClass.hunter:
        return 3;
      case CardClass.mage:
        return 4;
      case CardClass.paladin:
        return 5;
      case CardClass.priest:
        return 6;
      case CardClass.rogue:
        return 7;
      case CardClass.shaman:
        return 8;
      case CardClass.warlock:
        return 9;
      case CardClass.warrior:
        return 10;
      case CardClass.neutral:
        return 12;
    }
  }
}
