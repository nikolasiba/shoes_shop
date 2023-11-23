import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instancia = Preferences._internal();
  factory Preferences() {
    return _instancia;
  }

  Preferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  clear() async {
    await _prefs.clear();
  }

  set user(String user) {
    _prefs.setString('user', user);
  }

  String get user {
    return _prefs.getString('user') ?? '-1';
  }

  
}
