import 'package:decksly/features/card_gallery/ui/screen/card_gallery_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    CardGalleryRoute(),
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

  static void open(BuildContext context) => context.goNamed(route());
}
