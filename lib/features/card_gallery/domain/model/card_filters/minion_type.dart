import "package:decksly/features/card_gallery/domain/model/card_filters/card_filter_interface/card_filter_interface.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:easy_localization/easy_localization.dart";

enum MinionType implements CardFilter {
  any(""),
  beast("beast"),
  demon("demon"),
  dragon("dragon"),
  elemental("elemental"),
  mech("mech"),
  murloc("murloc"),
  naga("naga"),
  pirate("pirate"),
  quilboar("quilboar"),
  totem("totem"),
  undead("undead");

  const MinionType(this.value);

  @override
  final String value;

  @override
  String localized() {
    switch (this) {
      case MinionType.any:
        return LocaleKeys.anyMinionType.tr();
      case MinionType.beast:
        return LocaleKeys.beast.tr();
      case MinionType.demon:
        return LocaleKeys.demon.tr();
      case MinionType.dragon:
        return LocaleKeys.dragon.tr();
      case MinionType.elemental:
        return LocaleKeys.elemental.tr();
      case MinionType.mech:
        return LocaleKeys.mech.tr();
      case MinionType.murloc:
        return LocaleKeys.murloc.tr();
      case MinionType.naga:
        return LocaleKeys.naga.tr();
      case MinionType.pirate:
        return LocaleKeys.pirate.tr();
      case MinionType.quilboar:
        return LocaleKeys.quilboar.tr();
      case MinionType.totem:
        return LocaleKeys.totem.tr();
      case MinionType.undead:
        return LocaleKeys.undead.tr();
    }
  }

  @override
  int id() {
    switch (this) {
      case MinionType.any:
        return -1;
      case MinionType.beast:
        return 20;
      case MinionType.demon:
        return 15;
      case MinionType.dragon:
        return 24;
      case MinionType.elemental:
        return 18;
      case MinionType.mech:
        return 17;
      case MinionType.murloc:
        return 14;
      case MinionType.naga:
        return 92;
      case MinionType.pirate:
        return 23;
      case MinionType.quilboar:
        return 43;
      case MinionType.totem:
        return 21;
      case MinionType.undead:
        return 11;
    }
  }
}
