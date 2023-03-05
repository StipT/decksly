import "package:dartz/dartz.dart";
import "package:decksly/common/util/exception_to_failure_mapper.dart";
import "package:decksly/common/util/failures.dart";
import "package:decksly/common/util/use_case.dart";
import "package:decksly/features/deck_builder/domain/model/deck.dart";
import "package:decksly/features/deck_builder/domain/model/deck_params.dart";
import "package:decksly/features/deck_selection/domain/repository/deck_repository.dart";
import "package:injectable/injectable.dart";

@lazySingleton
class FetchDeckUsecase extends UseCase<Deck, DeckParams> {
  FetchDeckUsecase(this._deckRepository);

  final DeckRepository _deckRepository;

  @override
  Future<Either<Failure, Deck>> call(DeckParams params) async {
    try {
      final deck = await _deckRepository.getDeck(params.code, params.locale);
      return Right(deck);
    } catch (exception) {
      return Left(ExceptionToFailureMapper.mapExceptionToFailure(exception));
    }
  }
}
