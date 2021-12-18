
import 'package:evemts/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
enum PrefKeys { loggedIn, id,  mobile,token }

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();

  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required User user}) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);

    await _sharedPreferences.setString(
        PrefKeys.mobile.toString(), user.mobile);

    await _sharedPreferences.setInt(PrefKeys.id.toString(), user.id);
    await _sharedPreferences.setString(
        PrefKeys.token.toString(), 'Bearer ' + user.token);
  }
  Future<bool> logout() async {
    return await _sharedPreferences.clear();
  }
  Future<bool> delete() async {
    return await _sharedPreferences.clear();
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  String get token =>
      _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}
