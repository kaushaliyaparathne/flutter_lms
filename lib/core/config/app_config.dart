class AppConfig {
  // Real phone (same Wi-Fi as laptop). Update if the laptop IP changes.
  // Android emulator: http://10.0.2.2:5000
  // Do NOT add /api/v1 here. Endpoint paths already include it.
  static const String baseUrl = 'http://192.168.1.4:5000';

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 30);
}