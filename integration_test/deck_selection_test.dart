import "package:decksly/app/di.dart";
import "package:decksly/main.dart" as app;
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:integration_test/integration_test.dart";

void main() {
  Future<void> navigateToDeckSelection(WidgetTester tester) async {
    await tester.pumpAndSettle();

    final Finder sideMenuArrow = find.byKey(const Key("sideMenuArrow"));
    await tester.tap(sideMenuArrow);
    await tester.pumpAndSettle();

    final Finder deckBuilderFeatureItem = find.byKey(const Key("deckBuilderFeatureItem"));
    await tester.tap(deckBuilderFeatureItem);
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
      await navigateToDeckSelection(tester);

      final deckCodeInput = find.byKey(const Key("deckCodeInput"));
      await tester.tap(deckCodeInput);
      await tester.enterText(deckCodeInput, "invalid code input");
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.go);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester.ensureVisible(find.byKey(const Key("snackBar_alert")));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      await tester.tap(find.byKey(const Key("deckSelectionCloseButton")));
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byKey(const Key("cardList")));
    });

    testWidgets("input deckCode, navigate to Deck Builder", (WidgetTester tester) async {
      await navigateToDeckSelection(tester);

      final deckCodeInput = find.byKey(const Key("deckCodeInput"));
      await tester.tap(deckCodeInput);
      await tester.enterText(
        deckCodeInput,
        "AAECAf0ECJGgBMSgBL2fBMKgBMOgBOj3A9bsA5agBAvU6gP0/APT+QOu9wOt7gOk7wOroAT09gOfkgTL+QOrnwQAAA==",
      );
      await tester.pumpAndSettle();

      final importDeckCodeButton = find.byKey(const Key("importDeckCodeButton"));
      await tester.tap(importDeckCodeButton);
      await tester.pumpAndSettle(const Duration(seconds: 5));

      await tester.ensureVisible(find.byKey(const Key("deckBuilderCardList")));
    });

    testWidgets("select wild mode, select priest, navigate to Deck Builder", (WidgetTester tester) async {
      await navigateToDeckSelection(tester);

      final wildBadge = find.byKey(const Key("modeBadge_wild"));
      await tester.tap(wildBadge);
      await tester.pumpAndSettle();

      await tester.tap(wildBadge);
      await tester.pumpAndSettle();

      final priestBadge = find.byKey(const Key("classBadge_priest"));
      await tester.tap(priestBadge);
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byKey(const Key("deckBuilderCardList")));
    });

    testWidgets("select standard mode,  select demon hunter, navigate to Deck Builder", (WidgetTester tester) async {
      await navigateToDeckSelection(tester);

      final standardBadge = find.byKey(const Key("modeBadge_standard"));
      await tester.tap(standardBadge);
      await tester.pumpAndSettle();

      final classicBadge = find.byKey(const Key("modeBadge_classic"));
      await tester.tap(classicBadge);
      await tester.pumpAndSettle();

      final wildBadge = find.byKey(const Key("modeBadge_wild"));
      await tester.tap(wildBadge);
      await tester.pumpAndSettle();

      await tester.tap(standardBadge);
      await tester.pumpAndSettle();

      final demonHunterBadge = find.byKey(const Key("classBadge_demonhunter"));
      await tester.tap(demonHunterBadge);
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byKey(const Key("deckBuilderCardList")));
    });

    testWidgets("select classic mode, select warrior, navigate to Deck Builder", (WidgetTester tester) async {
      await navigateToDeckSelection(tester);

      final classicBadge = find.byKey(const Key("modeBadge_classic"));
      await tester.tap(classicBadge);
      await tester.pumpAndSettle();

      await tester.tap(classicBadge);
      await tester.pumpAndSettle();

      final warriorBadge = find.byKey(const Key("classBadge_warrior"));
      await tester.tap(warriorBadge);
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byKey(const Key("deckBuilderCardList")));
    });
  });
}
