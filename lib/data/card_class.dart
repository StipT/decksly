const String CARD_CLASS_ALL = "All Classes";
const String CARD_CLASS_NEUTRAL = "Neutral";
const String CARD_CLASS_DEATH_KNIGHT = "Death Knight";
const String CARD_CLASS_DEMON_HUNTER = "Demon Hunter";
const String CARD_CLASS_DRUID = "Druid";
const String CARD_CLASS_HUNTER = "Hunter";
const String CARD_CLASS_MAGE = "Mage";
const String CARD_CLASS_PALADIN = "Paladin";
const String CARD_CLASS_PRIEST = "Priest";
const String CARD_CLASS_ROGUE = "Rogue";
const String CARD_CLASS_SHAMAN = "Shaman";
const String CARD_CLASS_WARLOCK = "Warlock";
const String CARD_CLASS_WARRIOR = "Warrior";

enum CardClass {
  all,
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
  neutral,
}

extension CardClassValues on CardClass {
  String get value {
    switch (this) {
      case CardClass.all:
        return CARD_CLASS_ALL;
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
      case CardClass.neutral:
        return CARD_CLASS_NEUTRAL;
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

extension CardClassFromIndex on CardClass {
  CardClass cardClassFromIndex(int index) {
    switch (index) {
      case 0:
        return CardClass.all;
      case 1:
        return CardClass.deathKnight;
      case 2:
        return CardClass.demonHunter;
      case 3:
        return CardClass.druid;
      case 4:
        return CardClass.hunter;
      case 5:
        return CardClass.mage;
      case 6:
        return CardClass.paladin;
      case 7:
        return CardClass.priest;
      case 8:
        return CardClass.rogue;
      case 9:
        return CardClass.shaman;
      case 10:
        return CardClass.warlock;
      case 11:
        return CardClass.warrior;
      case 13:
        return CardClass.neutral;
      default:
        return CardClass.all;
    }
  }
}
