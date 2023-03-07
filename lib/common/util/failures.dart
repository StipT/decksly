import "package:equatable/equatable.dart";

abstract class Failure extends Error with EquatableMixin {
  Failure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class NoConnectionFailure extends Failure {
  NoConnectionFailure(super.message);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}
