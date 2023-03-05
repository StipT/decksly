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
}
