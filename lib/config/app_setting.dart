import 'package:shared_preferences/shared_preferences.dart';

class AppSetting {
  static isUserLogged() async {
    final pref = await SharedPreferences.getInstance();
    return pref.get('state')??false;
  }

  static setUserState(bool state) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('state', state);
  }

  static setUserId(int userId) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setInt('userId', userId);
  }
}
