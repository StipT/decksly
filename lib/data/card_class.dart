const String CARD_CLASS_ALL = "all classes";
const String CARD_CLASS_NEUTRAL = "neutral";
const String CARD_CLASS_DEATH_KNIGHT = "death knight";
const String CARD_CLASS_DEMON_HUNTER = "demon hunter";
const String CARD_CLASS_DRUID = "druid";
const String CARD_CLASS_HUNTER = "hunter";
const String CARD_CLASS_MAGE = "mage";
const String CARD_CLASS_PALADIN = "paladin";
const String CARD_CLASS_PRIEST = "priest";
const String CARD_CLASS_ROGUE = "rogue";
const String CARD_CLASS_SHAMAN = "shaman";
const String CARD_CLASS_WARLOCK = "warlock";
const String CARD_CLASS_WARRIOR = "warrior";

enum CardClass {
  all,
  neutral,
  deathKnight,
  demonHunter,
  druid,
  hunter,
  mage,
  paladin,
  priest,
  rogue,
  shaman,
  warlock,
  warrior,
}

extension CardClassValues on CardClass {
  String get value {
    switch (this) {
      case CardClass.all:
        return CARD_CLASS_ALL;
      case CardClass.neutral:
        return CARD_CLASS_NEUTRAL;
      case CardClass.deathKnight:
        return CARD_CLASS_DEATH_KNIGHT;
      case CardClass.demonHunter:
        return CARD_CLASS_DEMON_HUNTER;
      case CardClass.druid:
        return CARD_CLASS_DRUID;
      case CardClass.hunter:
        return CARD_CLASS_HUNTER;
      case CardClass.mage:
        return CARD_CLASS_MAGE;
      case CardClass.paladin:
        return CARD_CLASS_PALADIN;
      case CardClass.priest:
        return CARD_CLASS_PRIEST;
      case CardClass.rogue:
        return CARD_CLASS_ROGUE;
      case CardClass.shaman:
        return CARD_CLASS_SHAMAN;
      case CardClass.warlock:
        return CARD_CLASS_WARLOCK;
      case CardClass.warrior:
        return CARD_CLASS_WARRIOR;
    }
  }

  static List<CardClass> get values => [
    CardClass.all,
    CardClass.neutral,
    CardClass.deathKnight,
    CardClass.demonHunter,
    CardClass.druid,
    CardClass.hunter,
    CardClass.mage,
    CardClass.paladin,
    CardClass.priest,
    CardClass.rogue,
    CardClass.shaman,
    CardClass.warlock,
    CardClass.warrior,
  ];
}
