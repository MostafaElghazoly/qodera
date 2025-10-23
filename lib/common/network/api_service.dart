import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../models/api_response.dart';
import 'api_config.dart';
import 'api_constants.dart';
import 'api_interceptors.dart';

enum HttpMethod { get, post, patch, delete, put }

class APIService {
  APIService._internal();
  static final APIService _instance = APIService._internal();
  static APIService get instance => _instance;

  Future<ApiResponse<T>> sendRequest<T>({
    required String endpoint,
    required HttpMethod method,
    dynamic formData,
    Map<String, dynamic>? queryParameters,
    bool withToken = true,
  }) async {
    final Dio dio = Dio();
    dio.options = BaseOptions(
      method: method.name,
      baseUrl: Uri.encodeFull(ApiConfig.endpoint),
      connectTimeout: ApiConfig.timeout,
      receiveTimeout: ApiConfig.timeout,
      sendTimeout: ApiConfig.timeout,
      extra: {ApiConstants.requiresToken: withToken},
    );
    dio.interceptors.add(APIInterceptor());
    dio.interceptors.add(PrettyDioLogger());
    try {
      final response = await dio.request(endpoint, data: formData, queryParameters: queryParameters);
      return _buildResponse<T>(response);
    } catch (exception) {
      if (exception is DioException) {
        if (exception.response == null) {
          return _buildErrorResponse<T>(exception);
        } else {
          return _buildResponse<T>(exception.response!);
        }
      } else {
        return ApiResponse<T>.errorWithRetry(message: 'Unexpected error: $exception');
      }
    }
  }

  ApiResponse<T> _buildResponse<T>(Response response) {
    final statusCode = response.statusCode ?? 500;
    final success = statusCode >= 200 && statusCode < 300;
    if (success) {
      return ApiResponse<T>.success(body: response.data);
    } else {
      final message = _extractErrorMessage(response.data);
      return ApiResponse<T>.errorWithRetry(message: message);
    }
  }

  ApiResponse<T> _buildErrorResponse<T>(DioException error) {
    if (error.error is SocketException) {
      return ApiResponse<T>.errorWithRetry(message: 'No Internet connection');
    } else if (error.type == DioExceptionType.connectionTimeout || error.type == DioExceptionType.receiveTimeout) {
      return ApiResponse<T>.errorWithRetry(message: 'Request timed out');
    } else {
      return ApiResponse<T>.errorWithRetry(
        message: 'Server error: ${error.message}',
      );
    }
  }

  String _extractErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      if (data.containsKey('message')) return data['message'].toString();
      if (data.containsKey('error')) return data['error'].toString();
      if (data.containsKey('errors') && data['errors'] is List) {
        return (data['errors'] as List).first.toString();
      }
    }
    return 'An unexpected error occurred';
  }

  static bool isTokenExpired(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) throw Exception('Invalid JWT token format.');
      final payload = base64Url.decode(base64Url.normalize(parts[1]));
      final payloadMap = jsonDecode(utf8.decode(payload)) as Map<String, dynamic>;
      final exp = payloadMap['exp'] as int?;
      final current = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      return exp == null || exp < current;
    } catch (_) {
      return true;
    }
  }
}
