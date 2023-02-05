import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/data/card_class.dart';
import 'package:decksly/data/card_set.dart';
import 'package:decksly/data/sort_by.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filter_params.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filter_app_bar_extension.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/mana_picker.dart';
import 'package:decksly/presentation/resources/locale_keys.g.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_appbar_overlay.dart';
import 'package:decksly/reusable_ui/button/hs_toggle_button.dart';
import 'package:decksly/reusable_ui/dropdown/hs_dropdown.dart';
import 'package:decksly/reusable_ui/text_field/hs_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterAppBar extends StatefulWidget {
  const FilterAppBar({Key? key, required this.height, this.forceCollapse, required this.onToggle}) : super(key: key);

  final double? height;
  final bool? forceCollapse;
  final VoidCallback onToggle;

  @override
  State<FilterAppBar> createState() => _FilterAppBarState();
}

class _FilterAppBarState extends State<FilterAppBar> with TickerProviderStateMixin {
  bool _isExtended = false;
  late double _height;

  @override
  void initState() {
    _height = widget.height ?? 40.h;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardGalleryBloc, CardGalleryState>(
      builder: (BuildContext context, state) {
        if (_isExtended == true && (widget.forceCollapse ?? false)) _toggleBarExtension();
        return AnimatedContainer(
          curve: Curves.bounceOut,
          duration: const Duration(milliseconds: 500),
          height: _height,
          width: 1.sw,
          child: Stack(
            children: [
              const HSAppBarOverlay(),
              Column(
                children: [
                  SizedBox(
                    height: 40.h,
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 10.h, bottom: 4.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: HSDropdown(
                              height: 40.h,
                              width: 80.w,
                              dropdownWidth: 250.w,
                              selectedValue: state.cardFilterParams.set ?? CardSet.standard.value,
                              dropdownType: DropdownType.cardSet,
                              dropdownValues: CardSet.values.map((e) => e.value).toList(),
                              onChange: (value) => BlocProvider.of<CardGalleryBloc>(context).add(
                                  CardFilterParamsChangedEvent(
                                      state.cardFilterParams.copyWith(set: cardSetFromIndex(value).value))),
                            ),
                          ),
                          HSDropdown(
                            height: 40.h,
                            width: 150.w,
                            selectedValue: state.cardFilterParams.heroClass ?? CardClass.allClasses.value,
                            dropdownType: DropdownType.cardClass,
                            dropdownValues: CardClass.values.map((e) => e.value).toList(),
                            onChange: (value) => BlocProvider.of<CardGalleryBloc>(context).add(
                                CardFilterParamsChangedEvent(
                                    state.cardFilterParams.copyWith(heroClass: cardClassFromIndex(value).value))),
                          ),
                          SizedBox(
                              width: 330.w,
                              child: ManaPicker(
                                onChange: (mana) => BlocProvider.of<CardGalleryBloc>(context)
                                    .add(CardFilterParamsChangedEvent(state.cardFilterParams.copyWith(manaCost: mana))),
                              )),
                          Expanded(
                              child: HSTextField(
                            hint: LocaleKeys.search.tr(),
                            isSearchTextField: true,
                            onChange: (text) => BlocProvider.of<CardGalleryBloc>(context)
                                .add(CardFilterParamsChangedEvent(state.cardFilterParams.copyWith(textFilter: text))),
                            theme: TextFieldTheme.velvet,
                          )),
                          HSBarToggleButton(
                            width: 60.w,
                            icon: SvgPicture.asset(
                              assetPath(SUBFOLDER_MISC, "filter", fileExtension: SVG_EXTENSION),
                              fit: BoxFit.fill,
                              color: AppColors.bistreBrown,
                            ),
                            isToggled: _isExtended,
                            activeFilters: extraFiltersActive(state.cardFilterParams),
                            onTap: () {
                              _toggleBarExtension();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: FilterAppBarExtension(
                      height: _isExtended ? 25.h : 0,
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
    if (cardFilterParams.sort != null &&
        cardFilterParams.sort!.isNotEmpty &&
        cardFilterParams.sort != SortBy.manaAsc.value) {
      activeFilters++;
    }
    if (cardFilterParams.attack != null && cardFilterParams.attack!.isNotEmpty) {
      activeFilters++;
    }
    if (cardFilterParams.health != null && cardFilterParams.health!.isNotEmpty) {
      activeFilters++;
    }
    if (cardFilterParams.type != null && cardFilterParams.type!.isNotEmpty) {
      activeFilters++;
    }
    if (cardFilterParams.minionType != null && cardFilterParams.minionType!.isNotEmpty) {
      activeFilters++;
    }
    if (cardFilterParams.spellSchool != null && cardFilterParams.spellSchool!.isNotEmpty) {
      activeFilters++;
    }
    if (cardFilterParams.rarity != null && cardFilterParams.rarity!.isNotEmpty) {
      activeFilters++;
    }
    if (cardFilterParams.keyword != null && cardFilterParams.keyword!.isNotEmpty) {
      activeFilters++;
    }
    return activeFilters;
  }

  void _toggleBarExtension() async {
    if (_isExtended) {
      setState(() {
        _height = 40.h;
        _isExtended = false;
      });
    } else {
      setState(() {
        _isExtended = true;
        _height = 70.h;
      });
    }
    widget.onToggle();
  }
}
