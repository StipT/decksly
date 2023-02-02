import 'package:dartz/dartz.dart';
import 'package:decksly/common/util/exception_to_failure_mapper.dart';
import 'package:decksly/common/util/failures.dart';
import 'package:decksly/common/util/use_case.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filter_params.dart';
import 'package:decksly/features/card_gallery/domain/model/cards_page.dart';
import 'package:decksly/features/card_gallery/domain/repository/cards_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImportDeckUsecase extends UseCase<CardsPage, CardFilterParams> {
  ImportDeckUsecase(this._cardsRepository);

  final CardsRepository _cardsRepository;

  @override
  Future<Either<Failure, CardsPage>> call(String deckCode) async {
    try {
      final deck = await _cardsRepository.getDeck(
        deckCode: deckCode,
      );
      return Right(deck);
    } catch (exception) {
      return Left(ExceptionToFailureMapper.mapExceptionToFailure(exception));
    }
  }
}
