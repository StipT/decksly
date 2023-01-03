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