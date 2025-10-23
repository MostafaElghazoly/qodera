import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../my_app.dart';
import '../constants/app_constants.dart';
import '../helper/storage/shared_preferences.dart';
import 'api_constants.dart';

class APIInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = await _addLanguage(options.headers);
    final requiresToken = options.extra[ApiConstants.requiresToken] ?? true;
    if (requiresToken) {
      options.headers = await _addToken(options.headers);
    }
    print(options.headers);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  Future<Map<String, dynamic>> _addLanguage(Map<String, dynamic> headers) async {
    final language = navigatorKey.currentContext!.locale.languageCode;
    headers[ApiConstants.apiLang] = language;
    return headers;
  }

  Future<Map<String, dynamic>> _addToken(Map<String, dynamic> headers) async {
    final token = SharedPreferencesHelper().getString(AppConstants.token);
    if (token != null) {
      headers[ApiConstants.authorization] = 'Bearer $token';
    }
    return headers;
  }
}
