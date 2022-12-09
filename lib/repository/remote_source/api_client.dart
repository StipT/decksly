import 'dart:io';

import 'package:decksly/app/di_config.dart';
import 'package:decksly/common/application.constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiClient {
  ApiClient() {
    _dio = Dio();
      _storage = locator<storage.FlutterSecureStorage>();
      _dio.options.baseUrl = API_BASE_URL;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions opt, RequestInterceptorHandler handler) async =>
            _onRequest(opt, handler),
      ),
    );

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  RequestOptions lastRetry = RequestOptions(path: "");

  late final Dio _dio;
  late final FlutterSecureStorage _storage;
  late final _logger = Logger();

  Dio getDio() => _dio;

  Future<void> _onRequest(
      RequestOptions opt,
      RequestInterceptorHandler handler,
      ) async {
    if (await InternetConnectionChecker().hasConnection != true) {
      opt.data = INTERNET_CONNECTION_ERROR;
      return handler.next(opt);
    }
    await refreshTokenIfNeeded();
    opt.headers['Authorization'] = 'Bearer ${await accessToken()}';
    return handler.next(opt);
  }

  Future<void> refreshTokenIfNeeded() async {
    final access = await accessToken();
    if (JwtDecoder.getRemainingTime(access).inSeconds <= 30) {
      await refreshTokens();
    }
  }

  Future<void> refreshTokens() async {
    final refreshToken = await _storage.read(
      key: REFRESH_TOKEN_LOCAL_STORAGE_KEY,
      iOptions: const storage.IOSOptions(
        accessibility: storage.IOSAccessibility.first_unlock,
      ),
    );
    final response = await _authClient.getDio().post(
      '/api/v1/token/refresh',
      options: Options(headers: {'Authorization': "Bearer $refreshToken"}),
    );
    if (response.statusCode == 200) {
      await _storeTokens(
        response.data[ACCESS_TOKEN_RESPONSE_KEY].toString(),
        response.data[REFRESH_TOKEN_RESPONSE_KEY].toString(),
      );
    }
  }
}
