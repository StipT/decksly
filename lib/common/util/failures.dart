abstract class Failure extends Error {
  Failure(this.message);

  final String message;
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
