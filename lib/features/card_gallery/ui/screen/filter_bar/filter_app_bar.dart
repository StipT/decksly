import 'package:decksly/common/colors.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/hs_button.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/hs_dropdown_button.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/hs_text_field.dart';
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
            padding: EdgeInsets.only(left: 0.01.sw, right: 0.01.sw, top: 0.04.sh, bottom: 0.02.sh),
            width: double.infinity,
            height: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // TODO deck-8 Add Class filter
                Expanded(
                  flex: 1,
                  child: HSDropdownButton(
                    title: "All Classes",
                      dropdownType: DropdownType.cardClass,
                  ),
                ),
                // TODO deck-9 Add Card Set filter
                Expanded(
                  flex: 1,
                  child: HSDropdownButton(
                    title: "",
                    dropdownType: DropdownType.cardSet,
                  ),
                ),
                // TODO deck-10 Add Mana filter

                Expanded(
                  flex: 1,
                  child: HSDropdownButton(
                    dropdownType: DropdownType.mana,
                    title: "Mana",
                  ),
                ),
                // TODO deck-11 Add Search filter
                Expanded(
                  flex: 1,
                  child: HSTextField(),
                ),
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
