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
    });

    setUp(() async {
      await Future.delayed(const Duration(seconds: 5), () {
        app.main();
      });
    });

    testWidgets("add cards to deck", (WidgetTester tester) async {
      await navigateToDeckBuilder(tester);
      await tester.ensureVisible(find.byKey(const Key("deckBuilderCardList")));

      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      final card = find.byKey(const Key("cardItem_0"));
      await tester.tap(card);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(card);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      await tester.tap(find.byKey(const Key("fetchDeckCodeButton")));
      await tester.pumpAndSettle(const Duration(seconds: 7));

      await tester.tap(find.byKey(const Key("newDeckButton")));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("dialogSecondaryButton")));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("newDeckButton")));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("dialogPrimaryButton")));
      await tester.pumpAndSettle();
    });

    testWidgets("card class filter", (WidgetTester tester) async {
      await navigateToDeckBuilder(tester);

      await tester.tap(find.byKey(const Key("appBarToggle")));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("appBarToggle")));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("classFilterButton")));
      await tester.pumpAndSettle(const Duration(seconds: 7));

      await tester.tap(find.byKey(const Key("neutralClassFilterButton")));
      await tester.pumpAndSettle(const Duration(seconds: 7));

      await tester.tap(find.byKey(const Key("neutralClassFilterButton")));
      await tester.pumpAndSettle(const Duration(seconds: 7));

      await tester.tap(find.byKey(const Key("classFilterButton")));
      await tester.pumpAndSettle(const Duration(seconds: 7));
    });

    testWidgets("open sideMenu, change languages, close sideMenu ", (WidgetTester tester) async {
      await navigateToDeckBuilder(tester);

      final Finder sideMenuArrow = find.byKey(const Key("sideMenuArrow"));
      await tester.tap(sideMenuArrow);
      await tester.pumpAndSettle();

      final Finder germanLanguageButton = find.byKey(const Key("germanLanguageButton"));
      await tester.tap(germanLanguageButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 1000));

      final Finder japaneseLanguageButton = find.byKey(const Key("japaneseLanguageButton"));
      await tester.tap(japaneseLanguageButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 1000));

      final Finder englishLanguageButton = find.byKey(const Key("englishLanguageButton"));
      await tester.tap(englishLanguageButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 1000));

      final Finder cardList = find.byKey(const Key("deckBuilderCardList"));
      await tester.tap(cardList);
      await tester.pumpAndSettle(const Duration(milliseconds: 1000));
    });
  });
}
