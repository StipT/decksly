import "package:auto_route/auto_route.dart";
import "package:decksly/common/dev/asset_loader.dart";
import "package:decksly/common/reusable_ui/backgrounds/hs_deck_selection_background.dart";
import "package:decksly/common/reusable_ui/backgrounds/hs_wood_horizontal_border.dart";
import "package:decksly/common/reusable_ui/button/hs_button.dart";
import "package:decksly/common/reusable_ui/misc/snackbar.dart";
import "package:decksly/common/reusable_ui/text_field/hs_text_field.dart";
import "package:decksly/domain/deck_builder/model/deck.dart";
import "package:decksly/domain/deck_builder/model/deck_class.dart";
import "package:decksly/domain/deck_builder/model/deck_type.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:decksly/navigation/app_router.dart";
import "package:decksly/presentation/card_gallery/provider/card_gallery_state_notifier.dart";
import "package:decksly/presentation/deck_builder/provider/deck_builder_state_notifier.dart";
import "package:decksly/presentation/deck_selection/provider/deck_selection_state.dart";
import "package:decksly/presentation/deck_selection/provider/deck_selection_state_notifier.dart";
import "package:decksly/presentation/deck_selection/screen/widgets/hs_class_badge.dart";
import "package:decksly/presentation/deck_selection/screen/widgets/hs_mode_badge.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class DeckSelectionScreen extends ConsumerStatefulWidget {
  const DeckSelectionScreen({super.key});

  @override
  ConsumerState<DeckSelectionScreen> createState() => _DeckSelectionScreenState();
}

