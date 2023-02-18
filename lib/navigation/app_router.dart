import 'package:auto_route/auto_route.dart';
import 'package:decksly/features/card_gallery/ui/screen/card_gallery_screen.dart';
import 'package:decksly/features/deck_builder/ui/screen/deck_builder_screen.dart';
import 'package:decksly/features/deck_selection/ui/screen/deck_selection_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: CardGalleryScreen, initial: true, maintainState: true, ),
    AutoRoute(page: DeckSelectionScreen),
    AutoRoute(page: DeckBuilderScreen),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter{}