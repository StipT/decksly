import "package:decksly/features/card_gallery/domain/model/card_filters/card_filter_interface/card_filter_interface.dart";
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
}
