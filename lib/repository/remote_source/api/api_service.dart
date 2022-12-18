import 'dart:convert';

import 'package:decksly/common/application.constants.dart';
import 'package:decksly/env.dart';
import 'package:decksly/repository/remote_source/api/api_client.dart';
import 'package:decksly/repository/remote_source/auth/auth_client.dart';
import 'package:decksly/repository/remote_source/auth/token_request/token_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class ApiService {
  ApiClient get apiClient;

  AuthClient get authClient;
}

@Injectable(as: ApiService)
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
    return QueuedInterceptorsWrapper(onRequest: (options, handler) async {
      String? accessToken = await secureStorage.read(key: ACCESS_TOKEN_KEY);

      if (isTokenInvalid(accessToken)) {
        accessToken = await refreshAccessToken();
      }
      final token = 'Bearer $accessToken';

      _restDio.options.headers.addAll({'Authorization': token});
      options.headers.addAll({'Authorization': token});
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (error, handler) async {
      return handler.next(error);
    });
  }

  LogInterceptor get logInterceptor => LogInterceptor(
      responseBody: true,
      requestBody: true,
      logPrint: (message) {
        print(message);
      });

  void _setUpServices() {
    secureStorage = const FlutterSecureStorage();

    final _authDio = Dio(
      BaseOptions(baseUrl: AUTH_BASE_URL, headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      }),
    );
    _authDio.interceptors.add(logInterceptor);
    _authClient = AuthClient(_authDio);

    _restDio = Dio(
      BaseOptions(baseUrl: API_BASE_URL, headers: {
        'Content-Type': 'application/json',
      }),
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

  Future<String> refreshAccessToken() async {
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$BATTLENET_CLIENT_ID:$BATTLENET_CLIENT_SECRET'));

    final tokenResponse = await _authClient.getAccessToken(
      basicAuth,
      const TokenRequest(grantType: CLIENT_CREDENTIALS_GRANT_TYPE),
    );

    final accessToken = tokenResponse.accessToken;
    await secureStorage.write(
      key: ACCESS_TOKEN_KEY,
      value: accessToken,
    );
    return accessToken;
  }
}
