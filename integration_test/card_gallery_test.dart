import "package:decksly/domain/card_gallery/model/card_filters/attack.dart";
import "package:decksly/domain/card_gallery/model/card_filters/card_class.dart";
import "package:decksly/domain/card_gallery/model/card_filters/card_filter/card_filter.dart";
import "package:decksly/domain/card_gallery/model/card_filters/card_set.dart";
import "package:decksly/domain/card_gallery/model/card_filters/card_type.dart";
import "package:decksly/domain/card_gallery/model/card_filters/health.dart";
import "package:decksly/domain/card_gallery/model/card_filters/keywords.dart";
import "package:decksly/domain/card_gallery/model/card_filters/minion_type.dart";
import "package:decksly/domain/card_gallery/model/card_filters/rarity.dart";
import "package:decksly/domain/card_gallery/model/card_filters/spell_school.dart";
import "package:decksly/main.dart" as app;
import "package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";
import "package:integration_test/integration_test.dart";

void main() {
  Future<void> testDropdownFilter(
    WidgetTester tester,
    List<CardFilter> cardFilters,
    Key dropdownKey,
    Function(int, CardDTO?) expect,
    bool Function(int, CardDTO?) waitForResponse,
  ) async {
    final Finder filterDropdown = find.byKey(dropdownKey);
    final cardList = tester.widget(find.byKey(const Key("cardList"))) as PagedGridView;

    int index = -1;
    for (final cardFilter in cardFilters) {
      index++;

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

      final itemList = cardList.pagingController.itemList as List<CardDTO>?;
      final card = itemList!.isEmpty ? null : itemList.first;

      final shouldWaitForResponse = waitForResponse(index, card);

      if (shouldWaitForResponse) {
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
  }

  group("CardGallery e2e", () {
    setUpAll(() async {
      final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
      binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
    });

    setUp(() async {
      await Future.delayed(const Duration(seconds: 5), () {
        app.main();
      });
    });

    testWidgets("open sideMenu, change languages, close sideMenu ", (WidgetTester tester) async {
      await tester.pumpAndSettle();

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

      final Finder cardList = find.byKey(const Key("cardList"));
      await tester.tap(cardList);
      await tester.pumpAndSettle(const Duration(milliseconds: 1000));
    });

    testWidgets("select card, details screen", (WidgetTester tester) async {
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("cardListItem")).first);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("detailsCard")));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("closeDetails")));
      await tester.pumpAndSettle();
    });

    testWidgets("open sideMenu, navigate to Deck Builder", (WidgetTester tester) async {
      await tester.pumpAndSettle();

      final Finder sideMenuArrow = find.byKey(const Key("sideMenuArrow"));
      await tester.tap(sideMenuArrow);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("deckBuilderFeatureItem")));
      await tester.pumpAndSettle();
    });

    testWidgets("card class filter", (WidgetTester tester) async {
      await tester.pumpAndSettle();

      await testDropdownFilter(
        tester,
        CardClass.values.cast<CardFilter>(),
        const Key("classFilterDropdown"),
        (index, card) {
          expect(card?.cardSetId, card?.cardSetId);
        },
        (index, card) {
          return card != null && card.classId != CardClass.values[index].id();
        },
      );
    });

    testWidgets("card set filter", (WidgetTester tester) async {
      await tester.pumpAndSettle();

      await testDropdownFilter(
        tester,
        CardSet.values.cast<CardFilter>(),
        const Key("setFilterDropdown"),
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
        },
        (index, card) {
          return card != null && card.cardSetId != CardSet.values[index].id();
        },
      );
    });

    testWidgets("mana picker filter", (WidgetTester tester) async {
      await tester.pumpAndSettle();

      final cardList = tester.widget(find.byKey(const Key("cardList"))) as PagedGridView;
      final Finder mana0 = find.byKey(const Key("manaItem0"));
      await tester.tap(mana0);

      await tester.pumpAndSettle(
        const Duration(milliseconds: 500),
      );

      var firstCard = cardList.pagingController.itemList?.first as CardDTO?;

      if (firstCard != null && firstCard.manaCost != 0) {
        // Since we are not mocking our API calls, we are waiting for the response. Sometimes responses are under 500ms, but 1 in 50 times, it takes upwards to 7 seconds
        await tester.pumpAndSettle(
          const Duration(seconds: 7),
        );
      }

      cardList.pagingController.itemList?.forEach((element) {
        final card = element as CardDTO;
        expect(card.manaCost, 0);
      });

      final Finder mana5 = find.byKey(const Key("manaItem5"));
      await tester.tap(mana0);
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
      );
      await tester.tap(mana5);

      firstCard = cardList.pagingController.itemList?.first as CardDTO?;

      if (firstCard != null && firstCard.manaCost != 5) {
        // Since we are not mocking our API calls, we are waiting for the response. Sometimes responses are under 500ms, but 1 in 50 times, it takes upwards to 7 seconds
        await tester.pumpAndSettle(
          const Duration(seconds: 7),
        );
      }

      cardList.pagingController.itemList?.forEach((element) {
        final card = element as CardDTO;
        expect(card.manaCost, 5);
      });

      final Finder mana8 = find.byKey(const Key("manaItem8"));
      await tester.tap(mana5);
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
      );
      await tester.tap(mana8);

      firstCard = cardList.pagingController.itemList?.first as CardDTO?;

      if (firstCard != null && firstCard.manaCost != 8) {
        // Since we are not mocking our API calls, we are waiting for the response. Sometimes responses are under 500ms, but 1 in 50 times, it takes upwards to 7 seconds
        await tester.pumpAndSettle(
          const Duration(seconds: 7),
        );
      }

      cardList.pagingController.itemList?.forEach((element) {
        final card = element as CardDTO;
        expect(card.manaCost, 8);
      });
    });

    testWidgets("search keyword filter", (WidgetTester tester) async {
      await tester.pumpAndSettle();
      final cardList = tester.widget(find.byKey(const Key("cardList"))) as PagedGridView;
      final Finder searchFilter = find.byKey(const Key("searchFilter"));

      await tester.tap(searchFilter);
      await tester.enterText(searchFilter, "dragon");
      await tester.testTextInput.receiveAction(TextInputAction.search);

      await tester.pumpAndSettle(
        const Duration(milliseconds: 1000),
      );

      final firstCard = cardList.pagingController.itemList?.first as CardDTO?;

      if (firstCard != null && firstCard.name.toLowerCase().contains("dragon") ||
          firstCard!.text!.toLowerCase().contains("dragon") ||
          firstCard.minionTypeId == MinionType.dragon.id()) {
        // Since we are not mocking our API calls, we are waiting for the response. Sometimes responses are under 500ms, but 1 in 50 times, it takes upwards to 7 seconds
        await tester.pumpAndSettle(
          const Duration(seconds: 7),
        );
      }

      cardList.pagingController.itemList?.forEach((element) {
        final card = element as CardDTO;
        final isFiltered = card.name.toLowerCase().contains("dragon") ||
            card.text!.toLowerCase().contains("dragon") ||
            card.minionTypeId == MinionType.dragon.id();
        expect(isFiltered, true);
      });

      final Finder searchSuffixIcon = find.byKey(const Key("searchSuffixIcon"));

      await tester.tap(searchSuffixIcon);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
    });

    testWidgets("attack filter", (WidgetTester tester) async {
      await tester.pumpAndSettle();

      final Finder toggleButton = find.byKey(const Key("appBarToggle"));
      await tester.tap(toggleButton);
      await tester.pumpAndSettle();

      await testDropdownFilter(
        tester,
        Attack.values.cast<CardFilter>(),
        const Key("attackDropdown"),
        (index, card) {
          if (card != null && index == 11) {
            final isHigherThan9 = card.attack! > 9;
            expect(isHigherThan9, true);
          } else if (index != 0) {
            expect(card?.attack, Attack.values[index].id());
          }
        },
        (index, card) {
          if (index != 0) {
            return card != null && card.attack != Attack.values[index].id();
          } else {
            return true;
          }
        },
      );
    });

    testWidgets("health filter", (WidgetTester tester) async {
      await tester.pumpAndSettle();

      final Finder toggleButton = find.byKey(const Key("appBarToggle"));
      await tester.tap(toggleButton);
      await tester.pumpAndSettle();

      await testDropdownFilter(
        tester,
        Health.values.cast<CardFilter>(),
        const Key("healthDropdown"),
        (index, card) {
          if (card != null && index == 11) {
            final isHigherThan9 = card.health! > 9;
            expect(isHigherThan9, true);
          } else if (card == null && index == 1) {
            expect(card, null);
          } else if (index != 0) {
            expect(card?.health, Health.values[index].id());
          }
        },
        (index, card) {
          if (index != 0) {
            return card != null && card.health != Health.values[index].id();
          } else {
            return true;
          }
        },
      );
    });

    testWidgets("typeDropdown filter", (WidgetTester tester) async {
      await tester.pumpAndSettle();

      final Finder toggleButton = find.byKey(const Key("appBarToggle"));
      await tester.tap(toggleButton);
      await tester.pumpAndSettle();

      await tester.dragUntilVisible(
        find.byKey(const Key("typeDropdown")),
        find.byKey(const Key("filterAppBarExtension")),
        const Offset(-100, 0),
      );
      await tester.pumpAndSettle();

      await testDropdownFilter(
        tester,
        CardType.values.cast<CardFilter>(),
        const Key("typeDropdown"),
        (index, card) {
          if (card == null && index == 1) {
            expect(card, null);
          } else if (index != 0) {
            expect(card?.cardTypeId, CardType.values[index].id());
          }
        },
        (index, card) {
          if (index != 0) {
            return card != null && card.cardTypeId != CardType.values[index].id();
          } else {
            return true;
          }
        },
      );
    });

    testWidgets("minionTypeDropdown filter", (WidgetTester tester) async {
      await tester.pumpAndSettle();

      final Finder toggleButton = find.byKey(const Key("appBarToggle"));
      await tester.tap(toggleButton);
      await tester.pumpAndSettle();

      await tester.dragUntilVisible(
        find.byKey(const Key("minionTypeDropdown")),
        find.byKey(const Key("filterAppBarExtension")),
        const Offset(-100, 0),
      );
      await tester.pumpAndSettle();

      await testDropdownFilter(
        tester,
        MinionType.values.cast<CardFilter>(),
        const Key("minionTypeDropdown"),
        (index, card) {
          if (card == null && index == 1) {
            expect(card, null);
          } else if (index != 0) {
            final bool multiTypeID;
            if (card?.multiTypeIds == null) {
              multiTypeID = true;
            } else {
              multiTypeID = card?.multiTypeIds?.contains(MinionType.values[index].id()) ?? false;
            }

            final isSameType = card?.minionTypeId == MinionType.values[index].id() || multiTypeID;
            expect(isSameType, true);
          }
        },
        (index, card) {
          if (index != 0) {
            final multiTypeID = card?.multiTypeIds?.contains(MinionType.values[index].id()) ?? false;
            final isSameType = card?.minionTypeId == MinionType.values[index].id() || multiTypeID;

            return card != null && card.minionTypeId != MinionType.values[index].id() || !isSameType;
          } else {
            return true;
          }
        },
      );
    });

    testWidgets("spellSchoolDropdown filter", (WidgetTester tester) async {
      await tester.pumpAndSettle();

      final Finder toggleButton = find.byKey(const Key("appBarToggle"));
      await tester.tap(toggleButton);
      await tester.pumpAndSettle();

      await tester.dragUntilVisible(
        find.byKey(const Key("spellSchoolDropdown")),
        find.byKey(const Key("filterAppBarExtension")),
        const Offset(-100, 0),
      );
      await tester.pumpAndSettle();

      await testDropdownFilter(
        tester,
        SpellSchool.values.cast<CardFilter>(),
        const Key("spellSchoolDropdown"),
        (index, card) {
          if (card == null && index == 1) {
            expect(card, null);
          } else if (index != 0) {
            expect(card?.spellSchoolId, SpellSchool.values[index].id());
          }
        },
        (index, card) {
          if (index != 0) {
            return card != null && card.spellSchoolId != SpellSchool.values[index].id();
          } else {
            return true;
          }
        },
      );
    });

    testWidgets("rarityDropdown filter", (WidgetTester tester) async {
      await tester.pumpAndSettle();

      final Finder toggleButton = find.byKey(const Key("appBarToggle"));
      await tester.tap(toggleButton);
      await tester.pumpAndSettle();

      await tester.dragUntilVisible(
        find.byKey(const Key("rarityDropdown")),
        find.byKey(const Key("filterAppBarExtension")),
        const Offset(-100, 0),
      );
      await tester.pumpAndSettle();

      await testDropdownFilter(
        tester,
        Rarity.values.cast<CardFilter>(),
        const Key("rarityDropdown"),
        (index, card) {
          if (card == null && index == 1) {
            expect(card, null);
          } else if (index != 0) {
            expect(card?.rarityId, Rarity.values[index].id());
          }
        },
        (index, card) {
          if (index != 0) {
            return card != null && card.rarityId != Rarity.values[index].id();
          } else {
            return true;
          }
        },
      );
    });

    testWidgets("keywordDropdown filter", (WidgetTester tester) async {
      await tester.pumpAndSettle();

      final Finder toggleButton = find.byKey(const Key("appBarToggle"));
      await tester.tap(toggleButton);
      await tester.pumpAndSettle();

      await tester.dragUntilVisible(
        find.byKey(const Key("keywordDropdown")),
        find.byKey(const Key("filterAppBarExtension")),
        const Offset(-100, 0),
      );
      await tester.pumpAndSettle();

      await testDropdownFilter(
        tester,
        Keyword.values.cast<CardFilter>(),
        const Key("keywordDropdown"),
        (index, card) {
          if (card == null && index == 1) {
            expect(card, null);
          } else if (Keyword.values[index] == Keyword.spellDamage) {
            // Ignore spell damage
          } else if (index != 0) {
            final containsKeyword = card?.keywordIds?.contains(Keyword.values[index].id()) ?? false;
            final textContainsKeyword = card?.text?.toLowerCase().contains(Keyword.values[index].value) ?? false;
            expect(containsKeyword || textContainsKeyword, true);
          }
        },
        (index, card) {
          if (index != 0) {
            final containsKeyword = card?.keywordIds?.contains(Keyword.values[index].id()) ?? false;
            return card != null && !containsKeyword;
          } else {
            return true;
          }
        },
      );
    });
  });
}
