import "package:logger/logger.dart";

class DebugLogger {

  factory DebugLogger() {
    return _instance;
  }

  DebugLogger._internal() {
    logger = Logger();
  }
  static final DebugLogger _instance = DebugLogger._internal();

  late final Logger logger;
}

void log(String message, {Level level = Level.debug}) {
  DebugLogger().logger.log(level, message);
}
