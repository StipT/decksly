import "package:decksly/common/reusable_ui/backgrounds/hs_appbar_overlay.dart";
import "package:decksly/common/reusable_ui/button/hs_toggle_button.dart";
import "package:decksly/common/reusable_ui/dropdown/hs_dropdown.dart";
import "package:decksly/common/reusable_ui/text_field/hs_text_field.dart";
import "package:decksly/common/util/debouncer.dart";
import "package:decksly/features/card_gallery/domain/model/card_filter_params/card_filter_params.dart";
import "package:decksly/features/card_gallery/domain/model/card_filters/card_class.dart";
import "package:decksly/features/card_gallery/domain/model/card_filters/card_set.dart";
import "package:decksly/features/card_gallery/domain/model/card_filters/sort_by.dart";
import "package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart";
import "package:decksly/features/card_gallery/ui/screen/filter_bar/filter_app_bar_extension.dart";
import "package:decksly/features/card_gallery/ui/screen/filter_bar/filters/class_filter.dart";
import "package:decksly/features/card_gallery/ui/screen/filter_bar/filters/mana_picker.dart";
import "package:decksly/features/deck_builder/domain/model/deck_class.dart";
import "package:decksly/features/deck_builder/domain/model/deck_type.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class FilterAppBar extends StatefulWidget {
  const FilterAppBar({
    super.key,
    required this.isExtended,
    required this.onToggle,
    this.deckClass,
    this.deckType,
  });

  final bool isExtended;
  final DeckClass? deckClass;
  final DeckType? deckType;
  final VoidCallback onToggle;

  @override
  State<FilterAppBar> createState() => _FilterAppBarState();
}

class _FilterAppBarState extends State<FilterAppBar> with TickerProviderStateMixin {
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardGalleryBloc, CardGalleryState>(
      builder: (BuildContext context, state) {
        return AnimatedContainer(
          curve: Curves.bounceOut,
          duration: const Duration(milliseconds: 500),
          height: widget.isExtended ? 122.5.h : 70.h,
          width: 1.sw,
          child: Stack(
            fit: StackFit.expand,
            children: [
              const HSAppBarOverlay(),
              Column(
                children: [
                  SizedBox(
                    height: 70.h,
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 13.125.h, bottom: 4.375.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _classFilter(widget.deckClass, state),
                          Container(
                            padding: EdgeInsets.only(top: 4.375.h, bottom: 2.625.h),
                            child: HSDropdown(
                              height: 70.h,
                              width: 95.w,
                              dropdownWidth: 250.w,
                              selectedValue: state.cardFilterParams.set,
                              dropdownType: _setDropDownType(widget.deckType),
                              dropdownValues: _setDropDownValues(widget.deckType),
                              onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                                  .add(CardFilterParamsChangedEvent(state.cardFilterParams.copyWith(set: value))),
                            ),
                          ),
                          SizedBox(
                            width: 330.w,
                            height: 40.h,
                            child: ManaPicker(
                              onChange: (mana) => BlocProvider.of<CardGalleryBloc>(context).add(
                                CardFilterParamsChangedEvent(
                                  state.cardFilterParams.copyWith(manaCost: mana),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 4.375.h, bottom: 2.625.h),
                              child: HSTextField(
                                hint: LocaleKeys.search.tr(),
                                suffix: TextFieldSuffix.search,
                                onSubmitted: (_) {},
                                onChange: (text) => _debouncer.run(() {
                                  BlocProvider.of<CardGalleryBloc>(context).add(
                                    CardFilterParamsChangedEvent(
                                      state.cardFilterParams.copyWith(textFilter: text),
                                    ),
                                  );
                                }),
                                theme: TextFieldTheme.velvet,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 4.375.h, bottom: 2.625.h),
                            child: HSBarToggleButton(
                              width: 70.w,
                              isToggled: widget.isExtended,
                              activeFilters: extraFiltersActive(state.cardFilterParams),
                              onTap: () {
                                _toggleBarExtension();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: FilterAppBarExtension(
                      height: widget.isExtended ? 43.75.h : 0,
                      cardFilterParams: state.cardFilterParams,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  int extraFiltersActive(CardFilterParams cardFilterParams) {
    int activeFilters = 0;
    if (cardFilterParams.sort.isNotEmpty && cardFilterParams.sort != SortBy.manaAsc.value) {
      activeFilters++;
    }
    if (cardFilterParams.attack.isNotEmpty) {
      activeFilters++;
    }
    if (cardFilterParams.health.isNotEmpty) {
      activeFilters++;
    }
    if (cardFilterParams.type.isNotEmpty) {
      activeFilters++;
    }
    if (cardFilterParams.minionType.isNotEmpty) {
      activeFilters++;
    }
    if (cardFilterParams.spellSchool.isNotEmpty) {
      activeFilters++;
    }
    if (cardFilterParams.rarity.isNotEmpty) {
      activeFilters++;
    }
    if (cardFilterParams.keyword.isNotEmpty) {
      activeFilters++;
    }
    return activeFilters;
  }

  Future<void> _toggleBarExtension() async {
    widget.onToggle();
  }

  Widget _classFilter(DeckClass? deckClass, CardGalleryState state) {
    return deckClass != null
        ? ClassFilter(
            onToggleClassFilter: () {
              BlocProvider.of<CardGalleryBloc>(context).add(ToggleClassCardsEvent(deckClass));
            },
            onToggleNeutralFilter: () {
              BlocProvider.of<CardGalleryBloc>(context).add(ToggleNeutralCardsEvent(deckClass));
            },
            deckClass: deckClass,
            height: 105.h,
            width: 110.w,
          )
        : Container(
            padding: EdgeInsets.only(top: 4.375.h, bottom: 2.625.h),
            child: HSDropdown(
              height: 70.h,
              width: 150.w,
              dropdownWidth: 175.w,
              selectedValue: state.cardFilterParams.heroClass.toString(),
              dropdownType: DropdownType.cardClass,
              dropdownValues: CardClass.values,
              onChange: (value) => BlocProvider.of<CardGalleryBloc>(context).add(
                CardFilterParamsChangedEvent(
                  state.cardFilterParams.copyWith(heroClass: [value]),
                ),
              ),
            ),
          );
  }

  List<CardSet> _setDropDownValues(DeckType? deckType) {
    switch (deckType) {
      case DeckType.standard:
        return getCardSets(subCollection: SubCollection.standardSets);
      case DeckType.classic:
        return getCardSets(subCollection: SubCollection.classicSets);
      case DeckType.wild:
        return getCardSets(subCollection: SubCollection.wildSets);
      default:
        return getCardSets();
    }
  }

  DropdownType _setDropDownType(DeckType? deckType) {
    switch (deckType) {
      case DeckType.standard:
        return DropdownType.cardSetStandard;
      case DeckType.classic:
        return DropdownType.cardSetClassic;
      case DeckType.wild:
        return DropdownType.cardSetWild;
      default:
        return DropdownType.cardSet;
    }
  }
}
