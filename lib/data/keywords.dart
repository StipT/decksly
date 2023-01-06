import 'package:decksly/presentation/resources/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum Keyword {
  any,
  adapt,
  battlecry,
  charge,
  colossal,
  combo,
  corpse,
  corrupt,
  counter,
  deathrattle,
  discover,
  divineShield,
  dredge,
  echo,
  freeze,
  frenzy,
  honorableKill,
  immune,
  infuse,
  inspire,
  invoke,
  lackey,
  lifesteal,
  magnetic,
  manathirst,
  megaWindfury,
  natureSpellDamage,
  outcast,
  overkill,
  overload,
  poisonous,
  quest,
  questline,
  reborn,
  recruit,
  rush,
  secret,
  sidequest,
  silence,
  spareParts,
  spellDamage,
  spellburst,
  startOfGame,
  stealh,
  taunt,
  tradeable,
  twinspell,
  windfury,
}

extension KeywordValues on Keyword {
  String get value {
    switch (this) {
      case Keyword.any:
        return "";
      case Keyword.adapt:
        return "adapt";
      case Keyword.battlecry:
        return "battlecry";
      case Keyword.charge:
        return "charge";
      case Keyword.colossal:
        return "colossal";
      case Keyword.combo:
        return "combo";
      case Keyword.corpse:
        return "corpse";
      case Keyword.corrupt:
        return "corrupt";
      case Keyword.counter:
        return "counter";
      case Keyword.deathrattle:
        return "deathrattle";
      case Keyword.discover:
        return "discover";
      case Keyword.divineShield:
        return "divine-shield";
      case Keyword.dredge:
        return "dredge";
      case Keyword.echo:
        return "echo";
      case Keyword.freeze:
        return "freeze";
      case Keyword.frenzy:
        return "frenzy";
      case Keyword.honorableKill:
        return "honorablekill";
      case Keyword.immune:
        return "immune";
      case Keyword.infuse:
        return "infuse";
      case Keyword.inspire:
        return "inspire";
      case Keyword.invoke:
        return "empower";
      case Keyword.lackey:
        return "evilzug";
      case Keyword.lifesteal:
        return "lifesteal";
      case Keyword.magnetic:
        return "modular";
      case Keyword.manathirst:
        return "manathirst";
      case Keyword.megaWindfury:
        return "mega-windfury";
      case Keyword.natureSpellDamage:
        return "spellpowernature";
      case Keyword.outcast:
        return "outcast";
      case Keyword.overkill:
        return "overkill";
      case Keyword.overload:
        return "overload";
      case Keyword.poisonous:
        return "poisonous";
      case Keyword.quest:
        return "quest";
      case Keyword.questline:
        return "questline";
      case Keyword.reborn:
        return "reborn";
      case Keyword.recruit:
        return "recruit";
      case Keyword.rush:
        return "rush";
      case Keyword.secret:
        return "secret";
      case Keyword.sidequest:
        return "sidequest";
      case Keyword.silence:
        return "silence";
      case Keyword.spareParts:
        return "spare-part";
      case Keyword.spellDamage:
        return "spellpower";
      case Keyword.spellburst:
        return "spellburst";
      case Keyword.startOfGame:
        return "startofgamekeyword";
      case Keyword.stealh:
        return "stealh";
      case Keyword.taunt:
        return "taunt";
      case Keyword.tradeable:
        return "trade";
      case Keyword.twinspell:
        return "twinspell";
      case Keyword.windfury:
        return "windfury";
    }
  }

  static List<Keyword> get values => [
        Keyword.any,
        Keyword.adapt,
        Keyword.battlecry,
        Keyword.charge,
        Keyword.colossal,
        Keyword.combo,
        Keyword.corpse,
        Keyword.corrupt,
        Keyword.counter,
        Keyword.deathrattle,
        Keyword.discover,
        Keyword.divineShield,
        Keyword.dredge,
        Keyword.echo,
        Keyword.freeze,
        Keyword.frenzy,
        Keyword.honorableKill,
        Keyword.immune,
        Keyword.infuse,
        Keyword.inspire,
        Keyword.invoke,
        Keyword.lackey,
        Keyword.lifesteal,
        Keyword.magnetic,
        Keyword.manathirst,
        Keyword.megaWindfury,
        Keyword.natureSpellDamage,
        Keyword.outcast,
        Keyword.overkill,
        Keyword.overload,
        Keyword.poisonous,
        Keyword.quest,
        Keyword.questline,
        Keyword.reborn,
        Keyword.recruit,
        Keyword.rush,
        Keyword.secret,
        Keyword.sidequest,
        Keyword.silence,
        Keyword.spareParts,
        Keyword.spellDamage,
        Keyword.spellburst,
        Keyword.startOfGame,
        Keyword.stealh,
        Keyword.taunt,
        Keyword.tradeable,
        Keyword.twinspell,
        Keyword.windfury,
      ];
}

