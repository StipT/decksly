import 'package:decksly/features/card_gallery/ui/screen/card_gallery_screen.dart';
import 'package:decksly/features/deck_selector/ui/screen/deck_creator_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    CardGalleryRoute(),
    DeckSelectorRoute(),
  ],
  urlPathStrategy: UrlPathStrategy.path,
);

class CardGalleryRoute extends GoRoute {
  CardGalleryRoute({
    super.path = _path,
    super.builder = _builder,
  }) : super(routes: _routes);

  static const String _path = '/';

  static String route() => '/';

  static Widget _builder(
    BuildContext ctx,
    GoRouterState state,
  ) =>
      const CardGalleryScreen();

  static final _routes = <GoRoute>[];

  static void open(BuildContext context) => context.go(route());
}

class DeckSelectorRoute extends GoRoute {
  DeckSelectorRoute({
    super.path = _path,
    super.builder = _builder,
  }) : super(routes: _routes, pageBuilder: (context, state) => buildPageWithHSTransition(),);

  static const String _path = '/deck-selector';

  static String route() => '/deck-selector';

  static Widget _builder(
      BuildContext ctx,
      GoRouterState state,
      ) =>
      const DeckSelectorScreen();

  static CustomTransitionPage buildPageWithHSTransition<T>() {
    return CustomTransitionPage<void>(
      child: const DeckSelectorScreen(),
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {

        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        const curve = Curves.bounceOut;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(

          parent: animation,
          curve: curve,
        );

        return SlideTransition(position: tween.animate(curvedAnimation), child: child);
      },
    );
  }

  static final _routes = <GoRoute>[];

  static void open(BuildContext context) => context.go(route());
}
