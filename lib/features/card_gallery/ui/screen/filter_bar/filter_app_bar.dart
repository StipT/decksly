import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/data/card_class.dart';
import 'package:decksly/data/card_set.dart';
import 'package:decksly/data/sort_by.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filter_app_bar_extension.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/mana_picker.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_appbar_overlay.dart';
import 'package:decksly/reusable_ui/button/hs_button.dart';
import 'package:decksly/reusable_ui/dropdown/hs_dropdown.dart';
import 'package:decksly/reusable_ui/text_field/hs_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterAppBar extends StatefulWidget {
  const FilterAppBar({Key? key, required this.height, this.forceCollapse}) : super(key: key);

  final double? height;
  final bool? forceCollapse;

  @override
  State<FilterAppBar> createState() => _FilterAppBarState();
}

class _FilterAppBarState extends State<FilterAppBar> with TickerProviderStateMixin {
  bool _isExtended = false;
  late double _height;

  @override
  void initState() {
    _height = widget.height ?? 80.h;
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
                    height: 80.h,
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 20.h, bottom: 8.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: HSDropdown(
                              height: 80.h,
                              width: 40.w,
                              dropdownWidth: 125.w,
                              selectedValue: state.cardFilterParams.set ?? CardSet.standard.value,
                              dropdownType: DropdownType.cardSet,
                              dropdownValues: CardSet.values.map((e) => e.value).toList(),
                              onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                                  .add(CardSetChangedEvent(cardSetFromIndex(value).value)),
                            ),
                          ),
                          HSDropdown(
                            height: 80.h,
                            width: 75.w,
                            selectedValue: state.cardFilterParams.heroClass ?? CardClass.allClasses.value,
                            dropdownType: DropdownType.cardClass,
                            dropdownValues: CardClass.values.map((e) => e.value).toList(),
                            onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                                .add(CardClassChangedEvent(cardClassFromIndex(value).value)),
                          ),
                          SizedBox(
                              width: 165.w,
                              child: ManaPicker(
                                onChange: (mana) =>
                                    BlocProvider.of<CardGalleryBloc>(context).add(ManaFilterChangedEvent(mana)),
                              )),
                          Expanded(
                              child: HSTextField(
                            onChange: (text) =>
                                BlocProvider.of<CardGalleryBloc>(context).add(SearchFilterChangedEvent(text)),
                          )),
                          HSBarToggleButton(
                            width: 30.w,
                            icon: SvgPicture.asset(
                              assetPath(SUBFOLDER_MISC, "filter", fileExtension: SVG_EXTENSION),
                              fit: BoxFit.fill,
                              color: AppColors.bistreBrown,
                            ),
                            isToggled: _isExtended,
                            activeFilters: extraFiltersActive(state),
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
                      height: _isExtended ? 50.h : 0,
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

  int extraFiltersActive(CardGalleryState state) {
    int activeFilters = 0;
    if (state.cardFilterParams.sort != null &&
        state.cardFilterParams.sort!.isNotEmpty &&
        state.cardFilterParams.sort != SortBy.manaAsc.value) {
      activeFilters++;
    }
    if (state.cardFilterParams.attack != null && state.cardFilterParams.attack!.isNotEmpty) {
      activeFilters++;
    }
    if (state.cardFilterParams.health != null && state.cardFilterParams.health!.isNotEmpty) {
      activeFilters++;
    }
    if (state.cardFilterParams.type != null && state.cardFilterParams.type!.isNotEmpty) {
      activeFilters++;
    }
    if (state.cardFilterParams.minionType != null && state.cardFilterParams.minionType!.isNotEmpty) {
      activeFilters++;
    }
    if (state.cardFilterParams.spellSchool != null && state.cardFilterParams.spellSchool!.isNotEmpty) {
      activeFilters++;
    }
    if (state.cardFilterParams.rarity != null && state.cardFilterParams.rarity!.isNotEmpty) {
      activeFilters++;
    }
    if (state.cardFilterParams.keyword != null && state.cardFilterParams.keyword!.isNotEmpty) {
      activeFilters++;
    }
    return activeFilters;
  }

  void _toggleBarExtension() async {
    if (_isExtended) {
      setState(() {
        _height = 80.h;
        _isExtended = false;
      });
    } else {
      setState(() {
        _isExtended = true;
        _height = 140.h;
      });
    }
  }
}
