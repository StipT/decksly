import "dart:convert";

import "package:decksly/common/application.constants.dart";
import "package:decksly/repository/remote_source/api/api_client.dart";
import "package:decksly/repository/remote_source/auth/auth_client.dart";
import "package:decksly/repository/remote_source/auth/token_request/token_request.dart";
import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiServiceImpl(),
);

abstract class ApiService {
  ApiClient get apiClient;

  AuthClient get authClient;
}

class ApiServiceImpl implements ApiService {
  ApiServiceImpl() {
    _setUpServices();
  }

  late final Dio _restDio;
  late final ApiClient _apiClient;
  late final AuthClient _authClient;
  late final FlutterSecureStorage secureStorage;

  @override
  ApiClient get apiClient => _apiClient;

  @override
  AuthClient get authClient => _authClient;

  QueuedInterceptorsWrapper get queuedInterceptor {
    return QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        String? accessToken = await secureStorage.read(key: kAccessTokenKey);

        if (isTokenInvalid(accessToken)) {
          accessToken = await refreshAccessToken();
        }
        final token = "Bearer $accessToken";

        _restDio.options.headers.addAll({"Authorization": token});
        options.headers.addAll({"Authorization": token});
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) async {
        return _retryRequest(error, handler);
      },
    );
  }

  LogInterceptor get logInterceptor => LogInterceptor(
        responseBody: true,
        requestBody: true,
        logPrint: (message) {
          if (kDebugMode) {
            print(message);
          }
        },
      );

  void _setUpServices() {
    secureStorage = const FlutterSecureStorage();

    final authDio = Dio(
      BaseOptions(
        baseUrl: kAuthBaseUrl,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
      ),
    );
    authDio.interceptors.add(logInterceptor);
    _authClient = AuthClient(authDio);

    _restDio = Dio(
      BaseOptions(
        baseUrl: kApiBaseUrl,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    _restDio.interceptors.add(queuedInterceptor);
    _restDio.interceptors.add(logInterceptor);
    _apiClient = ApiClient(_restDio);
  }

  bool isTokenInvalid(String? accessToken) {
    if (accessToken == null) {
      return true;
    }

    //TODO Check if accessToken expired

    return false;
  }

  Future<void> _retryRequest(DioError error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401) {
      final RequestOptions? options = error.response?.requestOptions;
      if (options == null || options.headers["Retry-Count"] == 1) {
        return;
      }

      await refreshAccessToken();
      options.headers["Retry-Count"] = 1; //setting retry count to 1 to prevent further concurrent calls
      final retryResponse = await _restDio.fetch(options);
      return handler.resolve(retryResponse);
    } else {
      return handler.next(error);
    }
  }

  Future<String> refreshAccessToken() async {
    const kEnvBattleNetClientID = String.fromEnvironment("BATTLE_NET_CLIENT_ID");
    const kEnvBattleNetClientSecret = String.fromEnvironment("BATTLE_NET_CLIENT_SECRET");

    final basicAuth = "Basic ${base64.encode(utf8.encode("$kEnvBattleNetClientID:$kEnvBattleNetClientSecret"))}";

    final tokenResponse = await _authClient.getAccessToken(
      basicAuth,
      const TokenRequest(grantType: kClientCredentialsGrantType),
    );

    final accessToken = tokenResponse.accessToken;
    await secureStorage.write(
      key: kAccessTokenKey,
      value: accessToken,
    );
    return accessToken;
  }
}
