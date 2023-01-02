import 'package:decksly/common/asset_loader.dart';
import 'package:decksly/common/colors.dart';
import 'package:decksly/common/fonts.dart';
import 'package:decksly/data/card_class.dart';
import 'package:decksly/data/card_set.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/class_dropdown_item.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/custom_dropdown.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/hs_dropdown_button.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/hs_rectangular_outline.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/set_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DropdownType {
  cardClass,
  cardSet,
  mana,
}

class HSDropdown extends StatelessWidget {
  HSDropdown({
    Key? key,
    required this.dropdownType,
    required this.dropdownValues,
    this.height,
    this.width,
    this.dropdownWidth,
  }) : super(key: key);

  double? height;
  double? width;
  double? dropdownWidth;
  final DropdownType dropdownType;
  final List<dynamic> dropdownValues;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100,
      width: width ?? 70,
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
                      icon: Icon(Icons.keyboard_arrow_down, size: 20.sp),
                      dropdownButton: (value) {
                        switch (dropdownType) {
                          case DropdownType.cardClass:
                            return HSDropdownButton(
                              assetImagePath: assetPath("class", "${cardClassFromIndex(int.parse(value)).name}_icon"),
                              text: cardClassFromIndex(int.parse(value)).value,
                            );
                          case DropdownType.cardSet:
                            return HSDropdownButton(
                              assetImagePath:
                                  assetPath("set", cardSetFromIndex(int.parse(value)).name, fileExtension: "svg"),
                              text: cardSetFromIndex(int.parse(value)).value,
                              hideText: true,
                            );
                          case DropdownType.mana:
                            return HSDropdownButton(
                              assetImagePath: assetPath("class", value),
                              text: value,
                            );
                        }
                      },
                      onChange: (int value, int index) => print("Value: $value, Index: $index"),
                      dropdownButtonStyle: DropdownButtonStyle(
                        mainAxisAlignment: MainAxisAlignment.start,
                        width: width,
                        padding: EdgeInsets.only(left: 0.0075.sw),
                        textStyle: FontStyles.bold15Button,
                        elevation: 1,
                        backgroundColor: Colors.transparent,
                        primaryColor: AppColors.buttonTextColor,
                      ),
                      dropdownStyle: DropdownStyle(
                        width: dropdownWidth,
                        textStyle: FontStyles.bold15,
                        dropdownBackgroundAssetPath: "assets/dropdown/dropdown_background.png",
                        borderRadius: BorderRadius.circular(8),
                        elevation: 6,
                        padding: const EdgeInsets.all(5),
                      ),
                      items: dropdownValues
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
        if (index == 5) {
          return const SetDropdownHeader(text: "STANDARD SETS");
        } else if (index == 14) {
          return const SetDropdownHeader(text: "WILD SETS");
        }
        return SetDropdownItem(
          text: CardSet.values[index].value,
          assetImagePath: assetPath("set", CardSet.values[index].name, fileExtension: "svg"),
        );
      case DropdownType.cardClass:
        return ClassDropdownItem(
          text: CardClass.values[index].value,
          assetImagePath: assetPath("class", "${CardClass.values[index].name}_icon"),
        );
      case DropdownType.mana:
        return ClassDropdownItem(
          text: CardClass.values[index].name,
          assetImagePath: '',
        );
    }
  }
}
