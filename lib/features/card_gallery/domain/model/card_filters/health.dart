import "package:decksly/features/card_gallery/domain/model/card_filters/card_filter_interface/card_filter_interface.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:easy_localization/easy_localization.dart";

enum Health implements CardFilter {
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

  const Health(this.value);

  @override
  final String value;

  @override
  String localized() {
    switch (this) {
      case Health.any:
        return LocaleKeys.any.tr();
      case Health.zero:
        return "0";
      case Health.one:
        return "1";
      case Health.two:
        return "2";
      case Health.three:
        return "3";
      case Health.four:
        return "4";
      case Health.five:
        return "5";
      case Health.six:
        return "6";
      case Health.seven:
        return "7";
      case Health.eight:
        return "8";
      case Health.nine:
        return "9";
      case Health.ten:
        return "10+";
    }
  }
}
