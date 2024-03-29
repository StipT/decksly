import "package:decksly/common/dev/asset_loader.dart";
import "package:decksly/domain/card_gallery/model/card_filters/card_class.dart";
import "package:decksly/domain/deck_builder/model/deck_class.dart";
import "package:decksly/presentation/card_gallery/provider/card_gallery_state_notifier.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class ClassFilter extends ConsumerWidget {
  const ClassFilter({
    super.key,
    this.height = 40,
    this.width = 150,
    required this.deckClass,
    required this.onToggleClassFilter,
    required this.onToggleNeutralFilter,
  });

  final double height;
  final double width;
  final DeckClass deckClass;
  final VoidCallback onToggleClassFilter;
  final VoidCallback onToggleNeutralFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cardGalleryNotifierProvider(CardGalleryNotifierInstanceType.deckBuilder));

    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.asset(
            assetPath(kSubfolderMisc, "class_filter"),
            fit: BoxFit.fill,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: GestureDetector(
                  key: const Key("classFilterButton"),
                  onTap: onToggleClassFilter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: 8.75.h,
                            bottom: 8.75.h,
                          ),
                          child: Image.asset(
                            assetPath(kSubfolderClass, _getClassIcon(deckClass)),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        if (state.cardFilterParams.heroClass.contains(deckClass.name))
                          Image.asset(
                            assetPath(kSubfolderMisc, "class_filter_selected"),
                            fit: BoxFit.fitHeight,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  key: const Key("neutralClassFilterButton"),
                  onTap: onToggleNeutralFilter,
                  child: Padding(
                    padding: EdgeInsets.only(right: 3.w),
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: 8.75.h,
                            bottom: 8.75.h,
                          ),
                          child: Image.asset(
                            assetPath(kSubfolderClass, "neutral_icon"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        if (state.cardFilterParams.heroClass.contains(CardClass.neutral.value))
                          Image.asset(
                            assetPath(kSubfolderMisc, "class_filter_selected"),
                            fit: BoxFit.fitHeight,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getClassIcon(DeckClass deckClass) {
    switch (deckClass) {
      case DeckClass.deathknight:
        return "deathknight_icon";
      case DeckClass.demonhunter:
        return "demonhunter_icon";
      case DeckClass.druid:
        return "druid_icon";
      case DeckClass.hunter:
        return "hunter_icon";
      case DeckClass.mage:
        return "mage_icon";
      case DeckClass.paladin:
        return "paladin_icon";
      case DeckClass.priest:
        return "priest_icon";
      case DeckClass.rogue:
        return "rogue_icon";
      case DeckClass.shaman:
        return "shaman_icon";
      case DeckClass.warlock:
        return "warlock_icon";
      case DeckClass.warrior:
        return "warrior_icon";
    }
  }
}
