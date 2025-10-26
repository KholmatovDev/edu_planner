import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {
  static late final SharedPreferences _instance;

  static Future<void> initSharedPref() async {
    _instance = await SharedPreferences.getInstance();
  }

  /// Indelible data

  Future<void> setDeviceId(String deviceId) async => await _instance.setString('device_id', deviceId);

  String? getDeviceId() => _instance.getString('device_id');

  Future<void> setStories(String ids) async => await _instance.setString('stories', ids);

  List<int> getStories() => _instance.getString('stories')?.split(',').map((e) => int.parse(e)).toList() ?? [];

  Future<void> clearStories() => _instance.remove('stories');

  Future<void> setLang(String lang) async => await _instance.setString('language', lang);

  String getLang() => _instance.getString('language') ?? 'uz-Latn-UZ';

  Future<void> setSession(String sessionId) async => await _instance.setString("session_id", sessionId);

  String? getSession() => _instance.getString('session_id');

  Future<bool> setIsFirsOpen() async => await _instance.setBool('isFirstOpen', false);

  bool? getIsFirsOpen() =>  _instance.getBool('isFirstOpen');

  ///

  Future<void> setFcmToken(String token) async => await _instance.setString('fcm_token', token);

  String? getFcmToken() => _instance.getString("fcm_token");

  Future<void> setAccess(String access) async => await _instance.setString('access', access);

  String? getAccess() => _instance.getString('access');

  Future<bool> setRole(String role) async => await _instance.setString('role', role);

  String? getRole() => _instance.getString('role');

  Future<bool> setEmployerRole(String role) async => await _instance.setString('employer_role', role);

  Future<bool> setProfileId(int profileId) async => await _instance.setInt('profile_id', profileId);

  int? getProfileId() => _instance.getInt('profile_id');

}