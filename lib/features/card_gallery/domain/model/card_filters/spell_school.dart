import "package:decksly/features/card_gallery/domain/model/card_filters/card_filter/card_filter.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:easy_localization/easy_localization.dart";

enum SpellSchool implements CardFilter {
  any(""),
  arcane("arcane"),
  fire("fire"),
  frost("frost"),
  nature("nature"),
  holy("holy"),
  shadow("shadow"),
  fel("fel");

  const SpellSchool(this.value);

  @override
  final String value;

  @override
  String localized() {
    switch (this) {
      case SpellSchool.any:
        return LocaleKeys.anySpellSchool.tr();
      case SpellSchool.arcane:
        return LocaleKeys.arcane.tr();
      case SpellSchool.fire:
        return LocaleKeys.fire.tr();
      case SpellSchool.frost:
        return LocaleKeys.frost.tr();
      case SpellSchool.nature:
        return LocaleKeys.nature.tr();
      case SpellSchool.holy:
        return LocaleKeys.holy.tr();
      case SpellSchool.shadow:
        return LocaleKeys.shadow.tr();
      case SpellSchool.fel:
        return LocaleKeys.fel.tr();
    }
  }

  @override
  int id() {
    switch (this) {
      case SpellSchool.any:
        return -1;
      case SpellSchool.arcane:
        return 1;
      case SpellSchool.fire:
        return 2;
      case SpellSchool.frost:
        return 3;
      case SpellSchool.nature:
        return 4;
      case SpellSchool.holy:
        return 5;
      case SpellSchool.shadow:
        return 6;
      case SpellSchool.fel:
        return 7;
    }
  }
}
