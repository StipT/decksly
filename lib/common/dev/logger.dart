import 'package:logger/logger.dart';

class DebugLogger {
  static final DebugLogger _instance = DebugLogger._internal();

  factory DebugLogger() {
    return _instance;
  }

  late final Logger logger;

  DebugLogger._internal() {
    logger = Logger();
  }
}

void log(String message, {Level level = Level.debug}) {
  DebugLogger().logger.log(level, message);
}
