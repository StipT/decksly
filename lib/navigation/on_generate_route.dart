import 'package:decksly/app/app.dart';
import 'package:decksly/navigation/routes.dart';
import 'package:flutter/widgets.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case rCardGallery:
      return _createRoute(
        DeckslyApp(),
      );
    default:
      return _createRoute(Container());
  }
}

Route<PageRouteBuilder<dynamic>> _createRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const beginOffset = Offset(0, 1);
      const endOffset = Offset.zero;
      final tween = Tween<Offset>(begin: beginOffset, end: endOffset);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      );
      final offsetAnimation = curvedAnimation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
