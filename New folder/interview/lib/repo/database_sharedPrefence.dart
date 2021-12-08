import 'package:interview/repo/database.dart';
import 'package:interview/utils/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDatabase implements Database {
  late final SharedPreferences _prefs;

  @override
  Future<void> savePassword(String password) async {
    _prefs = await SharedPreferences.getInstance();
    try {
      _prefs.setString('userPassword', password);
    } catch (error) {
      throw GeneralException(error.toString());
    }
  }

  @override
  Future<String?> getPassword() async {
    _prefs = await SharedPreferences.getInstance();
    try {
      return _prefs.getString('userPassword');
    } catch (error) {
      throw GeneralException(error.toString());
    }
  }
}
