import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filters/attack.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filters/card_class.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filters/card_set.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filters/card_type.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filters/health.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filters/keywords.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filters/minion_type.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filters/rarity.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filters/sort_by.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filters/spell_school.dart';
import 'package:decksly/l10n/locale_keys.g.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_active_button_overlay.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_button_overlay.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_selected_dropdown_button_overlay.dart';
import 'package:decksly/reusable_ui/backgrounds/hs_velvet_border.dart';
import 'package:decksly/reusable_ui/button/hs_dropdown_button.dart';
import 'package:decksly/reusable_ui/dropdown/custom_dropdown.dart';
import 'package:decksly/reusable_ui/dropdown/dropdown_item/class_dropdown_item.dart';
import 'package:decksly/reusable_ui/dropdown/dropdown_item/set_dropdown_item.dart';
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
    required this.selectedValue,
    required this.dropdownValues,
    this.height = 40,
    this.width = 150,
    this.dropdownWidth,
    required this.onChange,
  }) : super(key: key);

  double height;
  double width;
  double? dropdownWidth;
  final DropdownType dropdownType;
  final dynamic selectedValue;
  final List<dynamic> dropdownValues;
  final void Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      child: Stack(
        children: [
          const HSVelvetBorder(),
          HSButtonOverlay(
            isDropdownButton: _showIcon(dropdownType),
          ),
          CustomDropdown<String>(
            icon: Icon(Icons.keyboard_arrow_down, size: 20.sp),
            selectedDropdownButtonOverlay: HSSelectedDropdownButtonOverlay(isDropdownButton: _showIcon(dropdownType)),
            activeDropdownButtonOverlay: HSActiveButtonOverlay(isDropdownButton: _showIcon(dropdownType)),
            dropdownButton: (value) {
              switch (dropdownType) {
                case DropdownType.cardClass:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath: assetPath(kSubfolderClass, "${cardClassFromIndex(int.parse(value)).name}_icon"),
                    text: cardClassFromIndex(int.parse(value)).localized(),
                  );
                case DropdownType.cardSet:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath:
                        assetPath(kSubfolderSet, cardSetFromIndex(int.parse(value)).name, fileExtension: kSVGExtension),
                    text: cardSetFromIndex(int.parse(value)).localized(),
                    hideText: true,
                  );
                case DropdownType.mana:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath: assetPath(kSubfolderClass, value),
                    text: value,
                  );
                case DropdownType.sortBy:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath: kNoAsset,
                    text: sortByFromIndex(int.parse(value)).localized(),
                  );
                case DropdownType.attack:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath: assetPath(kSubfolderMisc, "attack"),
                    text: attackFromIndex(int.parse(value)).localized(),
                  );
                case DropdownType.health:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath: assetPath(kSubfolderMisc, "health"),
                    text: healthFromIndex(int.parse(value)).localized(),
                  );
                case DropdownType.cardType:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath: kNoAsset,
                    text: cardTypeFromIndex(int.parse(value)).localized(),
                  );
                case DropdownType.minionType:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath: kNoAsset,
                    text: minionTypeFromIndex(int.parse(value)).localized(),
                  );
                case DropdownType.spellSchool:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath: kNoAsset,
                    text: spellSchoolFromIndex(int.parse(value)).localized(),
                  );
                case DropdownType.rarity:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath: kNoAsset,
                    text: rarityFromIndex(int.parse(value)).localized(),
                  );
                case DropdownType.keywords:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath: kNoAsset,
                    text: keywordFromIndex(int.parse(value)).localized(),
                  );
              }
            },
            onChange: (int index) => onChange(index),
            dropdownButtonStyle: DropdownButtonStyle(
              mainAxisAlignment: MainAxisAlignment.start,
              height: height,
              width: width,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
              padding: EdgeInsets.only(left: 8.w),
              textStyle: FontStyles.bold13VanDykeBrown,
              elevation: 1.sp,
              backgroundColor: Colors.transparent,
              primaryColor: AppColors.vanDykeBrown,
            ),
            dropdownStyle: DropdownStyle(
              width: dropdownWidth,
              textStyle: FontStyles.bold11,
              dropdownBackgroundAssetPath: assetPath(
                kSubfolderDropdown,
                "dropdown_background",
              ),
              borderRadius: BorderRadius.circular(8.r),
              elevation: 6.sp,
              padding: EdgeInsets.symmetric(horizontal: 6.w),
            ),
            items: dropdownValues
                .asMap()
                .entries
                .map(
                  (item) => DropdownItem<String>(
                    value: item.value.toString(),
                    child: _getDropdownItem(item.key, dropdownType),
                  ),
                )
                .toList(),
            selectedItem: (index) {
              return DropdownItem<String>(
                value: selectedValue,
                child: _getDropdownItem(index, dropdownType, isSelected: true),
              );
            },
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
    DropdownType dropdownType, {
    bool isSelected = false,
  }) {
    switch (dropdownType) {
      case DropdownType.cardSet:
        if (index == 3) {
          return SetDropdownHeader(text: LocaleKeys.standardSets.tr());
        } else if (index == 11) {
          return SetDropdownHeader(text: LocaleKeys.wildSets.tr());
        }
        return SetDropdownItem(
          text: CardSet.values[index].localized(),
          assetImagePath: assetPath("set", CardSet.values[index].name, fileExtension: kSVGExtension),
          isSelected: isSelected,
        );
      case DropdownType.cardClass:
        return HSDropdownItem(
          text: CardClass.values[index].localized(),
          assetImagePath: assetPath("class", "${CardClass.values[index].name}_icon"),
          isSelected: isSelected,
        );
      case DropdownType.mana:
        return HSDropdownItem(
          text: CardClass.values[index].localized(),
          assetImagePath: "",
          isSelected: isSelected,
        );

      case DropdownType.sortBy:
        return HSDropdownItem(
          text: SortBy.values[index].localized(),
          assetImagePath: "",
          isSelected: isSelected,
        );

      case DropdownType.attack:
        return HSDropdownItem(
          text: Attack.values[index].localized(),
          assetImagePath: "",
          isSelected: isSelected,
        );

      case DropdownType.health:
        return HSDropdownItem(
          text: Health.values[index].localized(),
          assetImagePath: "",
          isSelected: isSelected,
        );

      case DropdownType.cardType:
        return HSDropdownItem(
          text: CardType.values[index].localized(),
          assetImagePath: "",
          isSelected: isSelected,
        );

      case DropdownType.minionType:
        return HSDropdownItem(
          text: MinionType.values[index].localized(),
          assetImagePath: "",
          isSelected: isSelected,
        );

      case DropdownType.spellSchool:
        return HSDropdownItem(
          text: SpellSchool.values[index].localized(),
          assetImagePath: "",
          isSelected: isSelected,
        );

      case DropdownType.rarity:
        return HSDropdownItem(
          text: Rarity.values[index].localized(),
          assetImagePath: "",
          isSelected: isSelected,
        );

      case DropdownType.keywords:
        return HSDropdownItem(
          text: Keyword.values[index].localized(),
          assetImagePath: "",
          isSelected: isSelected,
        );
    }
  }
}
