import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioFactory {
  final Dio _dio = Dio(); // Dio instance
  DioFactory() {
    _dio.options.baseUrl = Constants.baseUrl;
    _dio.options.connectTimeout = const Duration(minutes: 1);
    _dio.options.receiveTimeout = const Duration(minutes: 1);
    _dio.options.sendTimeout = const Duration(minutes: 5);
    // We can replace the LogInterceptor with PrettyDioLogger package for better logging
    _dio.interceptors.add(
      PrettyDioLogger(
        compact: true, // messages are compacted
        requestHeader: true,
        responseHeader: true,
        enabled: kDebugMode, // only enable PrettyDioLogger in debug mode
        request: true,
        error: true,
        requestBody: true,
        responseBody: true,
      ),
    );
  }
  Dio getDio() {
    return _dio;
  }
}
