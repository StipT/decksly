part of 'card_gallery_bloc.dart';

@immutable
abstract class CardGalleryState extends Equatable {
  const CardGalleryState(this.cards);

  final List<CardDTO> cards;

  @override
  List<Object?> get props => cards;
}

class CardsInitial extends CardGalleryState {
  const CardsInitial() : super(const []);
}

class CardsLoading extends CardGalleryState {
  const CardsLoading() : super(const []);
}

class CardsLoaded extends CardGalleryState {
  const CardsLoaded(super.cards);
}

class CardsError extends CardGalleryState {
  const CardsError(this.failure) : super(const []);
  final Failure failure;
}