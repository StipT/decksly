// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    CardGalleryRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CardGalleryScreen(),
      );
    },
    DeckSelectionRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const DeckSelectionScreen(),
        transitionsBuilder: bounceInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DeckBuilderRoute.name: (routeData) {
      final args = routeData.argsAs<DeckBuilderRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: DeckBuilderScreen(
          key: args.key,
          deck: args.deck,
        ),
        transitionsBuilder: bounceOutTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          CardGalleryRoute.name,
          path: '/',
        ),
        RouteConfig(
          DeckSelectionRoute.name,
          path: '/deck-selection-screen',
        ),
        RouteConfig(
          DeckBuilderRoute.name,
          path: '/deck-builder-screen',
        ),
      ];
}

/// generated route for
/// [CardGalleryScreen]
class CardGalleryRoute extends PageRouteInfo<void> {
  const CardGalleryRoute()
      : super(
          CardGalleryRoute.name,
          path: '/',
        );

  static const String name = 'CardGalleryRoute';
}

/// generated route for
/// [DeckSelectionScreen]
class DeckSelectionRoute extends PageRouteInfo<void> {
  const DeckSelectionRoute()
      : super(
          DeckSelectionRoute.name,
          path: '/deck-selection-screen',
        );

  static const String name = 'DeckSelectionRoute';
}

/// generated route for
/// [DeckBuilderScreen]
class DeckBuilderRoute extends PageRouteInfo<DeckBuilderRouteArgs> {
  DeckBuilderRoute({
    Key? key,
    required Deck deck,
  }) : super(
          DeckBuilderRoute.name,
          path: '/deck-builder-screen',
          args: DeckBuilderRouteArgs(
            key: key,
            deck: deck,
          ),
        );

  static const String name = 'DeckBuilderRoute';
}

class DeckBuilderRouteArgs {
  const DeckBuilderRouteArgs({
    this.key,
    required this.deck,
  });

  final Key? key;

  final Deck deck;

  @override
  String toString() {
    return 'DeckBuilderRouteArgs{key: $key, deck: $deck}';
  }
}
