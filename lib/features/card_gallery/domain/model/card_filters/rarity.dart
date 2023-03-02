import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum Rarity {
  any,
  free,
  common,
  rare,
  epic,
  legendary,
}

extension RarityValues on Rarity {
  String get value {
    switch (this) {
      case Rarity.any:
        return "";
      case Rarity.free:
        return "free";
      case Rarity.common:
        return "common";
      case Rarity.rare:
        return "rare";
      case Rarity.epic:
        return "epic";
      case Rarity.legendary:
        return "legendary";
    }
  }

  static List<Rarity> get values => [
        Rarity.any,
        Rarity.free,
        Rarity.common,
        Rarity.rare,
        Rarity.epic,
        Rarity.legendary,
      ];
}

extension RarityLocalized on Rarity {
  String localized() {
    switch (this) {
      case Rarity.any:
        return LocaleKeys.anyRarity.tr();
      case Rarity.free:
        return LocaleKeys.free.tr();
      case Rarity.common:
        return LocaleKeys.common.tr();
      case Rarity.rare:
        return LocaleKeys.rare.tr();
      case Rarity.epic:
        return LocaleKeys.epic.tr();
      case Rarity.legendary:
        return LocaleKeys.legendary.tr();
    }
  }
}

Rarity rarityFromIndex(int index) {
  switch (index) {
    case 0:
      return Rarity.any;
    case 1:
      return Rarity.free;
    case 2:
      return Rarity.common;
    case 3:
      return Rarity.rare;
    case 4:
      return Rarity.epic;
    case 5:
      return Rarity.legendary;
    default:
      return Rarity.any;
  }
}
