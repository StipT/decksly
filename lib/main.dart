import 'package:decksly/app/app.dart';
import 'package:decksly/app/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';

Future<void> main() async {
  configureInjection();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  _landscapeModeOnly();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('de', 'DE'),
      Locale('ja', 'JP'),
    ],
      saveLocale: true,
      path: 'assets/l10n',
      fallbackLocale: const Locale('de', 'DE'),
      child: DeckslyApp()),);
}

void _landscapeModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}
