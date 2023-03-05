import "dart:async";

import "package:flutter/material.dart";

class Throttler {
  Throttler({this.milliseconds = kDefaultDelay});

  @visibleForTesting
  final int milliseconds;

  @visibleForTesting
  Timer? timer;

  @visibleForTesting
  static const kDefaultDelay = 2000;

  void run(VoidCallback action) {
    if (timer?.isActive ?? false) return;

    timer?.cancel();
    action();
    timer = Timer(Duration(milliseconds: milliseconds), () {});
  }

  void dispose() {
    timer?.cancel();
  }
}
