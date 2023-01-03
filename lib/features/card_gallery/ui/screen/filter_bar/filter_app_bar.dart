import 'package:decksly/common/colors.dart';
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
  const FilterAppBar({Key? key}) : super(key: key);

  @override
  State<FilterAppBar> createState() => _FilterAppBarState();
}

class _FilterAppBarState extends State<FilterAppBar> {
  bool isExtended = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isExtended ? 0.36.sh : 0.18.sh,
      child: Stack(
        children: [
          const HSAppBarOverlay(),
          Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: EdgeInsets.only(left: 0.01.sw, top: 0.05.sh, bottom: 0.01.sh),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // TODO deck-8 Add Class filter
                        Container(
                          child: HSDropdown(
                            dropdownType: DropdownType.cardSet,
                            dropdownValues: CardSet.values,
                            width: 35.w,
                            dropdownWidth: 125.w,
                            onChange: (value) =>
                                BlocProvider.of<CardGalleryBloc>(context).add(CardSetChangedEvent(cardSetFromIndex(value).value)),
                          ),
                        ),
                        // TODO deck-9 Add Card Set filter
                        HSDropdown(
                          width: 0.2.sw,
                          dropdownWidth: 0.225.sw,
                          dropdownType: DropdownType.cardClass,
                          dropdownValues: CardClass.values,
                          onChange: (value) => BlocProvider.of<CardGalleryBloc>(context).add(CardClassChangedEvent(cardClassFromIndex(value).value)),
                        ),
                        // TODO deck-10 Add Mana filter

                        SizedBox(
                            width: 165.w,
                            child: ManaPicker(
                              onChange: (change) {},
                            )),
                        // TODO deck-11 Add Search filter
                        const Expanded(child: HSTextField()),
                        // TODO deck-12 Add filter Dialog
                        HSButton(
                          icon: SvgPicture.asset(
                            "assets/misc/filter.svg",
                            fit: BoxFit.fill,
                            color: AppColors.buttonIconColor,
                          ),
                          onTap: () {
                            setState(() {
                              isExtended = !isExtended;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (isExtended) const FilterAppBarExtension(),
            ],
          ),
        ],
      ),
    );
  }
}
