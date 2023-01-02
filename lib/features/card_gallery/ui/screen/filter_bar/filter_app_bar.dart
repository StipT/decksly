import 'package:decksly/common/colors.dart';
import 'package:decksly/data/card_class.dart';
import 'package:decksly/data/card_set.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/hs_button.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/hs_dropdown.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/hs_text_field.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/mana_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterAppBar extends StatelessWidget {
  const FilterAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.175.sh,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  "assets/background/velvet_background_center.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        "assets/background/velvet_background_top.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        "assets/background/velvet_background_bottom.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 0.01.sw, top: 0.04.sh, bottom: 0.02.sh),
            width: double.infinity,
            height: double.infinity,
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

                  ),
                ),
                // TODO deck-9 Add Card Set filter
                HSDropdown(
                  width: 0.2.sw,
                  dropdownWidth: 0.225.sw,
                  dropdownType: DropdownType.cardClass,
                  dropdownValues: CardClass.values,
                ),
                // TODO deck-10 Add Mana filter

                Container(width: 165.w, child: ManaPicker(onChange: (change){},)),
                // TODO deck-11 Add Search filter
                Expanded(

                    child: HSTextField()),
                // TODO deck-12 Add filter Dialog
                HSButton(
                  icon: SvgPicture.asset(
                    "assets/misc/filter.svg",
                    fit: BoxFit.fill,
                    color: AppColors.buttonIconColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
