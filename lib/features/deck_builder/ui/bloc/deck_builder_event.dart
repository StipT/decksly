part of 'deck_builder_bloc.dart';

@immutable
abstract class DeckBuilderEvent {
   const DeckBuilderEvent();
}

class FetchCardsEvent extends DeckBuilderEvent {
  const FetchCardsEvent(this.page);
  final int page;
}

class CardSetChangedEvent extends DeckBuilderEvent {
  const CardSetChangedEvent(this.set);
  final String set;
}

class CardClassChangedEvent extends DeckBuilderEvent {
  final String heroClass;
  const CardClassChangedEvent(this.heroClass);
}

class ManaFilterChangedEvent extends DeckBuilderEvent {
  final String manaCost;
  const ManaFilterChangedEvent(this.manaCost);
}

class SearchFilterChangedEvent extends DeckBuilderEvent {
  final String textFilter;
  const SearchFilterChangedEvent(this.textFilter);
}

class SortByChangedEvent extends DeckBuilderEvent {
  final String sortBy;
  const SortByChangedEvent(this.sortBy);
}

class AttackFilterChangedEvent extends DeckBuilderEvent {
  final String attack;
  const AttackFilterChangedEvent(this.attack);
}

class HealthFilterChangedEvent extends DeckBuilderEvent {
  final String health;
  const HealthFilterChangedEvent(this.health);
}

class CardTypeFilterChangedEvent extends DeckBuilderEvent {
  final String cardType;
  const CardTypeFilterChangedEvent(this.cardType);
}

class MinionTypeFilterChangedEvent extends DeckBuilderEvent {
  final String minionType;
  const MinionTypeFilterChangedEvent(this.minionType);
}

class SpellSchoolFilterChangedEvent extends DeckBuilderEvent {
  final String spellSchool;
  const SpellSchoolFilterChangedEvent(this.spellSchool);
}

class RarityFilterChangedEvent extends DeckBuilderEvent {
  final String rarity;
  const RarityFilterChangedEvent(this.rarity);
}

class KeywordFilterChangedEvent extends DeckBuilderEvent {
  final String keyword;
  const KeywordFilterChangedEvent(this.keyword);
}

class LanguageChangedEvent extends DeckBuilderEvent {
  final String language;
  const LanguageChangedEvent(this.language);
}

class AddCardEvent extends DeckBuilderEvent {
  final CardDTO card;
  const AddCardEvent(this.card);
}

class RemoveCardEvent extends DeckBuilderEvent {
  final CardDTO card;
  const RemoveCardEvent(this.card);
}