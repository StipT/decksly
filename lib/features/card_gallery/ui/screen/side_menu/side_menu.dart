import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/features/card_gallery/ui/screen/side_menu/feature_item.dart';
import 'package:decksly/features/card_gallery/ui/screen/side_menu/language_button.dart';
import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:decksly/navigation/app_router.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_wood_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
    required this.onToggle,
    required this.isExtended,
    required this.inDeckBuilderMode,
  }) : super(key: key);

  final VoidCallback onToggle;
  final bool isExtended;
  final bool inDeckBuilderMode;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardGalleryBloc, CardGalleryState>(
        builder: (BuildContext context, state) {
      return SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          children: [
            if (widget.isExtended)
              GestureDetector(
                onTap: () => _toggleSideMenu(),
                behavior: HitTestBehavior.opaque,
                // full screen container to register taps anywhere and close drop down
                child: Container(
                    margin: EdgeInsets.only(top: 0.1.sh),
                    child: Container(
                      height: 0.9.sh,
                      width: 1.sw,
                      color: Colors.transparent,
                    )),
              ),
            AnimatedPositioned(
              left: widget.isExtended ? 0.w : -200.w,
              top: 40.h,
              curve: Curves.bounceOut,
              duration: const Duration(milliseconds: 500),
              child: GestureDetector(
                onHorizontalDragEnd: (dragDetails) {
                  _toggleSideMenu();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 234.w,
                  height: 172.h,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        assetPath(
                          SUBFOLDER_BACKGROUND,
                          "velvet_background_center",
                          fileExtension: JPG_EXTENSION,
                        ),
                        width: 234.w,
                        height: 182.5.h,
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        assetPath(SUBFOLDER_MISC, "side_bar_border"),
                        fit: BoxFit.fill,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 30.w,
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10.h),
                            ),
                            FeatureItem(
                                type: FeatureItemType.cardLibrary,
                                isSelected: !widget.inDeckBuilderMode,
                                onTap: () => widget.inDeckBuilderMode
                                    ? context
                                        .pushRoute(const CardGalleryRoute())
                                    : null),
                            Container(
                              child: Image.asset(
                                assetPath(SUBFOLDER_MISC, "velvet_divider"),
                                fit: BoxFit.fill,
                                height: 1.h,
                                width: 160.w,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 2.5.h),
                              child: FeatureItem(
                                type: FeatureItemType.deckBuilder,
                                isSelected: widget.inDeckBuilderMode,
                                onTap: () => widget.inDeckBuilderMode
                                    ? null
                                    : context
                                        .pushRoute(const DeckSelectionRoute()),
                              ),
                            ),
                            Container(
                              child: Image.asset(
                                assetPath(SUBFOLDER_MISC, "velvet_divider"),
                                fit: BoxFit.fill,
                                height: 1.h,
                                width: 40.w,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    LocaleKeys.language.tr(),
                                    style: FontStyles.bold22WithShadow,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: LanguageButton(
                                      isSelected:
                                          state.cardFilterParams.locale ==
                                              LanguageButtonType.english.value,
                                      type: LanguageButtonType.english,
                                      onTap: () {
                                        context.setLocale(Locale('en', 'US'));
                                        print(context.locale.toString());
                                        final params = state.cardFilterParams.copyWith(locale: context.locale.toStringWithSeparator());
                                        BlocProvider.of<CardGalleryBloc>(context).add(CardFilterParamsChangedEvent(params));

                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: LanguageButton(
                                      isSelected:
                                          state.cardFilterParams.locale ==
                                              LanguageButtonType.german.value,
                                      type: LanguageButtonType.german,
                                      onTap: () {
                                        context.setLocale(Locale('de', 'DE'));
                                        final params = state.cardFilterParams.copyWith(locale: context.locale.toStringWithSeparator());
                                        BlocProvider.of<CardGalleryBloc>(context).add(CardFilterParamsChangedEvent(params));

                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: LanguageButton(
                                      isSelected:
                                          state.cardFilterParams.locale ==
                                              LanguageButtonType.japanese.value,
                                      type: LanguageButtonType.japanese,
                                      onTap: () {
                                        context.setLocale(Locale('ja', 'JP'));
                                        print(context.locale.toString());
                                        final params = state.cardFilterParams.copyWith(locale: context.locale.toStringWithSeparator());
                                        BlocProvider.of<CardGalleryBloc>(context).add(CardFilterParamsChangedEvent(params));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 206.w,
                        top: 60.h,
                        child: Container(
                          width: 28.w,
                          height: 42.5.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const HSWoodBorder(),
                              Container(
                                padding: EdgeInsets.only(
                                  top: 1.h,
                                  bottom: 1.h,
                                  left: 2.w,
                                ),
                                child: RotationTransition(
                                  turns: _rotateAnimation,
                                  child: Image.asset(
                                    assetPath(SUBFOLDER_MISC, "arrow"),
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
    });
  }

  void _toggleSideMenu() async {
    if (widget.isExtended) {
      await _animationController.reverse();
    } else {
      _animationController.forward();
    }
    widget.onToggle();
  }
}
