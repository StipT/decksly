import 'package:decksly/common/util/exceptions.dart';
import 'package:decksly/common/util/failures.dart';
import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ExceptionToFailureMapper {
  static final String _noInternetFailureMessage = LocaleKeys.noInternetFailureMessage.tr();
  static final String _networkFailureMessage = LocaleKeys.networkFailureMessage.tr();
  static final String _cacheFailureMessage = LocaleKeys.cacheFailureMessage.tr();
  static final String _unknownFailureMessage = LocaleKeys.unknownFailureMessage.tr();

  static Failure mapExceptionToFailure(Object exception) {
    if (exception is CacheException) {
      return CacheFailure(_cacheFailureMessage);
    } else if (exception is NetworkException) {
      return NetworkFailure(_networkFailureMessage);
    } else if (exception is NoInternetException) {
      return NoConnectionFailure(_noInternetFailureMessage);
    } else {
      return UnknownFailure(_unknownFailureMessage);
    }
  }
}
