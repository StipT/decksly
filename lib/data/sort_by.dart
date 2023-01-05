import 'package:decksly/presentation/resources/locale_keys.g.dart';

enum SortBy {
  manaAsc,
  manaDesc,
  nameAsc,
  nameDesc,
  attackAsc,
  attackDesc,
  healthAsc,
  healthDesc,
}

extension SortByValues on SortBy {
  String get value {
    switch (this) {
      case SortBy.manaAsc:
        return "manaCost:asc";
      case SortBy.manaDesc:
        return "manaCost:desc";
      case SortBy.nameAsc:
        return "name:asc";
      case SortBy.nameDesc:
        return "name:desc";
      case SortBy.attackAsc:
        return "attack:asc";
      case SortBy.attackDesc:
        return "attack:desc";
      case SortBy.healthAsc:
        return "health:asc";
      case SortBy.healthDesc:
        return "health:desc";
    }
  }

  static List<SortBy> get values => [
        SortBy.manaAsc,
        SortBy.manaDesc,
        SortBy.nameAsc,
        SortBy.nameDesc,
        SortBy.attackAsc,
        SortBy.attackDesc,
        SortBy.healthAsc,
        SortBy.healthDesc,
      ];
}

extension SortByLocalized on SortBy {
  String localized() {
    switch (this) {
      case SortBy.manaAsc:
        return LocaleKeys.manaAsc.tr();
      case SortBy.manaDesc:
        return LocaleKeys.manaDesc.tr();
      case SortBy.nameAsc:
        return LocaleKeys.nameAsc.tr();
      case SortBy.nameDesc:
        return LocaleKeys.nameDesc.tr();
      case SortBy.attackAsc:
        return LocaleKeys.attackAsc.tr();
      case SortBy.attackDesc:
        return LocaleKeys.attackDesc.tr();
      case SortBy.healthAsc:
        return LocaleKeys.healthAsc.tr();
      case SortBy.healthDesc:
        return LocaleKeys.healthDesc.tr();
    }
  }
}

SortBy sortByFromIndex(int index) {
  switch (index) {
    case 0:
      return SortBy.manaAsc;
    case 1:
      return SortBy.manaDesc;
    case 2:
      return SortBy.nameAsc;
    case 3:
      return SortBy.nameDesc;
    case 4:
      return SortBy.attackAsc;
    case 5:
      return SortBy.attackDesc;
    case 6:
      return SortBy.healthAsc;
    case 7:
      return SortBy.healthDesc;
    default:
      return SortBy.manaAsc;
  }
}
