import 'package:decksly/common/asset_loader.dart';
import 'package:decksly/common/colors.dart';
import 'package:decksly/common/fonts.dart';
import 'package:decksly/data/attack.dart';
import 'package:decksly/data/card_class.dart';
import 'package:decksly/data/card_set.dart';
import 'package:decksly/data/card_type.dart';
import 'package:decksly/data/health.dart';
import 'package:decksly/data/keywords.dart';
import 'package:decksly/data/minion_type.dart';
import 'package:decksly/data/rarity.dart';
import 'package:decksly/data/sort_by.dart';
import 'package:decksly/data/spell_school.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/class_dropdown_item.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filters/set_dropdown_item.dart';
import 'package:decksly/presentation/resources/locale_keys.g.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_rectangular_outline.dart';
import 'package:decksly/reusable_ui/button/hs_dropdown_button.dart';
import 'package:decksly/reusable_ui/dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DropdownType {
  cardClass,
  cardSet,
  mana,
  sortBy,
  attack,
  health,
  cardType,
  minionType,
  spellSchool,
  rarity,
  keywords,
}

class HSDropdown extends StatelessWidget {
  HSDropdown({
    Key? key,
    required this.dropdownType,
    required this.dropdownValues,
    this.height,
    this.width,
    this.dropdownWidth,
    required this.onChange,
  }) : super(key: key);

  double? height;
  double? width;
  double? dropdownWidth;
  final DropdownType dropdownType;
  final List<dynamic> dropdownValues;
  final void Function(int) onChange;

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
                  if (_showIcon(dropdownType))
                    SizedBox(
                      height: double.infinity,
                      child: Image.asset(
                        "assets/dropdown/dropdown_button_border_left.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  if (!_showIcon(dropdownType))
                    SizedBox(
                      height: double.infinity,
                      child: Image.asset(
                        "assets/button/button_border_left.png",
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

              //
            ],
          ),

          //  const HSActiveDropdownButtonOverlay(),
          //const HSSelectedDropdownButtonOverlay(),
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
                  child: CustomDropdown<int>(
                    icon: Icon(Icons.keyboard_arrow_down, size: 20.sp),
                    dropdownButton: (value) {
                      switch (dropdownType) {
                        case DropdownType.cardClass:
                          return HSDropdownButton(
                            assetImagePath: assetPath("class", "${cardClassFromIndex(int.parse(value)).name}_icon"),
                            text: cardClassFromIndex(int.parse(value)).localized(),
                          );
                        case DropdownType.cardSet:
                          return HSDropdownButton(
                            assetImagePath:
                                assetPath("set", cardSetFromIndex(int.parse(value)).name, fileExtension: "svg"),
                            text: cardSetFromIndex(int.parse(value)).localized(),
                            hideText: true,
                          );
                        case DropdownType.mana:
                          return HSDropdownButton(
                            assetImagePath: assetPath("class", value),
                            text: value,
                          );
                        case DropdownType.sortBy:
                          return HSDropdownButton(
                            assetImagePath: "",
                            text: sortByFromIndex(int.parse(value)).localized(),
                          );
                        case DropdownType.attack:
                          return HSDropdownButton(
                            assetImagePath: assetPath("misc", "attack"),
                            text: attackFromIndex(int.parse(value)).localized(),
                          );
                        case DropdownType.health:
                          return HSDropdownButton(
                            assetImagePath: assetPath("misc", "health"),
                            text: healthFromIndex(int.parse(value)).localized(),
                          );
                        case DropdownType.cardType:
                          return HSDropdownButton(
                            assetImagePath: "",
                            text: cardTypeFromIndex(int.parse(value)).localized(),
                          );
                        case DropdownType.minionType:
                          return HSDropdownButton(
                            assetImagePath: "",
                            text: minionTypeFromIndex(int.parse(value)).localized(),
                          );
                        case DropdownType.spellSchool:
                          return HSDropdownButton(
                            assetImagePath: "",
                            text: spellSchoolFromIndex(int.parse(value)).localized(),
                          );
                        case DropdownType.rarity:
                          return HSDropdownButton(
                            assetImagePath: "",
                            text: rarityFromIndex(int.parse(value)).localized(),
                          );
                        case DropdownType.keywords:
                          return HSDropdownButton(
                            assetImagePath: "",
                            text: keywordFromIndex(int.parse(value)).localized(),
                          );
                      }
                    },
                    onChange: (int index) => onChange(index),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _showIcon(DropdownType type) {
    switch (type) {
      case DropdownType.cardSet:
      case DropdownType.cardClass:
      case DropdownType.mana:
      case DropdownType.attack:
      case DropdownType.health:
        return true;
      default:
        return false;
    }
  }

  Widget _getDropdownItem(
    int index,
    DropdownType dropdownType,
  ) {
    switch (dropdownType) {
      case DropdownType.cardSet:
        if (index == 3) {
          return SetDropdownHeader(text: LocaleKeys.standardSets.tr());
        } else if (index == 11) {
          return SetDropdownHeader(text: LocaleKeys.wildSets.tr());
        }
        return SetDropdownItem(
          text: CardSet.values[index].localized(),
          assetImagePath: assetPath("set", CardSet.values[index].name, fileExtension: "svg"),
        );
      case DropdownType.cardClass:
        return ClassDropdownItem(
          text: CardClass.values[index].localized(),
          assetImagePath: assetPath("class", "${CardClass.values[index].name}_icon"),
        );
      case DropdownType.mana:
        return ClassDropdownItem(
          text: CardClass.values[index].localized(),
          assetImagePath: "",
        );

      case DropdownType.sortBy:
        return ClassDropdownItem(
          text: SortBy.values[index].localized(),
          assetImagePath: "",
        );

      case DropdownType.attack:
        return ClassDropdownItem(
          text: Attack.values[index].localized(),
          assetImagePath: "",
        );

      case DropdownType.health:
        return ClassDropdownItem(
          text: Health.values[index].localized(),
          assetImagePath: "",
        );

      case DropdownType.cardType:
        return ClassDropdownItem(
          text: CardType.values[index].localized(),
          assetImagePath: "",
        );

      case DropdownType.minionType:
        return ClassDropdownItem(
          text: MinionType.values[index].localized(),
          assetImagePath: "",
        );

      case DropdownType.spellSchool:
        return ClassDropdownItem(
          text: SpellSchool.values[index].localized(),
          assetImagePath: "",
        );

      case DropdownType.rarity:
        return ClassDropdownItem(
          text: Rarity.values[index].localized(),
          assetImagePath: "",
        );

      case DropdownType.keywords:
        return ClassDropdownItem(
          text: Keyword.values[index].localized(),
          assetImagePath: "",
        );
    }
  }
}
