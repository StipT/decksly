import "package:dartz/dartz.dart" show Either;
import "package:decksly/common/util/failures.dart";

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
