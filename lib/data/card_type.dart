import 'package:decksly/presentation/resources/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum CardType {
  any,
  hero,
  minion,
  spell,
  weapon,
  location,
}

extension CardTypeValues on CardType {
  String get value {
    switch (this) {
      case CardType.any:
        return "";
      case CardType.hero:
        return "hero";
      case CardType.minion:
        return "minion";
      case CardType.spell:
        return "spell";
      case CardType.weapon:
        return "weapon";
      case CardType.location:
        return "location";
    }
  }

  static List<CardType> get values => [
        CardType.any,
        CardType.hero,
        CardType.minion,
        CardType.spell,
        CardType.weapon,
        CardType.location,
      ];
}

extension CardTypeLocalized on CardType {
  String localized() {
    switch (this) {
      case CardType.any:
        return LocaleKeys.anyCardType.tr();
      case CardType.hero:
        return LocaleKeys.hero.tr();
      case CardType.minion:
        return LocaleKeys.minion.tr();
      case CardType.spell:
        return LocaleKeys.spell.tr();
      case CardType.weapon:
        return LocaleKeys.weapon.tr();
      case CardType.location:
        return LocaleKeys.location.tr();
    }
  }
}

CardType cardTypeFromIndex(int index) {
  switch (index) {
    case 0:
      return CardType.any;
    case 1:
      return CardType.hero;
    case 2:
      return CardType.minion;
    case 3:
      return CardType.spell;
    case 4:
      return CardType.weapon;
    case 5:
      return CardType.location;
    default:
      return CardType.any;
  }
}
