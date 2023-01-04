part of 'card_gallery_bloc.dart';

@immutable
abstract class CardGalleryState extends Equatable {
  const CardGalleryState(this.cards, this.refresh);

  final List<CardDTO> cards;
  final bool refresh;


  @override
  List<Object?> get props => cards;
}

class CardsInitial extends CardGalleryState {
  const CardsInitial() : super(const [], false);
}

class CardsLoading extends CardGalleryState {
  const CardsLoading() : super(const [], false);
}

class CardsLoaded extends CardGalleryState {
  const CardsLoaded(super.cards, super.refresh);
}

class CardsError extends CardGalleryState {
  const CardsError(this.failure) : super(const [], false);
  final Failure failure;
}
