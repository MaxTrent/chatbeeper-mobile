import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const THEME_STATUS = "themeStatus";

  Future<void> setTheme(bool value) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(THEME_STATUS) ?? false;
  }
//   updateToken(String token) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('token', token);
// }

  Future<dynamic> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final readValue = prefs.getString(key) ?? 0;
    print('read: $readValue');
    return readValue;
  }

  Future<void> updateToken(token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
    print('saved $value');
  }
}
