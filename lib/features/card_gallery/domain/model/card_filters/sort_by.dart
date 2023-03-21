import "package:decksly/features/card_gallery/domain/model/card_filters/card_filter_interface/card_filter_interface.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:easy_localization/easy_localization.dart";

enum SortBy implements CardFilter {
  manaAsc("manaCost:asc"),
  manaDesc("manaCost:desc"),
  nameAsc("name:asc"),
  nameDesc("name:desc"),
  attackAsc("attack:asc"),
  attackDesc("attack:desc"),
  healthAsc("health:asc"),
  healthDesc("health:desc");

  const SortBy(this.value);

  @override
  final String value;

  @override
  String localized() {
    switch (this) {
      case SortBy.manaAsc:
        return LocaleKeys.manaAsc.tr();
      case SortBy.manaDesc:
        return LocaleKeys.manaDesc.tr();
      case SortBy.nameAsc:
        return LocaleKeys.nameAsc.tr();
      case SortBy.nameDesc:
        return LocaleKeys.nameDesc.tr();
      case SortBy.attackAsc:
        return LocaleKeys.attackAsc.tr();
      case SortBy.attackDesc:
        return LocaleKeys.attackDesc.tr();
      case SortBy.healthAsc:
        return LocaleKeys.healthAsc.tr();
      case SortBy.healthDesc:
        return LocaleKeys.healthDesc.tr();
    }
  }

  @override
  int id() {
    switch (this) {
      case SortBy.manaAsc:
        return -1;
      case SortBy.manaDesc:
        return 0;
      case SortBy.nameAsc:
        return 1;
      case SortBy.nameDesc:
        return 2;
      case SortBy.attackAsc:
        return 3;
      case SortBy.attackDesc:
        return 4;
      case SortBy.healthAsc:
        return 5;
      case SortBy.healthDesc:
        return 5;
    }
  }
}