extension KeywordLocalized on Keyword {
  String localized() {
    switch (this) {
      case Keyword.any:
        return LocaleKeys.anyKeyword.tr();
      case Keyword.adapt:
        return LocaleKeys.adapt.tr();
      case Keyword.battlecry:
        return LocaleKeys.battlecry.tr();
      case Keyword.charge:
        return LocaleKeys.charge.tr();
      case Keyword.colossal:
        return LocaleKeys.colossal.tr();
      case Keyword.combo:
        return LocaleKeys.combo.tr();
      case Keyword.corpse:
        return LocaleKeys.corpse.tr();
      case Keyword.corrupt:
        return LocaleKeys.corrupt.tr();
      case Keyword.counter:
        return LocaleKeys.counter.tr();
      case Keyword.deathrattle:
        return LocaleKeys.deathrattle.tr();
      case Keyword.discover:
        return LocaleKeys.discover.tr();
      case Keyword.divineShield:
        return LocaleKeys.divineShield.tr();
      case Keyword.dredge:
        return LocaleKeys.dredge.tr();
      case Keyword.echo:
        return LocaleKeys.echo.tr();
      case Keyword.freeze:
        return LocaleKeys.freeze.tr();
      case Keyword.frenzy:
        return LocaleKeys.frenzy.tr();
      case Keyword.honorableKill:
        return LocaleKeys.honorableKill.tr();
      case Keyword.immune:
        return LocaleKeys.immune.tr();
      case Keyword.infuse:
        return LocaleKeys.infuse.tr();
      case Keyword.inspire:
        return LocaleKeys.inspire.tr();
      case Keyword.invoke:
        return LocaleKeys.invoke.tr();
      case Keyword.lackey:
        return LocaleKeys.lackey.tr();
      case Keyword.lifesteal:
        return LocaleKeys.lifesteal.tr();
      case Keyword.magnetic:
        return LocaleKeys.magnetic.tr();
      case Keyword.manathirst:
        return LocaleKeys.manathirst.tr();
      case Keyword.megaWindfury:
        return LocaleKeys.megaWindfury.tr();
      case Keyword.natureSpellDamage:
        return LocaleKeys.natureSpellDamage.tr();
      case Keyword.outcast:
        return LocaleKeys.outcast.tr();
      case Keyword.overkill:
        return LocaleKeys.overkill.tr();
      case Keyword.overload:
        return LocaleKeys.overload.tr();
      case Keyword.poisonous:
        return LocaleKeys.poisonous.tr();
      case Keyword.quest:
        return LocaleKeys.quest.tr();
      case Keyword.questline:
        return LocaleKeys.questline.tr();
      case Keyword.reborn:
        return LocaleKeys.reborn.tr();
      case Keyword.recruit:
        return LocaleKeys.recruit.tr();
      case Keyword.rush:
        return LocaleKeys.rush.tr();
      case Keyword.secret:
        return LocaleKeys.secret.tr();
      case Keyword.sidequest:
        return LocaleKeys.sidequest.tr();
      case Keyword.silence:
        return LocaleKeys.silence.tr();
      case Keyword.spareParts:
        return LocaleKeys.spareParts.tr();
      case Keyword.spellDamage:
        return LocaleKeys.spellDamage.tr();
      case Keyword.spellburst:
        return LocaleKeys.spellburst.tr();
      case Keyword.startOfGame:
        return LocaleKeys.startOfGame.tr();
      case Keyword.stealh:
        return LocaleKeys.stealh.tr();
      case Keyword.taunt:
        return LocaleKeys.taunt.tr();
      case Keyword.tradeable:
        return LocaleKeys.tradeable.tr();
      case Keyword.twinspell:
        return LocaleKeys.twinspell.tr();
      case Keyword.windfury:
        return LocaleKeys.windfury.tr();
    }
  }
}

Keyword keywordFromIndex(int index) {
  switch (index) {
    case 0:
      return Keyword.any;
    case 1:
      return Keyword.adapt;
    case 2:
      return Keyword.battlecry;
    case 3:
      return Keyword.charge;
    case 4:
      return Keyword.colossal;
    case 5:
      return Keyword.combo;
    case 6:
      return Keyword.corpse;
    case 7:
      return Keyword.corrupt;
    case 8:
      return Keyword.counter;
    case 9:
      return Keyword.deathrattle;
    case 10:
      return Keyword.discover;
    case 11:
      return Keyword.divineShield;
    case 12:
      return Keyword.dredge;
    case 13:
      return Keyword.echo;
    case 14:
      return Keyword.freeze;
    case 15:
      return Keyword.frenzy;
    case 16:
      return Keyword.honorableKill;
    case 17:
      return Keyword.immune;
    case 18:
      return Keyword.infuse;
    case 19:
      return Keyword.inspire;
    case 20:
      return Keyword.invoke;
    case 21:
      return Keyword.lackey;
    case 22:
      return Keyword.lifesteal;
    case 23:
      return Keyword.magnetic;
    case 24:
      return Keyword.manathirst;
    case 25:
      return Keyword.megaWindfury;
    case 26:
      return Keyword.natureSpellDamage;
    case 27:
      return Keyword.outcast;
    case 28:
      return Keyword.overkill;
    case 29:
      return Keyword.overload;
    case 30:
      return Keyword.poisonous;
    case 31:
      return Keyword.quest;
    case 32:
      return Keyword.questline;
    case 33:
      return Keyword.reborn;
    case 34:
      return Keyword.recruit;

    case 35:
      return Keyword.secret;
    case 36:
      return Keyword.sidequest;
    case 37:
      return Keyword.spareParts;
    case 38:
      return Keyword.spellDamage;
    case 39:
      return Keyword.spellburst;
    case 40:
      return Keyword.startOfGame;
    case 41:
      return Keyword.stealh;
    case 42:
      return Keyword.taunt;
    case 43:
      return Keyword.tradeable;
    case 44:
      return Keyword.twinspell;
    case 45:
      return Keyword.windfury;
    default:
      return Keyword.any;
  }
}
