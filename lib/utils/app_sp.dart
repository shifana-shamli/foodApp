import 'package:shared_preferences/shared_preferences.dart';

class AppSp{

  Future<bool> setIsLogged(bool login) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("isLogged", login);
  }

  Future<bool> getIsLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLogged") ?? false;
  }

  Future<bool> setIsAppLaunched(bool onceOpen) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("isAppLaunched", onceOpen);
  }

  Future<bool> getIsAppLaunched() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isAppLaunched") ?? false;
  }


}
