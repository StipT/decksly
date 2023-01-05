import 'package:decksly/presentation/resources/locale_keys.g.dart';

enum SpellSchool {
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
      return SpellSchool.arcane;
    case 1:
      return SpellSchool.fire;
    case 2:
      return SpellSchool.frost;
    case 3:
      return SpellSchool.nature;
    case 4:
      return SpellSchool.holy;
    case 5:
      return SpellSchool.shadow;
    case 6:
      return SpellSchool.fel;
    default:
      return SpellSchool.arcane;
  }
}
