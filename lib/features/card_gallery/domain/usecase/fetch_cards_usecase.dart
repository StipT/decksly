import 'package:dartz/dartz.dart';
import 'package:decksly/common/exception_to_failure_mapper.dart';
import 'package:decksly/common/failures.dart';
import 'package:decksly/common/use_case.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filter_params.dart';
import 'package:decksly/features/card_gallery/domain/model/cards_page.dart';
import 'package:decksly/features/card_gallery/domain/repository/cards_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
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
        heroClass: params.heroClass,
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
