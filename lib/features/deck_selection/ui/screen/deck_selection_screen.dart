import 'package:auto_route/auto_route.dart';
import 'package:decksly/app/di.dart';
import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_class.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_type.dart';
import 'package:decksly/features/deck_builder/ui/screen/deck_builder_screen.dart';
import 'package:decksly/features/deck_selection/ui/bloc/deck_selection_bloc.dart';
import 'package:decksly/features/deck_selection/ui/screen/widgets/hs_class_badge.dart';
import 'package:decksly/features/deck_selection/ui/screen/widgets/hs_mode_badge.dart';
import 'package:decksly/navigation/app_router.dart';
import 'package:decksly/presentation/resources/locale_keys.g.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_deck_selection_background.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_wood_horizontal_border.dart';
import 'package:decksly/reusable_ui/button/hs_button.dart';
import 'package:decksly/reusable_ui/text_field/hs_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckSelectionScreen extends StatefulWidget implements AutoRouteWrapper {
  const DeckSelectionScreen({super.key});

  @override
  State<DeckSelectionScreen> createState() => _DeckSelectionScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DeckSelectionBloc>(),
      child: this,
    );
  }
}

class _DeckSelectionScreenState extends State<DeckSelectionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeckSelectionBloc, DeckSelectionState>(builder: (BuildContext context, state) {
      return Scaffold(
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
            if (state.deckType == DeckType.wild)
              Positioned(
                width: 125.w,
                top: 36.h,
                left: 18.w,
                child: Image.asset(
                  assetPath(SUBFOLDER_MISC, "wild_branch_left"),
                ),
              ),
            if (state.deckType == DeckType.wild)
              Positioned(
                width: 125.w,
                top: 36.h,
                right: 18.w,
                child: Image.asset(
                  assetPath(SUBFOLDER_MISC, "wild_branch_right"),
                ),
              ),
          ],
        ),
      );
    });
  }

  Widget _getAppBar(DeckSelectionState state) {
    return Container(
      height: 35.h,
      padding: EdgeInsets.only(top: 7.5.h, bottom: 2.5.h, right: 10.w),
      width: 1.sw,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 5.w),
              child: Stack(
                children: [
                  const HSWoodHorizontalBorder(),
                  Container(
                    margin: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              child: HSTextField(
                            onChange: (change) {},
                            theme: TextFieldTheme.none,
                            hint: LocaleKeys.pasteADeckCodeHere.tr(),
                          )),
                        ),
                        Container(
                          child: HSButton(
                            width: 100.w,
                            isDisabled: false,
                            label: LocaleKeys.import.tr(),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 140.w,
            child: Stack(
              children: [
                const HSWoodHorizontalBorder(),
                Container(
                    margin: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: HSButton(
                      width: 100.w,
                      isDisabled: false,
                      label: LocaleKeys.load.tr(),
                      onTap: () {
                        context.pushRoute(const CardGalleryRoute());
                        //   CardGalleryRoute.open(context);
                      },
                      icon: Container(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.save,
                            color: AppColors.vanDykeBrown,
                            size: 20.w,
                          )),
                    )),
              ],
            ),
          ),
          Container(
            width: 140.w,
            child: Stack(
              children: [
                const HSWoodHorizontalBorder(),
                Container(
                    margin: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: HSButton(
                      width: 100.w,
                      isDisabled: false,
                      label: LocaleKeys.close.tr(),
                      onTap: () {
                        context.pushRoute(const CardGalleryRoute());
                      },
                      icon: Image.asset(assetPath(SUBFOLDER_MISC, "close")),
                    )),
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
      height: 42.5.h,
      margin: EdgeInsets.only(top: 5.h, left: 50.w, right: 50.w, bottom: 5.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Image.asset(assetPath(SUBFOLDER_MISC, "velvet_ornament_left"))),
                  HSModeBadge(
                      type: DeckType.standard,
                      isSelected: DeckType.standard == state.deckType,
                      onTap: () {
                        BlocProvider.of<DeckSelectionBloc>(context).add(const ChangeGameModeEvent(DeckType.standard));
                      }),
                  HSModeBadge(
                      type: DeckType.classic,
                      isSelected: DeckType.classic == state.deckType,
                      onTap: () {
                        BlocProvider.of<DeckSelectionBloc>(context).add(const ChangeGameModeEvent(DeckType.classic));
                      }),
                  HSModeBadge(
                      type: DeckType.wild,
                      isSelected: DeckType.wild == state.deckType,
                      onTap: () {
                        BlocProvider.of<DeckSelectionBloc>(context).add(const ChangeGameModeEvent(DeckType.wild));
                      }),
                  Container(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Image.asset(assetPath(SUBFOLDER_MISC, "velvet_ornament_right"))),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            height: 1.h,
            width: 600.w,
            child: Image.asset(
              assetPath(SUBFOLDER_MISC, "velvet_divider"),
              fit: BoxFit.fill,
              height: 1.h,
              width: 160.w,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getClassSelector(DeckSelectionState state) {
    return Container(
        width: 0.93.sw,
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: DeckClass.values
                  .map((e) => HSClassBadge(
                      classType: e,
                      modeType: state.deckType,
                      isSelected: e == state.deckClass,
                      onTap: () {
                        BlocProvider.of<DeckSelectionBloc>(context).add(SelectClassEvent(e));
                        context
                            .pushRoute(DeckBuilderRoute(deckBuilderArguments: DeckBuilderArguments(state.deckType, e)));
                        //      DeckBuilderRoute.open(context, DeckBuilderArguments(state.deckType, e));
                      }))
                  .toList()
                  .sublist(0, 6),
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: DeckClass.values
                  .map((e) => HSClassBadge(
                      classType: e,
                      modeType: state.deckType,
                      isSelected: e == state.deckClass,
                      onTap: () {
                        BlocProvider.of<DeckSelectionBloc>(context).add(SelectClassEvent(e));
                        context
                            .pushRoute(DeckBuilderRoute(deckBuilderArguments: DeckBuilderArguments(state.deckType, e)));
                        //   DeckBuilderRoute.open(context, DeckBuilderArguments(state.deckType, e));
                      }))
                  .toList()
                  .sublist(6, 11),
            )),
          ],
        ));
  }
}