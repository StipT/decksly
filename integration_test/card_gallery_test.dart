import "package:decksly/features/card_gallery/domain/model/card_filters/card_set.dart";
import "package:decksly/main.dart" as app;
import "package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";
import "package:integration_test/integration_test.dart";

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group("CardGallery e2e", () {
    testWidgets("card set filter", (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder setFilterDropdown = find.byKey(const Key("setFilterDropdown"));
      final cardList = tester.widget(find.byKey(const Key("cardList"))) as PagedGridView;

      for (final cardSet in CardSet.values) {
        final expectedCardSetId = cardSet.id();

        // Tap on Set filter dropdown
        await tester.tap(setFilterDropdown);
        await tester.pumpAndSettle();

        final Finder setDropdownValue = find.byKey(Key("${cardSet.value}_dropdown_item"));

        // Tap on select dropdown item
        await tester.dragUntilVisible(
          setDropdownValue, // what you want to find
          find.byKey(const Key("dropdownListView")), // widget you want to scroll
          const Offset(0, -100), // delta to move
        );

        await tester.pumpAndSettle();
        await tester.tap(setDropdownValue);

        await tester.pumpAndSettle(
          const Duration(milliseconds: 500),
        );

        final CardDTO? firstCard = cardList.pagingController.itemList?.first as CardDTO?;
        if (firstCard != null && firstCard.cardSetId != expectedCardSetId) {
          // Since we are not mocking our API calls, we are waiting for the response. Sometimes responses are under 500ms, but 1 in 50 times, it takes upwards to 7 seconds
          await tester.pumpAndSettle(
            const Duration(seconds: 7),
          );
        }

        cardList.pagingController.itemList?.forEach((element) {
          final card = element as CardDTO;

          if (cardSet == CardSet.standard) {
            final standardCardSetIds = getCardSets(subCollection: SubCollection.standardSets).map((e) => e.id());
            expect(standardCardSetIds.contains(card.cardSetId), true);
          } else if (cardSet == CardSet.wild) {
            // Wild cards contain all sets in the constructed mode of play
            expect(card.cardSetId.runtimeType, int);
          } else if (cardSet == CardSet.legacy) {
            // Classic cards have "alias set IDs" for some reason, so we check for any of those IDs
            expect(card.cardSetId.runtimeType, anyOf(expectedCardSetId, 3, 4));
          } else {
            expect(card.cardSetId, expectedCardSetId);
          }
        });
      }
    });
  });
}
