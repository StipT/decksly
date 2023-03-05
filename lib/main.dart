import "package:decksly/app/app.dart";
import "package:decksly/app/di.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:shared_preferences/shared_preferences.dart";

Future<void> main() async {
  configureInjection();
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  _landscapeModeOnly();
  clearStorage();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("en", "US"),
        Locale("de", "DE"),
        Locale("ja", "JP"),
      ],
      path: "assets/l10n",
      fallbackLocale: const Locale("en", "US"),
      child: DeckslyApp(),
    ),
  );
}

void _landscapeModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

/// Fix for FlutterSecureStorage known issue https://github.com/mogol/flutter_secure_storage/issues/210#issuecomment-811939470
Future<void> clearStorage() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getBool("first_run") ?? true) {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    prefs.setBool("first_run", false);
  }
}
