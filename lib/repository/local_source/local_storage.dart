import 'package:decksly/common/application.constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class LocalStorage {
  Future<String> readLocaleSetting() async {
    final sharedPrefsInstance = await SharedPreferences.getInstance();
    return sharedPrefsInstance.getString(LOCALE_KEY) ?? "en_US";
  }

  Future<bool> editLocaleSetting(String languageCode) async {
    final sharedPrefsInstance = await SharedPreferences.getInstance();
    return sharedPrefsInstance.setString(LOCALE_KEY, languageCode);
  }
}
