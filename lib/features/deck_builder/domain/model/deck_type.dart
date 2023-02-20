import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum DeckType {
  standard,
  classic,
  wild,
}

extension DeckTypeLocalized on DeckType {
  String localized() {
    switch (this) {
      case DeckType.standard:
        return LocaleKeys.standard.tr();
      case DeckType.wild:
        return LocaleKeys.wild.tr();
      case DeckType.classic:
        return LocaleKeys.classic.tr();
    }
  }
}

DeckType deckTypeFromValue(String deckType) {
  switch (deckType) {
    case "standard":
      return DeckType.standard;
    case "classic":
      return DeckType.classic;
    case "wild":
      return DeckType.wild;
    default:
      return DeckType.standard;
  }
}
