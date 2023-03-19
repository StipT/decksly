import "package:decksly/features/card_gallery/domain/model/card_filters/card_filter_interface/card_filter_interface.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:easy_localization/easy_localization.dart";

enum CardType implements CardFilter {
  any(""),
  hero("hero"),
  minion("minion"),
  spell("spell"),
  weapon("weapon"),
  location("location");

  const CardType(this.value);

  @override
  final String value;

  @override
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

  int id() {
    switch (this) {
      case CardType.any:
        return -1;
      case CardType.hero:
        return 3;
      case CardType.minion:
        return 4;
      case CardType.spell:
        return 5;
      case CardType.weapon:
        return 7;
      case CardType.location:
        return 39;
    }
  }
}
