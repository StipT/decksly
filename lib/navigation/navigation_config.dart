import 'package:decksly/app/di.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/features/card_gallery/ui/screen/card_gallery_screen.dart';
import 'package:decksly/features/deck_builder/ui/bloc/deck_builder_bloc.dart';
import 'package:decksly/features/deck_builder/ui/screen/deck_builder_screen.dart';
import 'package:decksly/features/deck_selection/ui/bloc/deck_selection_bloc.dart';
import 'package:decksly/features/deck_selection/ui/screen/deck_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    CardGalleryRoute(),
    DeckSelectionRoute(),
    DeckBuilderRoute(),
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
      BlocProvider(create: (_) => getIt<CardGalleryBloc>(), child: const CardGalleryScreen());

  static final _routes = <GoRoute>[];

  static void open(BuildContext context) => context.go(route());
}

class DeckBuilderRoute extends GoRoute {
  DeckBuilderRoute({
    super.path = _path,
    super.builder = _builder,
  }) : super(routes: _routes);

  static const String _path = '/deck-builder';

  static String route() => '/deck-builder';

  static Widget _builder(
    BuildContext ctx,
    GoRouterState state,
  ) {
    final arguments = state.extra as DeckBuilderArguments;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<CardGalleryBloc>()),
        BlocProvider(create: (_) => getIt<DeckBuilderBloc>()),
      ],
      child: DeckBuilderScreen(
        deckBuilderArguments: arguments,
      ),
    );
  }

  static final _routes = <GoRoute>[];

  static void open(BuildContext context, DeckBuilderArguments arguments) => context.go(route(), extra: arguments);
}

class DeckSelectionRoute extends GoRoute {
  DeckSelectionRoute({
    super.path = _path,
    super.builder = _builder,
  }) : super(
          routes: _routes,
          pageBuilder: (context, state) => buildPageWithHSTransition(),
        );

  static const String _path = '/deck-selection';

  static String route() => '/deck-selection';

  static Widget _builder(
    BuildContext ctx,
    GoRouterState state,
  ) =>
      BlocProvider(create: (_) => getIt<DeckSelectionBloc>(), child: const DeckSelectionScreen());

  static CustomTransitionPage buildPageWithHSTransition<T>() {
    return CustomTransitionPage<void>(
      child: BlocProvider(create: (_) => getIt<DeckSelectionBloc>(), child: const DeckSelectionScreen()),
      transitionDuration: const Duration(milliseconds: 500),
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
