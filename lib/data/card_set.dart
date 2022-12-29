const String CARD_SET_STANDARD = "standard cards";
const String CARD_SET_WILD = "wild cards";
const String CARD_SET_CLASSIC = "classic cards";
const String CARD_SET_CURRENT_ARENA = "current arena cards";
const String CARD_SET_CURRENT_DUELS = "current duels cards";

enum CardSet {
  standard,
  wild,
  classic,
  currentArena,
  currentDuels,
  // TODO Add all standard and wild sets
}

extension CardSetValues on CardSet {
  String get value {
    switch (this) {
      case CardSet.standard:
        return CARD_SET_STANDARD;
      case CardSet.wild:
        return CARD_SET_WILD;
      case CardSet.classic:
        return CARD_SET_CLASSIC;
      case CardSet.currentArena:
        return CARD_SET_CURRENT_ARENA;
      case CardSet.currentDuels:
        return CARD_SET_CURRENT_DUELS;
    }
  }

  static List<CardSet> get values => [
        CardSet.standard,
        CardSet.wild,
        CardSet.classic,
        CardSet.currentArena,
        CardSet.currentDuels,
      ];
}
