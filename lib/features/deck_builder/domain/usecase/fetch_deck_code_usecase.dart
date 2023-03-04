import 'package:dartz/dartz.dart';
import 'package:decksly/common/util/exception_to_failure_mapper.dart';
import 'package:decksly/common/util/failures.dart';
import 'package:decksly/common/util/use_case.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_params.dart';
import 'package:decksly/features/deck_selection/domain/repository/deck_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchDeckCodeUsecase extends UseCase<String, DeckParams> {
  FetchDeckCodeUsecase(this._deckRepository);

  final DeckRepository _deckRepository;

  @override
  Future<Either<Failure, String>> call(DeckParams params) async {
    try {
      final deck = await _deckRepository.getDeckCode(params.ids, params.locale, params.deckType);
      return Right(deck);
    } catch (exception) {
      return Left(ExceptionToFailureMapper.mapExceptionToFailure(exception));
    }
  }
}
