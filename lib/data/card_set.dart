const String CARD_SET_STANDARD = "standard cards";
const String CARD_SET_WILD = "wild cards";
const String CARD_SET_CLASSIC = "classic cards";
const String CARD_SET_CURRENT_ARENA = "current arena cards";
const String CARD_SET_CURRENT_DUELS = "current duels cards";

enum CardSet {
  // Game modes
  standard,
  wild,
  classic,
  currentArena,
  currentDuels,

  // Standard sets
  pathOfArthas,
  marchOfTheLichKing,
  murderAtCastleNathria,
  voyageToTheSunkenCity,
  fracturedInAlteracValley,
  unitedInStormwind,
  forgedInTheBarrens,
  core,

  // Wild sets
  madnessAtTheDarkmoonFaire,
  scholomanceAcademy,
  demonHunterInitiate,
  ashesOfOutland,
  galakrondsAwakening,
  descentOfDragons,
  saviorsOfUldum,
  riseOfShadows,
  rastakhansRumble,
  theBoomsdayProject,
  theWitchwood,
  koboltsAndCatacombs,
  knightsOfTheFrozenThrone,
  journeyToUnGoro,
  meanStreetsOfGadgetzan,
  oneNightInKarazhan,
  whispersOfTheOldGods,
  leagueOfExplorers,
  theGrandTournament,
  blackrockMountain,
  goblinsVsGnomes,
  curseOfNaxxramas,
  legacy,
}

extension CardSetValues on CardSet {
  String get value {
    switch (this) {
      // Game modes
      case CardSet.standard:
        return "Standard";
      case CardSet.wild:
        return "Wild";
      case CardSet.classic:
        return "Classic";
      case CardSet.currentArena:
        return "Current Arena Cards";
      case CardSet.currentDuels:
        return "Current Duels Cards";

      // Standard sets
      case CardSet.pathOfArthas:
        return "Path of Arthas";
      case CardSet.marchOfTheLichKing:
        return "March of the Lich King";
      case CardSet.murderAtCastleNathria:
        return "Murder At Castle Nathria";
      case CardSet.voyageToTheSunkenCity:
        return "Voyage To The Sunken City";
      case CardSet.fracturedInAlteracValley:
        return "Fractured In Alterac Valley";
      case CardSet.unitedInStormwind:
        return "United In Stormwind";
      case CardSet.forgedInTheBarrens:
        return "Forged In The Barrens";
      case CardSet.core:
        return "Core";

      // Wild sets
      case CardSet.madnessAtTheDarkmoonFaire:
        return "Madness At The Darkmoon Faire";
      case CardSet.scholomanceAcademy:
        return "Scholomance Academy";
      case CardSet.demonHunterInitiate:
        return "Demon Hunter Initiate";
      case CardSet.ashesOfOutland:
        return "Ashes Of Outland";
      case CardSet.galakrondsAwakening:
        return "Galakrond's Awakening";
      case CardSet.descentOfDragons:
        return "Descent Of Dragons";
      case CardSet.saviorsOfUldum:
        return "Saviors Of Uldum";
      case CardSet.riseOfShadows:
        return "Rise Of Shadows";
      case CardSet.rastakhansRumble:
        return "Rastakhans Rumble";
      case CardSet.theBoomsdayProject:
        return "The Boomsday Project";
      case CardSet.theWitchwood:
        return "The Witchwood";
      case CardSet.koboltsAndCatacombs:
        return "Kobolts And Catacombs";
      case CardSet.knightsOfTheFrozenThrone:
        return "Knights Of The Frozen Throne";
      case CardSet.journeyToUnGoro:
        return "Journey To Un'Goro";
      case CardSet.meanStreetsOfGadgetzan:
        return "Mean Streets Of Gadgetzan";
      case CardSet.oneNightInKarazhan:
        return "One Night In Karazhan";
      case CardSet.whispersOfTheOldGods:
        return "Whispers Of The Old Gods";
      case CardSet.leagueOfExplorers:
        return "League Of Explorers";
      case CardSet.theGrandTournament:
        return "The Grand Tournament";
      case CardSet.blackrockMountain:
        return "Blackrock Mountain";
      case CardSet.goblinsVsGnomes:
        return "Goblins vs Gnomes";
      case CardSet.curseOfNaxxramas:
        return "Curse Of Naxxramas";
      case CardSet.legacy:
        return "Legacy";
    }
  }

