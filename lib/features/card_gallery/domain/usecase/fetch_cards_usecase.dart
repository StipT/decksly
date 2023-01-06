import 'package:dartz/dartz.dart';
import 'package:decksly/common/exception_to_failure_mapper.dart';
import 'package:decksly/common/failures.dart';
import 'package:decksly/common/use_case.dart';
import 'package:decksly/features/card_gallery/domain/model/cards_page.dart';
import 'package:decksly/features/card_gallery/domain/repository/cards_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchCardsUsecase extends UseCase<CardsPage, FetchCardsParams> {
  FetchCardsUsecase(this._cardsRepository);

  final CardsRepository _cardsRepository;

  @override
  Future<Either<Failure, CardsPage>> call(FetchCardsParams params) async {
    try {
      final cards = await _cardsRepository.getCards(
        page: params.page,
        gameMode: params.gameMode,
       // locale: params.locale,
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

class FetchCardsParams {
  FetchCardsParams({
    this.page = 0,
    this.locale,
    this.set,
    this.heroClass,
    this.manaCost,
    this.attack,
    this.health,
    this.collectible,
    this.rarity,
    this.type,
    this.minionType,
    this.keyword,
    this.textFilter,
    this.gameMode,
    this.spellSchool,
    this.sort,
  });

  final num page;
  final String? locale;
  final String? set;
  final String? heroClass;
  final String? manaCost;
  final String? attack;
  final String? health;
  final List<num>? collectible;
  final String? rarity;
  final String? type;
  final String? minionType;
  final String? keyword;
  final String? textFilter;
  final String? gameMode;
  final String? spellSchool;
  final String? sort;
}
