import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStoragePrefService {

  static const String isLogged = 'is_loggedIn';

  static SharedPreferences? _pref;

  static Future<SharedPreferences> _getPrefs() async {
    if (_pref != null) return _pref!;
    _pref = await SharedPreferences.getInstance();
    return _pref!;
  }

    static Future<void> setLogin() async {
    log('set login =>()');
    final preferences = await _getPrefs();
    await preferences.setBool(isLogged, true);
  }

  static Future<void> clearLogin() async {
    log('delete all secureStorage =>()');
    final preferences = await _getPrefs();
    await preferences.setBool(isLogged, false);
  }

  static Future<bool> getLogin() async {
    log('get login =>()');
    final preferences = await _getPrefs();
    final login = preferences.getBool(isLogged) ?? false;
    log('get login =>() $login');
    return login;
  }
}
