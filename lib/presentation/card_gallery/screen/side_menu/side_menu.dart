import "package:auto_route/auto_route.dart";
import "package:auto_size_text/auto_size_text.dart";
import "package:decksly/common/design/fonts.dart";
import "package:decksly/common/dev/asset_loader.dart";
import "package:decksly/common/reusable_ui/backgrounds/hs_wood_border.dart";
import "package:decksly/common/util/throttler.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:decksly/navigation/app_router.dart";
import "package:decksly/presentation/card_gallery/provider/card_gallery_state.dart";
import "package:decksly/presentation/card_gallery/provider/card_gallery_state_notifier.dart";
import "package:decksly/presentation/card_gallery/screen/side_menu/feature_item.dart";
import "package:decksly/presentation/card_gallery/screen/side_menu/language_button.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class SideMenu extends ConsumerStatefulWidget {
  const SideMenu({
    super.key,
    required this.onToggle,
    required this.isExtended,
    required this.inDeckBuilderMode,
  });

  final VoidCallback onToggle;
  final bool isExtended;
  final bool inDeckBuilderMode;

  @override
  Key? get key => const Key("sideMenu");

  @override
  ConsumerState<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends ConsumerState<SideMenu> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;

  final _throttler = Throttler(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _throttler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(
      cardGalleryNotifierProvider(
        widget.inDeckBuilderMode
            ? CardGalleryNotifierInstanceType.deckBuilder
            : CardGalleryNotifierInstanceType.cardGallery,
      ),
    );

    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Stack(
        children: [
          if (widget.isExtended)
            GestureDetector(
              key: const Key("sideMenuBarrier"),
              onTap: _toggleSideMenu,
              behavior: HitTestBehavior.opaque,
              child: Container(
                margin: EdgeInsets.only(top: 0.1.sh),
                child: SizedBox(
                  height: 0.9.sh,
                  width: 1.sw,
                ),
              ),
            ),
          AnimatedPositioned(
            left: widget.isExtended ? 0.w : -200.w,
            top: 70.h,
            curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 500),
            child: GestureDetector(
              key: const Key("sideMenuGesture"),
              onTap: widget.isExtended ? null : _toggleSideMenu,
              child: Container(
                alignment: Alignment.center,
                width: 234.w,
                height: 305.h,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      assetPath(
                        kSubfolderBackground,
                        "velvet_background_center",
                        fileExtension: kJPGExtension,
                      ),
                      width: 234.w,
                      height: 319.375.h,
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      assetPath(kSubfolderMisc, "side_bar_border"),
                      fit: BoxFit.fill,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20.h,
                        bottom: 20.h,
                        left: 20.w,
                        right: 30.w,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: _featureMenu()),
                          Expanded(child: _languageMenu(state)),
                        ],
                      ),
                    ),
                    Positioned(
                      key: const Key("sideMenuArrow"),
                      left: 206.w,
                      top: 105.h,
                      child: Container(
                        width: 28.w,
                        height: 75.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const HSWoodBorder(),
                            Container(
                              padding: EdgeInsets.only(
                                top: 1.75.h,
                                bottom: 1.75.h,
                                left: 2.w,
                              ),
                              child: RotationTransition(
                                turns: _rotateAnimation,
                                child: Image.asset(
                                  assetPath(kSubfolderMisc, "arrow"),
                                  fit: BoxFit.fill,
                                  width: 15.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureMenu() {
    return Column(
      children: [
        Expanded(
          child: FeatureItem(
            key: const Key("cardLibraryFeatureItem"),
            type: FeatureItemType.cardLibrary,
            isSelected: !widget.inDeckBuilderMode,
            onTap: () => widget.inDeckBuilderMode ? _navigate(context, const CardGalleryRoute()) : null,
          ),
        ),
        Image.asset(
          assetPath(kSubfolderMisc, "velvet_divider"),
          fit: BoxFit.fill,
          height: 2.h,
          width: 160.w,
        ),
        Expanded(
          child: FeatureItem(
            key: const Key("deckBuilderFeatureItem"),
            type: FeatureItemType.deckBuilder,
            isSelected: widget.inDeckBuilderMode,
            onTap: () => widget.inDeckBuilderMode ? null : _navigate(context, const DeckSelectionRoute()),
          ),
        ),
        Image.asset(
          assetPath(kSubfolderMisc, "velvet_divider"),
          fit: BoxFit.fill,
          height: 2.h,
          width: 160.w,
        ),
      ],
    );
  }

  Widget _languageMenu(CardGalleryState state) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 35.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                LocaleKeys.language.tr(),
                style: FontStyles.bold22WithShadow(),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.75.h),
          child: Row(
            children: [
              Expanded(
                child: LanguageButton(
                  key: const Key("englishLanguageButton"),
                  isSelected: state.cardFilterParams.locale == LanguageButtonType.english.value,
                  type: LanguageButtonType.english,
                  onTap: () => _changeLocale(state, const Locale("en", "US")),
                ),
              ),
              Expanded(
                child: LanguageButton(
                  key: const Key("germanLanguageButton"),
                  isSelected: state.cardFilterParams.locale == LanguageButtonType.german.value,
                  type: LanguageButtonType.german,
                  onTap: () => _changeLocale(state, const Locale("de", "DE")),
                ),
              ),
              Expanded(
                child: LanguageButton(
                  key: const Key("japaneseLanguageButton"),
                  isSelected: state.cardFilterParams.locale == LanguageButtonType.japanese.value,
                  type: LanguageButtonType.japanese,
                  onTap: () => _changeLocale(state, const Locale("ja", "JP")),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _navigate(BuildContext context, PageRouteInfo route) {
    ref.invalidate(cardGalleryNotifierProvider(CardGalleryNotifierInstanceType.cardGallery));
    ref.invalidate(cardGalleryNotifierProvider(CardGalleryNotifierInstanceType.deckBuilder));
    _toggleSideMenu();
    context.pushRoute(route);
  }

  void _changeLocale(CardGalleryState state, Locale locale) {
    _throttler.run(() {
      context.setLocale(locale);
      final params = state.cardFilterParams.copyWith(locale: context.locale.toStringWithSeparator());
      ref.read(
            cardGalleryNotifierProvider(
              widget.inDeckBuilderMode
                  ? CardGalleryNotifierInstanceType.deckBuilder
                  : CardGalleryNotifierInstanceType.cardGallery,
            ).notifier,
          )
          .handleLocaleChanged(params);
    });
  }

  Future<void> _toggleSideMenu() async {
    if (widget.isExtended) {
      await _animationController.reverse();
    } else {
      _animationController.forward();
    }
    widget.onToggle();
  }
}
