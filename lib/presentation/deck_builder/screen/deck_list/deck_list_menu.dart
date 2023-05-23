import "package:decksly/common/dev/asset_loader.dart";
import "package:decksly/common/reusable_ui/backgrounds/hs_deck_list_background.dart";
import "package:decksly/presentation/deck_builder/screen/deck_list/widgets/deck_list_body.dart";
import "package:decksly/presentation/deck_builder/screen/deck_list/widgets/deck_list_footer.dart";
import "package:decksly/presentation/deck_builder/screen/deck_list/widgets/deck_list_header.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

class DeckListMenu extends HookConsumerWidget {
  DeckListMenu({
    super.key,
    required this.width,
    required this.isFilterBarExtended,
  });

  double width;
  bool isFilterBarExtended;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      height: 0.82.sh,
      margin: EdgeInsets.only(top: 0.18.sh),
      child: AnimatedPadding(
        padding: EdgeInsets.only(top: isFilterBarExtended ? 52.5.h : 0),
        curve: Curves.bounceOut,
        duration: const Duration(milliseconds: 500),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              assetPath(kSubfolderBackground, "purple_velvet_background"),
              width: width,
              fit: BoxFit.fill,
            ),
            HSDeckListBackground(headerHeight: 70.h, footerHeight: 60.h),
            Column(
              children: [
                DeckListHeader(
                  onConvertMode: () => {},
                ),
                const DeckListBody(),
                DeckListFooter(
                  onCreateNewDeck: () => {},
                  onSave: () => {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
