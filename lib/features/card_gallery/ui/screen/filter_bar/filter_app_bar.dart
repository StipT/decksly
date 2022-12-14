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
  double _height = 0.21.sh;

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
          width: double.infinity,
          child: Stack(
            children: [
              const HSAppBarOverlay(),
              Column(
                children: [
                  SizedBox(
                    height: 0.2.sh,
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.only(left: 0.01.sw, top: 0.06.sh, bottom: 0.02.sh),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: HSDropdown(
                              selectedValue: state.cardFilterParams.set ?? CardSet.standard.value,
                              dropdownType: DropdownType.cardSet,
                              dropdownValues: CardSet.values.map((e) => e.value).toList(),
                              width: 35.w,
                              dropdownWidth: 125.w,
                              onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                                  .add(CardSetChangedEvent(cardSetFromIndex(value).value)),
                            ),
                          ),
                          HSDropdown(
                            width: 0.2.sw,
                            dropdownWidth: 0.225.sw,
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
                          // TODO deck-12 Add filter Dialog
                          HSBarToggleButton(
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
                  if (isExtended)
                    Flexible(child:  FilterAppBarExtension(),),
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
        _height = 0.21.sh;
        isExtended = false;
      });
    } else {
      setState(() {
        isExtended = true;
        _height = 0.31.sh;
      });
    }
  }
}
