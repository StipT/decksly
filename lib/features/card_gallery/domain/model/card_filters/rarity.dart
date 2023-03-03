import 'package:decksly/features/card_gallery/domain/model/card_filters/card_filter_interface/card_filter_interface.dart';
import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum Rarity implements CardFilter {
  any(""),
  free("free"),
  common("common"),
  rare("rare"),
  epic("epic"),
  legendary("legendary");

  const Rarity(this.value);

  @override
  final String value;

  @override
  String localized() {
    switch (this) {
      case Rarity.any:
        return LocaleKeys.anyRarity.tr();
      case Rarity.free:
        return LocaleKeys.free.tr();
      case Rarity.common:
        return LocaleKeys.common.tr();
      case Rarity.rare:
        return LocaleKeys.rare.tr();
      case Rarity.epic:
        return LocaleKeys.epic.tr();
      case Rarity.legendary:
        return LocaleKeys.legendary.tr();
    }
  }
}
