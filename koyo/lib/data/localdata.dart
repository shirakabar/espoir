//このページは製作者に許可を取って千種祭アプリを真似してます
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static Future saveLocalData<T>(String name, T value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (T) {
      case const (int):
        await prefs.setInt(name, value as int);
        break;
      case const (String):
        await prefs.setString(name, value as String);
        break;
      case const (bool):
        await prefs.setBool(name, value as bool);
        break;
      case const (List):
        await prefs.setStringList(name, value as List<String>);
        break;
      default:
        break;
    }
  }

  static Future<dynamic> readLocalData<T>(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Object? result;
    switch (T) {
      case const (int):
        result = prefs.getInt(name);
        break;
      case const (String):
        result = prefs.getString(name);
        break;
      case const (bool):
        result = prefs.getBool(name);
        break;
      case const (List):
        result = prefs.getStringList(name);
        break;
      default:
        break;
    }
    return result;
  }

  static void deleteLocalData(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(name);
  }
}