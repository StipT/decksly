part of 'card_gallery_bloc.dart';

@immutable
abstract class CardGalleryEvent {
  const CardGalleryEvent(this.page);
  final int page;
}

class FetchCardsEvent extends CardGalleryEvent {
  const FetchCardsEvent(super.page);
}