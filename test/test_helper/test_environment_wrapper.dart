import "package:decksly/app/app.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class TestEnvironmentWrapper extends StatelessWidget {
  const TestEnvironmentWrapper({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenUtilInit(
        designSize: DeckslyApp.designScreenSize,
        builder: (BuildContext context, Widget? _) {
          return Scaffold(
            body: child,
          );
        },
      ),
    );
  }
}