  static List<CardSet> get values => [
        // Game modes
        CardSet.standard,
        CardSet.wild,
        CardSet.classic,
        CardSet.currentArena,
        CardSet.currentDuels,

        // Standard sets
        CardSet.pathOfArthas,
        CardSet.marchOfTheLichKing,
        CardSet.murderAtCastleNathria,
        CardSet.voyageToTheSunkenCity,
        CardSet.fracturedInAlteracValley,
        CardSet.unitedInStormwind,
        CardSet.forgedInTheBarrens,
        CardSet.core,

        // Wild sets
        CardSet.madnessAtTheDarkmoonFaire,
        CardSet.scholomanceAcademy,
        CardSet.demonHunterInitiate,
        CardSet.ashesOfOutland,
        CardSet.galakrondsAwakening,
        CardSet.descentOfDragons,
        CardSet.saviorsOfUldum,
        CardSet.riseOfShadows,
        CardSet.rastakhansRumble,
        CardSet.theBoomsdayProject,
        CardSet.theWitchwood,
        CardSet.koboltsAndCatacombs,
        CardSet.knightsOfTheFrozenThrone,
        CardSet.journeyToUnGoro,
        CardSet.meanStreetsOfGadgetzan,
        CardSet.oneNightInKarazhan,
        CardSet.whispersOfTheOldGods,
        CardSet.leagueOfExplorers,
        CardSet.theGrandTournament,
        CardSet.blackrockMountain,
        CardSet.goblinsVsGnomes,
        CardSet.curseOfNaxxramas,
        CardSet.legacy,
      ];
}

enum SubCollection {
  all,
  gameModes,
  standardSets,
  wildSets,
}

List<CardSet> getCardSets({SubCollection subCollection = SubCollection.all}) {
  switch (subCollection) {
    case SubCollection.all:
      return CardSet.values;
    case SubCollection.gameModes:
      return _getGameModes();
    case SubCollection.standardSets:
      return _getStandardSets();
    case SubCollection.wildSets:
      return _getWildSets();
  }
}

List<CardSet> _getGameModes() => [
      CardSet.standard,
      CardSet.wild,
      CardSet.classic,
      CardSet.currentArena,
      CardSet.currentDuels,
    ];

List<CardSet> _getStandardSets() => [
      CardSet.pathOfArthas,
      CardSet.marchOfTheLichKing,
      CardSet.murderAtCastleNathria,
      CardSet.voyageToTheSunkenCity,
      CardSet.fracturedInAlteracValley,
      CardSet.unitedInStormwind,
      CardSet.forgedInTheBarrens,
      CardSet.core,
    ];

List<CardSet> _getWildSets() => [
      CardSet.madnessAtTheDarkmoonFaire,
      CardSet.scholomanceAcademy,
      CardSet.demonHunterInitiate,
      CardSet.ashesOfOutland,
      CardSet.galakrondsAwakening,
      CardSet.descentOfDragons,
      CardSet.saviorsOfUldum,
      CardSet.riseOfShadows,
      CardSet.rastakhansRumble,
      CardSet.theBoomsdayProject,
      CardSet.theWitchwood,
      CardSet.koboltsAndCatacombs,
      CardSet.knightsOfTheFrozenThrone,
      CardSet.journeyToUnGoro,
      CardSet.meanStreetsOfGadgetzan,
      CardSet.oneNightInKarazhan,
      CardSet.whispersOfTheOldGods,
      CardSet.leagueOfExplorers,
      CardSet.theGrandTournament,
      CardSet.blackrockMountain,
      CardSet.goblinsVsGnomes,
      CardSet.curseOfNaxxramas,
      CardSet.legacy,
    ];
