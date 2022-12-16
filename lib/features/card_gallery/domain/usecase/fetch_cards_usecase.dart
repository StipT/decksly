import 'package:dartz/dartz.dart';
import 'package:decksly/common/exception_to_failure_mapper.dart';
import 'package:decksly/common/failures.dart';
import 'package:decksly/common/use_case.dart';
import 'package:decksly/features/card_gallery/domain/repository/cards_repository.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchCardsUsecase extends UseCase<List<CardDTO>, FetchCardsParams> {
  FetchCardsUsecase(this._cardsRepository);

  final CardsRepository _cardsRepository;

  @override
  Future<Either<Failure, List<CardDTO>>> call(FetchCardsParams params) async {
    try {
      final cards = await _cardsRepository.getCards(params.language, params.pageNumber);
      return Right(cards);
    } catch (exception) {
      return Left(ExceptionToFailureMapper.mapExceptionToFailure(exception));
    }
  }
}

class FetchCardsParams {
  FetchCardsParams(this.pageNumber, this.language);

  final int pageNumber;
  final String language;
}
