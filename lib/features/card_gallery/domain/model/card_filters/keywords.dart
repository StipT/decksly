import "package:decksly/features/card_gallery/domain/model/card_filters/card_filter_interface/card_filter_interface.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:easy_localization/easy_localization.dart";

enum Keyword implements CardFilter {
  any(""),
  adapt("adapt"),
  battlecry("battlecry"),
  charge("charge"),
  colossal("colossal"),
  combo("combo"),
  corpse("corpse"),
  corrupt("corrupt"),
  counter("counter"),
  deathrattle("deathrattle"),
  discover("discover"),
  divineShield("divine-shield"),
  dredge("dredge"),
  echo("echo"),
  finale("finale"),
  freeze("freeze"),
  frenzy("frenzy"),
  honorableKill("honorablekill"),
  immune("immune"),
  infuse("infuse"),
  inspire("inspire"),
  invoke("empower"),
  lackey("evilzug"),
  lifesteal("lifesteal"),
  magnetic("modular"),
  manathirst("manathirst"),
  megaWindfury("mega-windfury"),
  natureSpellDamage("spellpowernature"),
  outcast("outcast"),
  overheal("overheal"),
  overkill("overkill"),
  overload("overload"),
  poisonous("poisonous"),
  quest("quest"),
  questline("questline"),
  reborn("reborn"),
  recruit("recruit"),
  rush("rush"),
  secret("secret"),
  sidequest("sidequest"),
  silence("silence"),
  spareParts("pare-part"),
  spellDamage("spellpower"),
  spellburst("spellburst"),
  startOfGame("startofgamekeyword"),
  stealh("stealh"),
  taunt("taunt"),
  tradeable("trade"),
  twinspell("twinspell"),
  windfury("windfury");

  const Keyword(this.value);

  @override
  final String value;

  @override
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
      case Keyword.finale:
        return LocaleKeys.finale.tr();
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
      case Keyword.overheal:
        return LocaleKeys.overheal.tr();
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
