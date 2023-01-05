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
  int get value {
    switch (this) {
      case Health.any:
        return -1;
      case Health.zero:
        return 0;
      case Health.one:
        return 1;
      case Health.two:
        return 2;
      case Health.three:
        return 3;
      case Health.four:
        return 4;
      case Health.five:
        return 5;
      case Health.six:
        return 6;
      case Health.seven:
        return 7;
      case Health.eight:
        return 8;
      case Health.nine:
        return 9;
      case Health.ten:
        return 10;
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
}

Health healthFromIndex(int index) {
  switch (index) {
    case 0:
      return Health.zero;
    case 1:
      return Health.one;
    case 2:
      return Health.two ;
    case 3:
      return Health.three;
    case 4:
      return Health.four;
    case 5:
      return Health.five;
    case 6:
      return Health.six;
    case 7:
      return Health.seven;
    case 8:
      return Health.eight;
    case 9:
      return Health.nine;
    case 10:
      return Health.ten;
    default:
      return Health.any;
  }
}
