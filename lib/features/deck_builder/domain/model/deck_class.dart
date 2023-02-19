enum DeckClass {
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

DeckClass deckClassFromValue(String deckClass) {
  switch (deckClass) {
    case "deathKnight":
      return DeckClass.deathKnight;
    case "demonHunter":
      return DeckClass.demonHunter;
    case "druid":
      return DeckClass.druid;
    case "hunter":
      return DeckClass.hunter;
    case "mage":
      return DeckClass.mage;
    case "paladin":
      return DeckClass.paladin;
    case "priest":
      return DeckClass.priest;
    case "rogue":
      return DeckClass.rogue;
    case "shaman":
      return DeckClass.shaman;
    case "warlock":
      return DeckClass.warlock;
    case "warrior":
      return DeckClass.warrior;
    default:
      return DeckClass.warrior;
  }
}