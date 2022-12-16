import 'package:decksly/app/app.dart';
import 'package:decksly/app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  configureInjection();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(const DeckslyApp());
}
