import 'package:dio/dio.dart';
import '../config/app_config.dart';
import '../storage/token_storage.dart';
import 'api_exception.dart';

class ApiClient {
  ApiClient._internal() {
    dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: AppConfig.connectTimeout,
      receiveTimeout: AppConfig.receiveTimeout,
      headers: {'Accept': 'application/json'},
    ));
    _refreshDio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: AppConfig.connectTimeout,
      receiveTimeout: AppConfig.receiveTimeout,
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,
      onError: _onError,
    ));
  }

  static final ApiClient instance = ApiClient._internal();

  late final Dio dio;
  late final Dio _refreshDio; // no interceptor, so no refresh loop
  final TokenStorage tokenStorage = TokenStorage();

  /// Called when refresh fails so the app can send the user to Login.
  void Function()? onSessionExpired;

  // Confirm these against the Postman collection.
  static const _publicPaths = [
    '/api/v1/auth/login',
    '/api/v1/auth/refresh-token',
    '/api/v1/auth/register',
  ];

  bool _isPublic(String path) => _publicPaths.any(path.contains);

  Future<void> _onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!_isPublic(options.path)) {
      final token = await tokenStorage.accessToken;
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  Future<void> _onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final req = err.requestOptions;
    final alreadyRetried = req.extra['retried'] == true;

    if (err.response?.statusCode == 401 &&
        !alreadyRetried &&
        !_isPublic(req.path)) {
      final refreshed = await _refreshTokens();
      if (refreshed) {
        try {
          req.extra['retried'] = true; // retry only once
          final token = await tokenStorage.accessToken;
          req.headers['Authorization'] = 'Bearer $token';
          final response = await dio.fetch(req);
          return handler.resolve(response);
        } on DioException catch (e) {
          return handler.next(e);
        }
      } else {
        await tokenStorage.clear();
        onSessionExpired?.call();
      }
    }
    handler.next(err);
  }

  Future<bool> _refreshTokens() async {
    final refresh = await tokenStorage.refreshToken;
    if (refresh == null || refresh.isEmpty) return false;
    try {
      final res = await _refreshDio.post(
        '/api/v1/auth/refresh-token',
        data: {'refreshToken': refresh},
      );
      final data = res.data['data'] as Map<String, dynamic>;
      await tokenStorage.saveSession(
        accessToken: data['accessToken'] as String,
        refreshToken: data['refreshToken'] as String,
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  static ApiException toException(Object e) =>
      e is DioException ? ApiException.fromDio(e) : ApiException('$e');
}