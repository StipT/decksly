import 'package:decksly/features/card_gallery/domain/model/card_filters/card_filter_interface/card_filter_interface.dart';
import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum CardSet implements CardFilter {
  // Game modes
  standard("standard"),
  wild("wild"),
  classic("classic-cards"),

  // Standard sets
  pathOfArthas("path-of-arthas"),
  marchOfTheLichKing("march-of-the-lich-king"),
  murderAtCastleNathria("urder-at-castle-nathria"),
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