class _DeckSelectionScreenState extends ConsumerState<DeckSelectionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(deckSelectionNotifierProvider);
    ref.listen(deckSelectionNotifierProvider, (previous, next) => listenForDeckImport(context, next as DeckSelectionState?));

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const HSDeckSelectionBackground(),
            Column(
              children: [
                _getAppBar(state),
                _getModeSelector(state),
                Expanded(child: _getClassSelector(state)),
              ],
            ),
            Positioned(
              width: 125.w,
              top: 63.h,
              left: 18.w,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: state.deck.type == DeckType.wild ? 1 : 0,
                child: Image.asset(
                  assetPath(kSubfolderMisc, "wild_branch_left"),
                ),
              ),
            ),
            Positioned(
              width: 125.w,
              top: 63.h,
              right: 18.w,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: state.deck.type == DeckType.wild ? 1 : 0,
                child: Image.asset(
                  assetPath(kSubfolderMisc, "wild_branch_right"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getAppBar(DeckSelectionState state) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.only(top: 13.125.h, bottom: 4.375.h, right: 10.w),
      width: 1.sw,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 5.w),
              child: Stack(
                children: [
                  Container(margin: EdgeInsets.symmetric(vertical: 2.h), child: const HSWoodHorizontalBorder()),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: HSTextField(
                            key: const Key("deckCodeInput"),
                            onChange: (text) =>
                                ref.read(deckSelectionNotifierProvider.notifier).handleChangeDeckCodeEvent(text),
                            onSubmitted: (_) => ref
                                .read(deckSelectionNotifierProvider.notifier)
                                .handleImportDeck(context.locale.toStringWithSeparator()),
                            suffix: TextFieldSuffix.paste,
                            theme: TextFieldTheme.none,
                            hint: LocaleKeys.pasteADeckCodeHere.tr(),
                          ),
                        ),
                        Expanded(
                          child: HSButton(
                            key: const Key("importDeckCodeButton"),
                            isDisabled: state.deck.code.isEmpty,
                            label: LocaleKeys.import.tr(),
                            onTap: () => ref
                                .read(deckSelectionNotifierProvider.notifier)
                                .handleImportDeck(context.locale.toStringWithSeparator()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 160.w,
            child: Stack(
              children: [
                Container(margin: EdgeInsets.symmetric(vertical: 2.h), child: const HSWoodHorizontalBorder()),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  child: HSButton(
                    key: const Key("deckSelectionCloseButton"),
                    isDisabled: false,
                    label: LocaleKeys.close.tr(),
                    onTap: () {
                      context.navigateBack();
                    },
                    icon: Image.asset(assetPath(kSubfolderMisc, "close")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getModeSelector(DeckSelectionState state) {
    return Container(
      width: 1.sw,
      height: 74.375.h,
      margin: EdgeInsets.only(top: 8.75.h, left: 50.w, right: 50.w, bottom: 8.75.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Image.asset(
                    assetPath(kSubfolderMisc, "velvet_ornament_left"),
                  ),
                ),
                HSModeBadge(
                  key: const Key("modeBadge_standard"),
                  type: DeckType.standard,
                  isSelected: DeckType.standard == state.deck.type,
                  onTap: () =>
                      ref.read(deckSelectionNotifierProvider.notifier).handleChangeGameModeEvent(DeckType.standard),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: HSModeBadge(
                    key: const Key("modeBadge_classic"),
                    type: DeckType.classic,
                    isSelected: DeckType.classic == state.deck.type,
                    onTap: () =>
                        ref.read(deckSelectionNotifierProvider.notifier).handleChangeGameModeEvent(DeckType.classic),
                  ),
                ),
                HSModeBadge(
                  key: const Key("modeBadge_wild"),
                  type: DeckType.wild,
                  isSelected: DeckType.wild == state.deck.type,
                  onTap: () =>
                      ref.read(deckSelectionNotifierProvider.notifier).handleChangeGameModeEvent(DeckType.wild),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Image.asset(
                    assetPath(kSubfolderMisc, "velvet_ornament_right"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.75.h),
            height: 1.75.h,
            width: 600.w,
            child: Image.asset(
              assetPath(kSubfolderMisc, "velvet_divider"),
              fit: BoxFit.fill,
              height: 1.75.h,
              width: 160.w,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getClassSelector(DeckSelectionState state) {
    return SizedBox(
      width: 0.93.sw,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: DeckClass.values
                  .map(
                    (e) => HSClassBadge(
                      key: Key("classBadge_${e.name}"),
                      classType: e,
                      modeType: state.deck.type,
                      isSelected: e == state.deck.heroClass,
                      onTap: () {
                        ref.read(deckSelectionNotifierProvider.notifier).handleSelectClassEvent(e);
                        ref.invalidate(deckBuilderNotifierProvider);
                        ref.invalidate(cardGalleryNotifierProvider(CardGalleryNotifierInstanceType.deckBuilder));
                        context.navigateTo(
                          DeckBuilderRoute(
                            deck: Deck(type: state.deck.type, heroClass: e),
                          ),
                        );
                      },
                    ),
                  )
                  .toList()
                  .sublist(0, 6),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: DeckClass.values
                  .map(
                    (e) => HSClassBadge(
                      key: Key("classBadge_${e.name}"),
                      classType: e,
                      modeType: state.deck.type,
                      isSelected: e == state.deck.heroClass,
                      onTap: () {
                        ref.read(deckSelectionNotifierProvider.notifier).handleSelectClassEvent(e);
                        ref.invalidate(deckBuilderNotifierProvider);
                        ref.invalidate(cardGalleryNotifierProvider(CardGalleryNotifierInstanceType.deckBuilder));
                        context.navigateTo(
                          DeckBuilderRoute(
                            deck: Deck(type: state.deck.type, heroClass: e),
                          ),
                        );
                      },
                    ),
                  )
                  .toList()
                  .sublist(6, 11),
            ),
          ),
        ],
      ),
    );
  }

  void listenForDeckImport(BuildContext context, DeckSelectionState? state) {
    state?.whenOrNull(
      deckImported: (deck) => context.navigateTo(DeckBuilderRoute(deck: deck)),
      failure: (deck, failure) =>
          HSSnackBar.show(context, HSSnackBarType.alert, LocaleKeys.thereWasAnErrorReadingTheDeckCode.tr()),
    );
  }
}
