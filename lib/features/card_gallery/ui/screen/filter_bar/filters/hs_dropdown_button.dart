import 'package:decksly/common/asset_loader.dart';
import 'package:decksly/common/colors.dart';
import 'package:decksly/common/fonts.dart';
import 'package:decksly/data/card_class.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/class_dropdown_item.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/custom_dropdown.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/hs_rectangular_outline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DropdownType {
  cardClass,
  cardSet,
  mana,
}

class HSDropdownButton extends StatelessWidget {
  HSDropdownButton({
    Key? key,
    required this.dropdownType,
    required this.title,
  }) : super(key: key);

  final DropdownType dropdownType;
  final String title;
  Widget? icon;
  List<String> dropdownValues = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 70,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 0.001.sh),
      child: Stack(
        children: [
          const HSRectangularOutline(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    child: Image.asset(
                      "assets/dropdown/dropdown_button_border_left.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/button/button_border_center.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: double.infinity,
                child: Image.asset(
                  "assets/button/button_border_right.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              right: 5.w,
              top: 10.h,
              bottom: 10.h,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    child: CustomDropdown<int>(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      child: Container(
                        color: Colors.orange,
                        child: Text(
                          'All Classes',
                        ),
                      ),
                      onChange: (int value, int index) => print("Value: $value, Index: $index"),
                      dropdownButtonStyle: DropdownButtonStyle(
                        mainAxisAlignment: MainAxisAlignment.start,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 0.0075.sw),
                        textStyle: FontStyles.bold17Button,
                        elevation: 1,
                        backgroundColor: Colors.transparent,
                        primaryColor: AppColors.buttonTextColor,
                      ),
                      dropdownStyle: DropdownStyle(
                        textStyle: FontStyles.bold15,
                        dropdownBackgroundAssetPath: "assets/dropdown/dropdown_background.png",
                        borderRadius: BorderRadius.circular(8),
                        elevation: 6,
                        padding: const EdgeInsets.all(5),
                      ),
                      items: CardClass.values
                          .asMap()
                          .entries
                          .map(
                            (item) => DropdownItem<int>(
                              value: item.key + 1,
                              child: _getDropdownItem(item.key, dropdownType),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getDropdownItem(
    int index,
    DropdownType dropdownType,
  ) {
    switch (dropdownType) {
      case DropdownType.cardSet:
        return ClassDropdownItem(
          className: CardClass.values[index].value,
          assetImagePath: assetPath("class", "${CardClass.values[index].name}_icon"),
        );
      case DropdownType.cardClass:
        return ClassDropdownItem(
          className: CardClass.values[index].value,
          assetImagePath: assetPath("class", "${CardClass.values[index].name}_icon"),
        );
      case DropdownType.mana:
        return ClassDropdownItem(
          className: CardClass.values[index].name,
          assetImagePath: '',
        );
    }
  }

  Widget? _getIcon(DropdownType dropdownType) {
    if (icon != null) {
      return icon;
    } else {
      switch (dropdownType) {
        case DropdownType.cardSet:
          return Image.asset(assetPath("class", "all_icon"));
        case DropdownType.cardClass:
          return Image.asset(assetPath("class", "all_icon"));
        case DropdownType.mana:
          return Image.asset(assetPath("misc", "mana_inactive"));
      }
    }
  }
}
