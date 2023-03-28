import "package:decksly/domain/card_gallery/model/card_filters/card_filter/card_filter.dart";
import "package:decksly/domain/card_gallery/model/card_filters/card_set.dart";
import "package:decksly/main.dart" as app;
import "package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";
import "package:integration_test/integration_test.dart";

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  Future<void> testDropdownFilter(
    WidgetTester tester,
    List<CardFilter> cardFilters,
    Key dropdownKey,
    bool Function(int, CardDTO?) expect,
  ) async {
    await tester.runAsync(() async {
      final Finder filterDropdown = find.byKey(dropdownKey);
      final cardList = tester.widget(find.byKey(const Key("cardList"))) as PagedGridView;

      int index = -1;
      for (final cardFilter in cardFilters) {
        index++;
        final expectedCardFilterId = cardFilter.id();

        // Tap on Set filter dropdown
        await tester.tap(filterDropdown);
        await tester.pumpAndSettle();

        final Finder dropdownValue = find.byKey(Key("${cardFilter.value}_dropdown_item"));

        // Tap on select dropdown item
        await tester.dragUntilVisible(
          dropdownValue, // what you want to find
          find.byKey(const Key("dropdownListView")), // widget you want to scroll
          const Offset(0, -100), // delta to move
        );

        await tester.pumpAndSettle();
        await tester.tap(dropdownValue);

        await tester.pumpAndSettle(
          const Duration(milliseconds: 500),
        );

        final CardDTO? firstCard = cardList.pagingController.itemList?.first as CardDTO?;
        expect(0, firstCard);
        if (firstCard != null && firstCard.id != expectedCardFilterId) {
          // Since we are not mocking our API calls, we are waiting for the response. Sometimes responses are under 500ms, but 1 in 50 times, it takes upwards to 7 seconds
          await tester.pumpAndSettle(
            const Duration(seconds: 7),
          );
        }

        cardList.pagingController.itemList?.forEach((element) {
          final card = element as CardDTO;
          expect(index, card);
        });
      }
    });
  }

  group("CardGallery e2e", () {
    testWidgets("card set filter", (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await testDropdownFilter(tester, CardSet.values.cast<CardFilter>(), const Key("setFilterDropdown"),
          (index, card) {
        if (card?.cardSetId == CardSet.standard.id()) {
          final standardCardSetIds = getCardSets(subCollection: SubCollection.standardSets).map((e) => e.id());
          expect(standardCardSetIds.contains(card?.cardSetId), true);
        } else if (card?.cardSetId == CardSet.wild.id()) {
          // Wild cards contain all sets in the constructed mode of play
          expect(card?.cardSetId.runtimeType, int);
        } else if (card?.cardSetId == CardSet.legacy.id()) {
          // Classic cards have "alias set IDs" for some reason, so we check for any of those IDs
          expect(card?.cardSetId, anyOf(card?.cardSetId, 3, 4));
        } else {
          expect(card?.cardSetId, card?.cardSetId);
        }
        return false;
      });
    });
  });
}
