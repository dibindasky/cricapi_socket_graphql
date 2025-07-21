import 'dart:developer';
import 'package:distinct_assignment/domain/model/auth/token_model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStoragePrefService {
  static const String isLogged = 'is_loggedIn';
  static const String accessKey = 'access_key';

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

  static Future<void> saveTokens({required TokenModel tokenModel}) async {
    final preferences = await _getPrefs();
    await preferences.setString(accessKey, tokenModel.token ?? '');
  }

  static Future<TokenModel> getToken() async {
    log('get token =>()');
    final preferences = await _getPrefs();
    final accessToken = preferences.getString(accessKey);
    log('accessToken => $accessToken');
    return TokenModel(token: accessToken);
  }
}
