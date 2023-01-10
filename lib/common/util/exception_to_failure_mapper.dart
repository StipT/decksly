import 'package:decksly/common/util/exceptions.dart';
import 'package:decksly/common/util/failures.dart';

class ExceptionToFailureMapper {
  static const String _noInternetFailureMessage = 'No internet connection.';
  static const String _networkFailureMessage =
      'Failed to execute the request. Network error.';
  static const String _casheFailureMessage =
      'Failed to execute the request. Cache error.';
  static const String _unknownFailureMessage =
      'Failed to execute the request. Unknown error.';

  static Failure mapExceptionToFailure(Object exception) {
    if (exception is CacheException) {
      return CacheFailure(_casheFailureMessage);
    } else if (exception is NetworkException) {
      return NetworkFailure(_networkFailureMessage);
    } else if (exception is NoInternetException) {
      return NoConnectionFailure(_noInternetFailureMessage);
    } else {
      return UnknownFailure(exception.toString());
    }
  }
}
