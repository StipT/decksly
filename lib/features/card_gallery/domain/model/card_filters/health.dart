import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum Health {
  any,
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
}

extension HealthValues on Health {
  String get value {
    switch (this) {
      case Health.any:
        return "";
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
        return "10";
    }
  }

  static List<Health> get values => [
        Health.any,
        Health.zero,
        Health.one,
        Health.two,
        Health.three,
        Health.four,
        Health.five,
        Health.six,
        Health.seven,
        Health.eight,
        Health.nine,
        Health.ten,
      ];
}

extension HealthLocalized on Health {
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

Health healthFromIndex(int index) {
  switch (index) {
    case 0:
      return Health.any;
    case 1:
      return Health.zero;
    case 2:
      return Health.one;
    case 3:
      return Health.two;
    case 4:
      return Health.three;
    case 5:
      return Health.four;
    case 6:
      return Health.five;
    case 7:
      return Health.six;
    case 8:
      return Health.seven;
    case 9:
      return Health.eight;
    case 10:
      return Health.nine;
    case 11:
      return Health.ten;
    default:
      return Health.any;
  }
}
