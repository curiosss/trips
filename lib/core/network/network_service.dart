import 'package:dio/dio.dart';
import 'package:trips/config/constants/app_constants.dart';

class NetworkService {
  Dio httpClient = Dio();

  NetworkService() {
    init();
  }

  init() {
    httpClient.options.baseUrl = AppConstants.baseUrl;
    httpClient.options.connectTimeout = const Duration(seconds: 60);
    httpClient.options.sendTimeout = const Duration(seconds: 60);
    httpClient.options.receiveTimeout = const Duration(seconds: 60);
    httpClient.options.headers.addAll(
      {
        'Accept-Language': 'tk',
      },
    );
  }

  changeLocale(String locale) {
    httpClient.options.headers['Accept-Language'] = locale;
  }

  setToken(String token) {
    httpClient.options.headers['Authorization'] = 'Bearer $token';
  }

  removeToken() {
    httpClient.options.headers['Authorization'] = null;
  }
}
