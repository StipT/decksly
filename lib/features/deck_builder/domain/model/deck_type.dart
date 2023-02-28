import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum DeckType {
  standard,
  classic,
  wild,
}

extension DeckTypeExtensions on DeckType {

  String get value {
    switch (this) {
      case DeckType.standard:
        return "standard";
      case DeckType.classic:
        return "classic-cards";
      case DeckType.wild:
        return "wild";

    }
  }
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
    case "classic-cards":
      return DeckType.classic;
    case "wild":
      return DeckType.wild;
    default:
      return DeckType.standard;
  }
}
