import 'package:decksly/app/app.dart';
import 'package:decksly/app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  configureInjection();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const DeckslyApp());
}

void _landscapeModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}
