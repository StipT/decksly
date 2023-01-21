part of 'card_gallery_bloc.dart';

@immutable
abstract class CardGalleryEvent {
   const CardGalleryEvent();
}

class FetchCardsEvent extends CardGalleryEvent {
  const FetchCardsEvent(this.page);
  final int page;
}

class CardSetChangedEvent extends CardGalleryEvent {
  const CardSetChangedEvent(this.set);
  final String set;
}

class CardClassChangedEvent extends CardGalleryEvent {
  final String heroClass;
  const CardClassChangedEvent(this.heroClass);
}

class ManaFilterChangedEvent extends CardGalleryEvent {
  final String manaCost;
  const ManaFilterChangedEvent(this.manaCost);
}

class SearchFilterChangedEvent extends CardGalleryEvent {
  final String textFilter;
  const SearchFilterChangedEvent(this.textFilter);
}

class SortByChangedEvent extends CardGalleryEvent {
  final String sortBy;
  const SortByChangedEvent(this.sortBy);
}

class AttackFilterChangedEvent extends CardGalleryEvent {
  final String attack;
  const AttackFilterChangedEvent(this.attack);
}

class HealthFilterChangedEvent extends CardGalleryEvent {
  final String health;
  const HealthFilterChangedEvent(this.health);
}

class CardTypeFilterChangedEvent extends CardGalleryEvent {
  final String cardType;
  const CardTypeFilterChangedEvent(this.cardType);
}

class MinionTypeFilterChangedEvent extends CardGalleryEvent {
  final String minionType;
  const MinionTypeFilterChangedEvent(this.minionType);
}

class SpellSchoolFilterChangedEvent extends CardGalleryEvent {
  final String spellSchool;
  const SpellSchoolFilterChangedEvent(this.spellSchool);
}

class RarityFilterChangedEvent extends CardGalleryEvent {
  final String rarity;
  const RarityFilterChangedEvent(this.rarity);
}

class KeywordFilterChangedEvent extends CardGalleryEvent {
  final String keyword;
  const KeywordFilterChangedEvent(this.keyword);
}

class LanguageChangedEvent extends CardGalleryEvent {
  final String language;
  const LanguageChangedEvent(this.language);
}
