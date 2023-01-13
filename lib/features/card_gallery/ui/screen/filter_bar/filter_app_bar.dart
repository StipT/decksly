import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/data/card_class.dart';
import 'package:decksly/data/card_set.dart';
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
  const FilterAppBar({Key? key, required this.activeFilters}) : super(key: key);

  final int activeFilters;

  @override
  State<FilterAppBar> createState() => _FilterAppBarState();
}

class _FilterAppBarState extends State<FilterAppBar> with TickerProviderStateMixin {
  bool isExtended = false;
  double _height = 90.h;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardGalleryBloc, CardGalleryState>(
      builder: (BuildContext context, state) {
        return AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
          height: _height,
          width: 1.sw,
          child: Stack(
            children: [
              const HSAppBarOverlay(),
              Column(
                children: [
                  SizedBox(
                    height: 90.h,
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 20.h, bottom: 8.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: HSDropdown(
                              height: 90.h,
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
                            height: 90.h,
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
                            isToggled: isExtended,
                            activeFilters: widget.activeFilters,
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
                      height: isExtended ? 60.h : 0,
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

  void _toggleBarExtension() async {
    if (isExtended) {
      setState(() {
        _height = 90.h;
        isExtended = false;
      });
    } else {
      setState(() {
        isExtended = true;
        _height = 160.h;
      });
    }
  }
}
