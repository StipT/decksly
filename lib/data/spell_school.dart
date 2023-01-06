import 'package:decksly/presentation/resources/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum SpellSchool {
  any,
  arcane,
  fire,
  frost,
  nature,
  holy,
  shadow,
  fel,
}

extension SpellSchoolValues on SpellSchool {
  String get value {
    switch (this) {
      case SpellSchool.any:
        return "";
      case SpellSchool.arcane:
        return "arcane";
      case SpellSchool.fire:
        return "fire";
      case SpellSchool.frost:
        return "frost";
      case SpellSchool.nature:
        return "nature";
      case SpellSchool.holy:
        return "holy";
      case SpellSchool.shadow:
        return "shadow";
      case SpellSchool.fel:
        return "fel";
    }
  }

  static List<SpellSchool> get values => [
    SpellSchool.any,
    SpellSchool.arcane,
    SpellSchool.fire,
    SpellSchool.frost,
    SpellSchool.nature,
    SpellSchool.holy,
    SpellSchool.shadow,
    SpellSchool.fel,
  ];
}

extension SpellSchoolLocalized on SpellSchool {
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
}

SpellSchool spellSchoolFromIndex(int index) {
  switch (index) {
    case 0:
      return SpellSchool.any;
    case 1:
      return SpellSchool.arcane;
    case 2:
      return SpellSchool.fire;
    case 3:
      return SpellSchool.frost;
    case 4:
      return SpellSchool.nature;
    case 5:
      return SpellSchool.holy;
    case 6:
      return SpellSchool.shadow;
    case 7:
      return SpellSchool.fel;
    default:
      return SpellSchool.any;
  }
}
