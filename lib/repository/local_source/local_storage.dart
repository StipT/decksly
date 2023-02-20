import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<String?> readLanguageSetting() async {
    final sharedPrefsInstance = await SharedPreferences.getInstance();
    return sharedPrefsInstance.getString("languageKey");
  }

  Future<bool> editLanguageSetting(String languageCode) async {
    final sharedPrefsInstance = await SharedPreferences.getInstance();
    return sharedPrefsInstance.setString("languageKey", languageCode);
  }
}