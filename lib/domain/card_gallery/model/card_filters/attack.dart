import "package:decksly/domain/card_gallery/model/card_filters/card_filter/card_filter.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:easy_localization/easy_localization.dart";

enum Attack implements CardFilter {
  any(""),
  zero("0"),
  one("1"),
  two("2"),
  three("3"),
  four("4"),
  five("5"),
  six("6"),
  seven("7"),
  eight("8"),
  nine("9"),
  ten("10");

  const Attack(this.value);

  @override
  final String value;

  @override
  String localized() {
    switch (this) {
      case Attack.any:
        return LocaleKeys.any.tr();
      case Attack.zero:
        return "0";
      case Attack.one:
        return "1";
      case Attack.two:
        return "2";
      case Attack.three:
        return "3";
      case Attack.four:
        return "4";
      case Attack.five:
        return "5";
      case Attack.six:
        return "6";
      case Attack.seven:
        return "7";
      case Attack.eight:
        return "8";
      case Attack.nine:
        return "9";
      case Attack.ten:
        return "10+";
    }
  }

  @override
  int id() {
    switch (this) {
      case Attack.any:
        return -1;
      case Attack.zero:
        return 0;
      case Attack.one:
        return 1;
      case Attack.two:
        return 2;
      case Attack.three:
        return 3;
      case Attack.four:
        return 4;
      case Attack.five:
        return 5;
      case Attack.six:
        return 6;
      case Attack.seven:
        return 7;
      case Attack.eight:
        return 8;
      case Attack.nine:
        return 9;
      case Attack.ten:
        return 10;
    }
  }
}
