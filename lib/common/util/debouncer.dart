import "dart:async";

import "package:flutter/material.dart";

class Debouncer {
  Debouncer({this.milliseconds = kDefaultDelay});

  final int milliseconds;
  Timer? _timer;

  @visibleForTesting
  static const kDefaultDelay = 2000;

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
