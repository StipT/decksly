import 'package:decksly/presentation/resources/locale_keys.g.dart';

enum MinionType {
  any,
  beast,
  demon,
  dragon,
  elemental,
  mech,
  murloc,
  naga,
  pirate,
  quilboar,
  totem,
  undead,
}

extension MinionTypeValues on MinionType {
  String get value {
    switch (this) {
      case MinionType.any:
        return "";
      case MinionType.beast:
        return "beast";
      case MinionType.demon:
        return "demon";
      case MinionType.dragon:
        return "dragon";
      case MinionType.elemental:
        return "elemental";
      case MinionType.mech:
        return "mech";
      case MinionType.murloc:
        return "murloc";
      case MinionType.naga:
        return "naga";
      case MinionType.pirate:
        return "pirate";
      case MinionType.quilboar:
        return "quilboar";
      case MinionType.totem:
        return "totem";
      case MinionType.undead:
        return "undead";
    }
  }

  static List<MinionType> get values => [
    MinionType.any,
    MinionType.beast,
    MinionType.demon,
    MinionType.dragon,
    MinionType.elemental,
    MinionType.mech,
    MinionType.murloc,
    MinionType.naga,
    MinionType.pirate,
    MinionType.quilboar,
    MinionType.totem,
    MinionType.undead,
      ];
}

extension MinionTypeLocalized on MinionType {
  String localized() {
    switch (this) {
      case MinionType.any:
        return LocaleKeys.any.tr();
      case MinionType.beast:
        return LocaleKeys.free.tr();
      case MinionType.demon:
        return LocaleKeys.common.tr();
      case MinionType.dragon:
        return LocaleKeys.rare.tr();
      case MinionType.elemental:
        return LocaleKeys.epic.tr();
      case MinionType.mech:
        return LocaleKeys.legendary.tr();
      case MinionType.murloc:
        return LocaleKeys.rare.tr();
      case MinionType.naga:
        return LocaleKeys.epic.tr();
      case MinionType.pirate:
        return LocaleKeys.legendary.tr();
      case MinionType.quilboar:
        return LocaleKeys.rare.tr();
      case MinionType.totem:
        return LocaleKeys.epic.tr();
      case MinionType.undead:
        return LocaleKeys.undead.tr();
    }
  }
}

MinionType minionTypeFromIndex(int index) {
  switch (index) {
    case 0:
      return MinionType.any;
    case 1:
      return MinionType.beast;
    case 2:
      return MinionType.demon;
    case 3:
      return MinionType.dragon;
    case 4:
      return MinionType.elemental;
    case 5:
      return MinionType.mech;
    case 6:
      return MinionType.murloc;
    case 7:
      return MinionType.naga;
    case 8:
      return MinionType.pirate;
    case 9:
      return MinionType.quilboar;
    case 10:
      return MinionType.totem;
    case 11:
      return MinionType.undead;
    default:
      return MinionType.any;
  }
}
