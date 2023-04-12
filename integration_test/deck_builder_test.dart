import "package:decksly/app/di.dart";
import "package:decksly/main.dart" as app;
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:integration_test/integration_test.dart";

void main() {
  Future<void> navigateToDeckBuilder(WidgetTester tester) async {
    await tester.pumpAndSettle();

    final Finder sideMenuArrow = find.byKey(const Key("sideMenuArrow"));
    await tester.tap(sideMenuArrow);
    await tester.pumpAndSettle();

    final Finder deckBuilderFeatureItem = find.byKey(const Key("deckBuilderFeatureItem"));
    await tester.tap(deckBuilderFeatureItem);
    await tester.pumpAndSettle();

    final Finder classBadgeMage = find.byKey(const Key("classBadge_mage"));
    await tester.tap(classBadgeMage);
    await tester.pumpAndSettle();
  }

  group("DeckSelection e2e", () {
    setUpAll(() async {
      final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
      binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
      getIt.allowReassignment = true;
    });

    setUp(() async {
      await Future.delayed(const Duration(seconds: 5), () {
        app.main();
      });
    });

    testWidgets("input deckCode, receive failed message, close Deck Selection", (WidgetTester tester) async {
      await navigateToDeckBuilder(tester);
      await tester.ensureVisible(find.byKey(const Key("deckBuilderCardList")));

      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      final card = find.byKey(const Key("cardItem_0"));
      await tester.tap(card);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(card);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

    });
  });
}
