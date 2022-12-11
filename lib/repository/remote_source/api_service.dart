import 'package:decksly/common/application.constants.dart';
import 'package:decksly/repository/remote_source/api_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class ApiService {
  ApiClient get apiClient;
}

@Injectable(as: ApiService)
class ApiServiceImpl implements ApiService {
  ApiServiceImpl() {
    _setUpServices();
  }

  late final Dio _restDio;
  late final ApiClient _apiClient;

  @override
  ApiClient get apiClient => _apiClient;

  QueuedInterceptorsWrapper get queuedInterceptor {
    return QueuedInterceptorsWrapper(onRequest: (options, handler) async {
      const authToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOGQ3Zjc2OTQ3OTA0YTAxMTI4NmRjNzMyYzU1MjM0ZSIsInN1YiI6IjYwMzM3ODBiMTEzODZjMDAzZjk0ZmM2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XYuIrLxvowrkevwKx-KhOiOGZ2Tn-R8tEksXq842kX4';
      const token = 'Bearer $authToken';
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
    _restDio = Dio(
      BaseOptions(baseUrl: API_BASE_URL, headers: {
        'Content-Type': 'application/json',
      }),
    );
    _restDio.interceptors.add(queuedInterceptor);
    _restDio.interceptors.add(logInterceptor);
    _apiClient = ApiClient(_restDio);
  }
}
