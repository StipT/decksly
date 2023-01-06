import 'package:decksly/presentation/resources/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum CardSet {
  // Game modes
  standard,
  wild,
  classic,

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
        return "standard";
      case CardSet.wild:
        return "wild";
      case CardSet.classic:
        return "classic-cards";

      // Standard sets
      case CardSet.pathOfArthas:
        return "path-of-arthas";
      case CardSet.marchOfTheLichKing:
        return "march-of-the-lich-king";
      case CardSet.murderAtCastleNathria:
        return "murder-at-castle-nathria";
      case CardSet.voyageToTheSunkenCity:
        return "voyage-to-the-sunken-city";
      case CardSet.fracturedInAlteracValley:
        return "fractured-in-alterac-valley";
      case CardSet.unitedInStormwind:
        return "united-in-stormwind";
      case CardSet.forgedInTheBarrens:
        return "forged-in-the-barrens";
      case CardSet.core:
        return "core";

      // Wild sets
      case CardSet.madnessAtTheDarkmoonFaire:
        return "madness-at-the-darkmoon-faire";
      case CardSet.scholomanceAcademy:
        return "scholomance-academy";
      case CardSet.demonHunterInitiate:
        return "demonhunter-initiate";
      case CardSet.ashesOfOutland:
        return "ashes-of-outland";
      case CardSet.galakrondsAwakening:
        return "galakronds-awakening";
      case CardSet.descentOfDragons:
        return "descent-of-dragons";
      case CardSet.saviorsOfUldum:
        return "saviors-of-uldum";
      case CardSet.riseOfShadows:
        return "rise-of-shadows";
      case CardSet.rastakhansRumble:
        return "rastakhans-rumble";
      case CardSet.theBoomsdayProject:
        return "the-boomsday-project";
      case CardSet.theWitchwood:
        return "the-witchwood";
      case CardSet.koboltsAndCatacombs:
        return "kobolds-and-catacombs";
      case CardSet.knightsOfTheFrozenThrone:
        return "knights-of-the-frozen-throne";
      case CardSet.journeyToUnGoro:
        return "journey-to-ungoro";
      case CardSet.meanStreetsOfGadgetzan:
        return "mean-streets-of-gadgetzan";
      case CardSet.oneNightInKarazhan:
        return "one-night-in-karazhan";
      case CardSet.whispersOfTheOldGods:
        return "whispers-of-the-old-gods";
      case CardSet.leagueOfExplorers:
        return "league-of-explorers";
      case CardSet.theGrandTournament:
        return "the-grand-tournament";
      case CardSet.blackrockMountain:
        return "blackrock-mountain";
      case CardSet.goblinsVsGnomes:
        return "goblins-vs-gnomes";
      case CardSet.curseOfNaxxramas:
        return "naxxramas";
      case CardSet.legacy:
        return "legacy";
    }
  }

  static List<CardSet> get values => [
        // Game modes
        CardSet.standard,
        CardSet.wild,
        CardSet.classic,

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

extension CardSetLocalized on CardSet {
  String localized() {
    switch (this) {
      // Game modes
      case CardSet.standard:
        return LocaleKeys.standard.tr();
      case CardSet.wild:
        return LocaleKeys.wild.tr();
      case CardSet.classic:
        return LocaleKeys.classic.tr();

      // Standard sets
      case CardSet.pathOfArthas:
        return LocaleKeys.pathOfArthas.tr();
      case CardSet.marchOfTheLichKing:
        return LocaleKeys.marchOfTheLichKing.tr();
      case CardSet.murderAtCastleNathria:
        return LocaleKeys.murderAtCastleNathria.tr();
      case CardSet.voyageToTheSunkenCity:
        return LocaleKeys.voyageToTheSunkenCity.tr();
      case CardSet.fracturedInAlteracValley:
        return LocaleKeys.fracturedInAlteracValley.tr();
      case CardSet.unitedInStormwind:
        return LocaleKeys.unitedInStormwind.tr();
      case CardSet.forgedInTheBarrens:
        return LocaleKeys.forgedInTheBarrens.tr();
      case CardSet.core:
        return LocaleKeys.core.tr();

      // Wild sets
      case CardSet.madnessAtTheDarkmoonFaire:
        return LocaleKeys.madnessAtTheDarkmoonFaire.tr();
      case CardSet.scholomanceAcademy:
        return LocaleKeys.scholomanceAcademy.tr();
      case CardSet.demonHunterInitiate:
        return LocaleKeys.demonHunterInitiate.tr();
      case CardSet.ashesOfOutland:
        return LocaleKeys.ashesOfOutland.tr();
      case CardSet.galakrondsAwakening:
        return LocaleKeys.galakrondsAwakening.tr();
      case CardSet.descentOfDragons:
        return LocaleKeys.descentOfDragons.tr();
      case CardSet.saviorsOfUldum:
        return LocaleKeys.saviorsOfUldum.tr();
      case CardSet.riseOfShadows:
        return LocaleKeys.riseOfShadows.tr();
      case CardSet.rastakhansRumble:
        return LocaleKeys.rastakhansRumble.tr();
      case CardSet.theBoomsdayProject:
        return LocaleKeys.theBoomsdayProject.tr();
      case CardSet.theWitchwood:
        return LocaleKeys.theWitchwood.tr();
      case CardSet.koboltsAndCatacombs:
        return LocaleKeys.koboltsAndCatacombs.tr();
      case CardSet.knightsOfTheFrozenThrone:
        return LocaleKeys.knightsOfTheFrozenThrone.tr();
      case CardSet.journeyToUnGoro:
        return LocaleKeys.journeyToUnGoro.tr();
      case CardSet.meanStreetsOfGadgetzan:
        return LocaleKeys.meanStreetsOfGadgetzan.tr();
      case CardSet.oneNightInKarazhan:
        return LocaleKeys.oneNightInKarazhan.tr();
      case CardSet.whispersOfTheOldGods:
        return LocaleKeys.whispersOfTheOldGods.tr();
      case CardSet.leagueOfExplorers:
        return LocaleKeys.leagueOfExplorers.tr();
      case CardSet.theGrandTournament:
        return LocaleKeys.theGrandTournament.tr();
      case CardSet.blackrockMountain:
        return LocaleKeys.blackrockMountain.tr();
      case CardSet.goblinsVsGnomes:
        return LocaleKeys.goblinsVsGnomes.tr();
      case CardSet.curseOfNaxxramas:
        return LocaleKeys.curseOfNaxxramas.tr();
      case CardSet.legacy:
        return LocaleKeys.legacy.tr();
    }
  }
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

CardSet cardSetFromIndex(int index) {
  switch (index) {
    case 0:
      return CardSet.standard;
    case 1:
      return CardSet.wild;
    case 2:
      return CardSet.classic;
    case 3:
      return CardSet.pathOfArthas;
    case 4:
      return CardSet.marchOfTheLichKing;
    case 5:
      return CardSet.murderAtCastleNathria;
    case 6:
      return CardSet.voyageToTheSunkenCity;
    case 7:
      return CardSet.fracturedInAlteracValley;
    case 8:
      return CardSet.unitedInStormwind;
    case 9:
      return CardSet.forgedInTheBarrens;
    case 10:
      return CardSet.core;
    case 11:
      return CardSet.madnessAtTheDarkmoonFaire;
    case 12:
      return CardSet.scholomanceAcademy;
    case 13:
      return CardSet.demonHunterInitiate;
    case 14:
      return CardSet.ashesOfOutland;
    case 15:
      return CardSet.galakrondsAwakening;
    case 16:
      return CardSet.descentOfDragons;
    case 17:
      return CardSet.saviorsOfUldum;
    case 18:
      return CardSet.riseOfShadows;
    case 19:
      return CardSet.rastakhansRumble;
    case 20:
      return CardSet.theBoomsdayProject;
    case 21:
      return CardSet.theWitchwood;
    case 22:
      return CardSet.koboltsAndCatacombs;
    case 23:
      return CardSet.knightsOfTheFrozenThrone;
    case 24:
      return CardSet.journeyToUnGoro;
    case 25:
      return CardSet.meanStreetsOfGadgetzan;
    case 26:
      return CardSet.oneNightInKarazhan;
    case 27:
      return CardSet.whispersOfTheOldGods;
    case 28:
      return CardSet.leagueOfExplorers;
    case 29:
      return CardSet.theGrandTournament;
    case 30:
      return CardSet.blackrockMountain;
    case 31:
      return CardSet.goblinsVsGnomes;
    case 32:
      return CardSet.curseOfNaxxramas;
    case 33:
      return CardSet.legacy;
    default:
      return CardSet.standard;
  }
}
