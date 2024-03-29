import "package:auto_route/auto_route.dart";
import "package:decksly/domain/deck_builder/model/deck.dart";
import "package:decksly/presentation/card_gallery/screen/card_gallery_screen.dart";
import "package:decksly/presentation/deck_builder/screen/deck_builder_screen.dart";
import "package:decksly/presentation/deck_selection/screen/deck_selection_screen.dart";
import "package:flutter/material.dart";

part "app_router.gr.dart";

@MaterialAutoRouter(
  replaceInRouteName: "Screen,Route",
  routes: <AutoRoute>[
    AutoRoute(
      page: CardGalleryScreen,
      initial: true,
    ),
    CustomRoute(page: DeckSelectionScreen, transitionsBuilder: bounceInTransition),
    CustomRoute(page: DeckBuilderScreen, transitionsBuilder: bounceOutTransition),
  ],
)
class AppRouter extends _$AppRouter {}

Widget bounceInTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  const begin = Offset(0.0, -1.0);
  const end = Offset.zero;

  final tween = Tween(begin: begin, end: end);
  final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: Curves.bounceOut,
    reverseCurve: Curves.easeOutBack,
  );
  return SlideTransition(position: tween.animate(curvedAnimation), child: child);
}

Widget bounceOutTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  const begin = Offset(0.0, -1.0);
  const end = Offset.zero;

  final tween = Tween(begin: begin, end: end);
  final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: Curves.easeOutBack,
    reverseCurve: Curves.bounceOut,
  );
  return SlideTransition(position: tween.animate(curvedAnimation), child: child);
}
