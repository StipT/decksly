part of 'deck_builder_bloc.dart';

@immutable
abstract class DeckBuilderState extends Equatable {
  const DeckBuilderState(this.page, this.cardFilterParams);

  final CardsPage page;
  final CardFilterParams cardFilterParams;

  @override
  List<Object?> get props => [page.cards, page.cardCount, cardFilterParams, page.pageCount];
}

class CardsInitial extends DeckBuilderState {
  const CardsInitial()
      : super(
          const CardsPage(cards: [], cardCount: 0, pageCount: 0, page: 0),
          const CardFilterParams(
            page: 0,
            pageSize: 20,
            locale: "en_US",
            gameMode: "constructed",
            set: "standard",
            collectible: "1",
            sort: "manaCost:asc",
          ),
        );
}

class CardsLoaded extends DeckBuilderState {
  const CardsLoaded(
    super.cards,
    super.cardFilterParams,
  );
}

class CardsError extends DeckBuilderState {
  const CardsError(this.failure)
      : super(
          const CardsPage(cards: [], cardCount: 0, pageCount: 0, page: 0),
          const CardFilterParams(),
        );

  final Failure failure;
}