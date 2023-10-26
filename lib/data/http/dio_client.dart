import 'package:dio/dio.dart';

class DioClient {
  const DioClient._(this._dio);

  factory DioClient.djangoLocal() {
    return DioClient._(
      Dio(
        BaseOptions(
          baseUrl: 'http://127.0.0.1:8000/',
        ),
      ),
    );
  }

  final Dio _dio;

  String get baseUrl => _dio.options.baseUrl;

  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) =>
      _dio.get<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
}
