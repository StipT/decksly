// ignore_for_file: avoid_classes_with_only_static_members

import "package:decksly/common/util/exceptions.dart";
import "package:decksly/common/util/failures.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:easy_localization/easy_localization.dart";

class ExceptionToFailureMapper {
  static final String noInternetFailureMessage = LocaleKeys.noInternetFailureMessage.tr();
  static final String networkFailureMessage = LocaleKeys.networkFailureMessage.tr();
  static final String cacheFailureMessage = LocaleKeys.cacheFailureMessage.tr();
  static final String unknownFailureMessage = LocaleKeys.unknownFailureMessage.tr();

  static Failure mapExceptionToFailure(Object exception) {
    if (exception is CacheException) {
      return CacheFailure(cacheFailureMessage);
    } else if (exception is NetworkException) {
      return NetworkFailure(networkFailureMessage);
    } else if (exception is NoInternetException) {
      return NoConnectionFailure(noInternetFailureMessage);
    } else {
      return UnknownFailure(unknownFailureMessage);
    }
  }
}
