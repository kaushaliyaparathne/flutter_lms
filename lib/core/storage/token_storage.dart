import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _accessKey = 'accessToken';
  static const _refreshKey = 'refreshToken';
  static const _roleKey = 'role';
  static const _rememberKey = 'rememberMe';

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveSession({
    required String accessToken,
    required String refreshToken,
    String? role,
  }) async {
    await _storage.write(key: _accessKey, value: accessToken);
    await _storage.write(key: _refreshKey, value: refreshToken);
    if (role != null) await _storage.write(key: _roleKey, value: role);
  }

  Future<String?> get accessToken => _storage.read(key: _accessKey);
  Future<String?> get refreshToken => _storage.read(key: _refreshKey);
  Future<String?> get role => _storage.read(key: _roleKey);

  Future<void> setRememberMe(bool value) =>
      _storage.write(key: _rememberKey, value: value.toString());

  Future<bool> get rememberMe async =>
      (await _storage.read(key: _rememberKey)) == 'true';

  Future<void> clear() => _storage.deleteAll();
}