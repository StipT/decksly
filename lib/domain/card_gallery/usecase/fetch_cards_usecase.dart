import "package:dartz/dartz.dart";
import "package:decksly/common/util/exception_to_failure_mapper.dart";
import "package:decksly/common/util/failures.dart";
import "package:decksly/common/util/use_case.dart";
import "package:decksly/domain/card_gallery/model/card_filter_params/card_filter_params.dart";
import "package:decksly/domain/card_gallery/model/cards_page/cards_page.dart";
import "package:decksly/domain/card_gallery/repository/cards_repository.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final fetchCardsUsecaseProvider = Provider<FetchCardsUsecase>(
      (ref) => FetchCardsUsecase(
    ref.watch(cardsRepositoryProvider),
  ),
);

class FetchCardsUsecase extends UseCase<CardsPage, CardFilterParams> {
  FetchCardsUsecase(this._cardsRepository);

  final CardsRepository _cardsRepository;

  @override
  Future<Either<Failure, CardsPage>> call(CardFilterParams params) async {
    try {
      final cards = await _cardsRepository.getCards(
        pageSize: params.pageSize,
        page: params.page,
        gameMode: params.gameMode,
        locale: params.locale,
        collectible: params.collectible,
        set: params.set,
        heroClass: params.heroClass.join(","),
        manaCost: params.manaCost,
        textFilter: params.textFilter,
        sort: params.sort,
        attack: params.attack,
        health: params.health,
        type: params.type,
        minionType: params.minionType,
        spellSchool: params.spellSchool,
        rarity: params.rarity,
        keyword: params.keyword,
      );
      return Right(cards);
    } catch (exception) {
      return Left(ExceptionToFailureMapper.mapExceptionToFailure(exception));
    }
  }
}
