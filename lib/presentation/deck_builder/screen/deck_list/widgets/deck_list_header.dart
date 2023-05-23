import "package:auto_size_text/auto_size_text.dart";
import "package:decksly/common/design/fonts.dart";
import "package:decksly/common/dev/asset_loader.dart";
import "package:decksly/domain/deck_builder/model/deck_class.dart";
import "package:decksly/domain/deck_builder/model/deck_type.dart";
import "package:decksly/presentation/deck_builder/provider/deck_builder_state.dart";
import "package:decksly/presentation/deck_builder/provider/deck_builder_state_notifier.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

class DeckListHeader extends HookConsumerWidget {
  const DeckListHeader({super.key, required this.onConvertMode});

  final VoidCallback onConvertMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = useState(false);
    final state = ref.watch(deckBuilderNotifierProvider);
    return GestureDetector(
      onTap: () {
        isExpanded.value = !isExpanded.value;
      },
      child: Container(
        color: Colors.green,
        width: double.infinity,
        height: 55.h,
        margin: EdgeInsets.only(left: 8.w, right: 8.w, top: 6.h),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              margin: EdgeInsets.only(left: 8.w, right: 8.w, top: 5.h, bottom: 5.h),
              child: Image.asset(
                assetPath(kSubfolderClass, _headerBackground(state.deck.heroClass), fileExtension: kJPGExtension),
                fit: BoxFit.fill,
              ),
            ),
            Image.asset(
              assetPath(kSubfolderMisc, _headerBorder(state.deck.type)),
              fit: BoxFit.fill,
            ),
            if (isExpanded.value)
              Image.asset(
                assetPath(kSubfolderMisc, _headerBorderSelected(state.deck.type)),
                fit: BoxFit.fill,
              ),
            _headerContent(state),
            Positioned(
              right: 12.5.w,
              top: 20.h,
              child: Image.asset(
                assetPath(kSubfolderMisc, "arrow"),
                fit: BoxFit.fill,
                width: 10.w,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _headerBackground(DeckClass classType) {
    switch (classType) {
      case DeckClass.deathknight:
        return "death_knight_header";
      case DeckClass.demonhunter:
        return "demon_hunter_header";
      case DeckClass.druid:
        return "druid_header";
      case DeckClass.hunter:
        return "hunter_header";
      case DeckClass.mage:
        return "mage_header";
      case DeckClass.paladin:
        return "paladin_header";
      case DeckClass.priest:
        return "priest_header";
      case DeckClass.rogue:
        return "rogue_header";
      case DeckClass.shaman:
        return "shaman_header";
      case DeckClass.warlock:
        return "warlock_header";
      case DeckClass.warrior:
        return "warrior_header";
    }
  }

  String _headerBorder(DeckType modeType) {
    switch (modeType) {
      case DeckType.standard:
      case DeckType.classic:
        return "class_header";
      case DeckType.wild:
        return "class_header_wild";
    }
  }

  String _headerBorderSelected(DeckType modeType) {
    switch (modeType) {
      case DeckType.standard:
      case DeckType.classic:
        return "class_header_selected";
      case DeckType.wild:
        return "class_header_wild_selected";
    }
  }

  Widget _headerContent(DeckBuilderState state) {
    final cardCount = state.deck.cards.isEmpty
        ? 0
        : state.deck.cards.map((e) => e.amount).reduce((value, element) => value += element);
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 14.h,
            bottom: 14.h,
            left: 15.w,
            right: 5.w,
          ),
          child: Image.asset(
            assetPath(kSubfolderMisc, "standard_badge_borderless"),
            height: 38.5.h,
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              top: 13.h,
              bottom: 13.h,
              left: 5.w,
              right: 30.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: AutoSizeText(
                    "${state.deck.type.localized()} ${state.deck.heroClass.localized()}",
                    style: FontStyles.bold11WithShadow(),
                  ),
                ),
                Flexible(
                  child: AutoSizeText(
                    "$cardCount/30",
                    style: cardCount == 30 ? FontStyles.bold13Green() : FontStyles.bold13Gold(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    minFontSize: 8,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
