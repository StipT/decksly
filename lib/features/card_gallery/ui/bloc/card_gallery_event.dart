part of 'card_gallery_bloc.dart';

@immutable
abstract class CardGalleryEvent {
   const CardGalleryEvent();
}

class FetchCardsEvent extends CardGalleryEvent {
  const FetchCardsEvent(this.cardFilterParams);
  final CardFilterParams cardFilterParams;
}

class CardFilterParamsChangedEvent extends CardGalleryEvent {
  const CardFilterParamsChangedEvent(this.cardFilterParams);
  final CardFilterParams cardFilterParams;
}

class ToggleNeutralCardsEvent extends CardGalleryEvent {
  const ToggleNeutralCardsEvent(this.deckCLass);
  final DeckClass deckCLass;
}

class ToggleClassCardsEvent extends CardGalleryEvent {
  const ToggleClassCardsEvent(this.deckCLass);
  final DeckClass deckCLass;
}
