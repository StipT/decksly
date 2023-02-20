import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum Attack {
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

extension AttackValues on Attack {
  String get value {
    switch (this) {
      case Attack.any:
        return "";
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
        return "10";
    }
  }

  static List<Attack> get values => [
        Attack.any,
        Attack.zero,
        Attack.one,
        Attack.two,
        Attack.three,
        Attack.four,
        Attack.five,
        Attack.six,
        Attack.seven,
        Attack.eight,
        Attack.nine,
        Attack.ten,
      ];
}

extension AttackLocalized on Attack {
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
}

Attack attackFromIndex(int index) {
  switch (index) {
    case 0:
      return Attack.any;
    case 1:
      return Attack.zero;
    case 2:
      return Attack.one;
    case 3:
      return Attack.two ;
    case 4:
      return Attack.three;
    case 5:
      return Attack.four;
    case 6:
      return Attack.five;
    case 7:
      return Attack.six;
    case 8:
      return Attack.seven;
    case 9:
      return Attack.eight;
    case 10:
      return Attack.nine;
    case 11:
      return Attack.ten;
    default:
      return Attack.any;
  }
}
