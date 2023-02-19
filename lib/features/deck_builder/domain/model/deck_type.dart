enum DeckType {
  standard,
  classic,
  wild,
}

DeckType deckTypeFromValue(String deckType) {
  switch (deckType) {
    case "standard":
      return DeckType.standard;
    case "classic":
      return DeckType.classic;
    case "wild":
      return DeckType.wild;
    default:
      return DeckType.standard;
  }
}
