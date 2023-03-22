import "package:decksly/domain/card_gallery/model/card_filters/card_filter/card_filter.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:easy_localization/easy_localization.dart";

enum CardSet implements CardFilter {
  // Game modes
  standard("standard"),
  wild("wild"),
  classic("classic-cards"),

  // Standard sets
  festivalOfLegends("festival-of-legends"),
  pathOfArthas("path-of-arthas"),
  marchOfTheLichKing("march-of-the-lich-king"),
  murderAtCastleNathria("murder-at-castle-nathria"),
  voyageToTheSunkenCity("voyage-to-the-sunken-city"),
  fracturedInAlteracValley("fractured-in-alterac-valley"),
  unitedInStormwind("united-in-stormwind"),
  forgedInTheBarrens("forged-in-the-barrens"),
  core("core"),

  // Wild sets
  madnessAtTheDarkmoonFaire("madness-at-the-darkmoon-faire"),
  scholomanceAcademy("scholomance-academy"),
  demonHunterInitiate("demonhunter-initiate"),
  ashesOfOutland("ashes-of-outland"),
  galakrondsAwakening("galakronds-awakening"),
  descentOfDragons("descent-of-dragons"),
  saviorsOfUldum("saviors-of-uldum"),
  riseOfShadows("rise-of-shadows"),
  rastakhansRumble("rastakhans-rumble"),
  theBoomsdayProject("the-boomsday-project"),
  theWitchwood("the-witchwood"),
  koboltsAndCatacombs("kobolds-and-catacombs"),
  knightsOfTheFrozenThrone("knights-of-the-frozen-throne"),
  journeyToUnGoro("journey-to-ungoro"),
  meanStreetsOfGadgetzan("mean-streets-of-gadgetzan"),
  oneNightInKarazhan("one-night-in-karazhan"),
  whispersOfTheOldGods("whispers-of-the-old-gods"),
  leagueOfExplorers("league-of-explorers"),
  theGrandTournament("the-grand-tournament"),
  blackrockMountain("blackrock-mountain"),
  goblinsVsGnomes("goblins-vs-gnomes"),
  curseOfNaxxramas("naxxramas"),
  legacy("legacy");

  const CardSet(this.value);

  @override
  final String value;

  @override
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
      case CardSet.festivalOfLegends:
        return LocaleKeys.festivalOfLegends.tr();
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

  @override
  int id() {
    switch (this) {
      // Game modes
      case CardSet.standard:
        return 5;
      case CardSet.wild:
        return 1;
      case CardSet.classic:
        return 1646;

      // Standard sets
      case CardSet.festivalOfLegends:
        return 1809;
      case CardSet.pathOfArthas:
        return 1869;
      case CardSet.marchOfTheLichKing:
        return 1776;
      case CardSet.murderAtCastleNathria:
        return 1691;
      case CardSet.voyageToTheSunkenCity:
        return 1658;
      case CardSet.fracturedInAlteracValley:
        return 1626;
      case CardSet.unitedInStormwind:
        return 1578;
      case CardSet.forgedInTheBarrens:
        return 1525;
      case CardSet.core:
        return 1637;

      // Wild sets
      case CardSet.madnessAtTheDarkmoonFaire:
        return 1466;
      case CardSet.scholomanceAcademy:
        return 1443;
      case CardSet.demonHunterInitiate:
        return 1463;
      case CardSet.ashesOfOutland:
        return 1414;
      case CardSet.galakrondsAwakening:
        return 1403;
      case CardSet.descentOfDragons:
        return 1347;
      case CardSet.saviorsOfUldum:
        return 1158;
      case CardSet.riseOfShadows:
        return 1130;
      case CardSet.rastakhansRumble:
        return 1129;
      case CardSet.theBoomsdayProject:
        return 1127;
      case CardSet.theWitchwood:
        return 1125;
      case CardSet.koboltsAndCatacombs:
        return 1004;
      case CardSet.knightsOfTheFrozenThrone:
        return 1001;
      case CardSet.journeyToUnGoro:
        return 27;
      case CardSet.meanStreetsOfGadgetzan:
        return 25;
      case CardSet.oneNightInKarazhan:
        return 23;
      case CardSet.whispersOfTheOldGods:
        return 21;
      case CardSet.leagueOfExplorers:
        return 20;
      case CardSet.theGrandTournament:
        return 15;
      case CardSet.blackrockMountain:
        return 14;
      case CardSet.goblinsVsGnomes:
        return 13;
      case CardSet.curseOfNaxxramas:
        return 12;
      case CardSet.legacy:
        return 1635;
    }
  }
}

enum SubCollection {
  all,
  gameModes,
  standardSets,
  classicSets,
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
    case SubCollection.classicSets:
      return _getClassicSets();
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
      CardSet.standard,
      CardSet.festivalOfLegends,
      CardSet.pathOfArthas,
      CardSet.marchOfTheLichKing,
      CardSet.murderAtCastleNathria,
      CardSet.voyageToTheSunkenCity,
      CardSet.fracturedInAlteracValley,
      CardSet.unitedInStormwind,
      CardSet.forgedInTheBarrens,
      CardSet.core,
    ];

List<CardSet> _getClassicSets() => [CardSet.classic];

List<CardSet> _getWildSets() => [
      CardSet.wild,
      CardSet.festivalOfLegends,
      CardSet.pathOfArthas,
      CardSet.marchOfTheLichKing,
      CardSet.murderAtCastleNathria,
      CardSet.voyageToTheSunkenCity,
      CardSet.fracturedInAlteracValley,
      CardSet.unitedInStormwind,
      CardSet.forgedInTheBarrens,
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
