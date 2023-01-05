part of 'card_gallery_bloc.dart';

@immutable
abstract class CardGalleryState extends Equatable {
  const CardGalleryState(this.page, this.refresh);

  final CardsPage page;
  final bool refresh;

  @override
  List<Object?> get props => page.cards;
}

class CardsInitial extends CardGalleryState {
  const CardsInitial() : super(const CardsPage(cards: [], cardCount: 0, pageCount: 0, page: 0), false);


}

class CardsLoading extends CardGalleryState {
  const CardsLoading() : super(const CardsPage(cards: [], cardCount: 0, pageCount: 0, page: 0), false);
}

class CardsLoaded extends CardGalleryState {
  const CardsLoaded(super.cards, super.refresh);
}

class CardsError extends CardGalleryState {
  const CardsError(this.failure) : super(const CardsPage(cards: [], cardCount: 0, pageCount: 0, page: 0), false);
  final Failure failure;
}
