import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/common/reusable_ui/backgrounds/hs_active_button_overlay.dart';
import 'package:decksly/common/reusable_ui/backgrounds/hs_button_overlay.dart';
import 'package:decksly/common/reusable_ui/backgrounds/hs_selected_dropdown_button_overlay.dart';
import 'package:decksly/common/reusable_ui/backgrounds/hs_velvet_border.dart';
import 'package:decksly/common/reusable_ui/button/hs_dropdown_button.dart';
import 'package:decksly/common/reusable_ui/dropdown/custom_dropdown.dart';
import 'package:decksly/common/reusable_ui/dropdown/dropdown_item/hs_dropdown_item.dart';
import 'package:decksly/common/reusable_ui/dropdown/dropdown_item/set_dropdown_item.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filters/card_filter_interface/card_filter_interface.dart';
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
  final String selectedValue;
  final List<CardFilter> dropdownValues;
  final void Function(String) onChange;

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
          CustomDropdown<CardFilter>(
            icon: Icon(Icons.keyboard_arrow_down, size: 20.sp),
            selectedDropdownButtonOverlay: HSSelectedDropdownButtonOverlay(isDropdownButton: _showIcon(dropdownType)),
            activeDropdownButtonOverlay: HSActiveButtonOverlay(isDropdownButton: _showIcon(dropdownType)),
            dropdownButton: (filter) {
              switch (dropdownType) {
                case DropdownType.cardClass:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath:
                        assetPath(kSubfolderClass, filter.value.isEmpty ? "allClasses_icon" : "${filter.value}_icon"),
                    text: filter.localized(),
                  );
                case DropdownType.cardSet:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath: assetPath(kSubfolderSet, filter.toString().split(".")[1], fileExtension: kSVGExtension),
                    text: filter.localized(),
                    hideText: true,
                  );
                case DropdownType.attack:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath: assetPath(kSubfolderMisc, "attack"),
                    text: filter.localized(),
                  );
                case DropdownType.health:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath: assetPath(kSubfolderMisc, "health"),
                    text: filter.localized(),
                  );
                default:
                  return HSDropdownButton(
                    height: height,
                    assetImagePath: kNoAsset,
                    text: filter.localized(),
                  );

              }
            },
            onChange: (CardFilter filter) => onChange(filter.value),
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
                  (item) => DropdownItem<CardFilter>(
                    value: item.value,
                    child: _getDropdownItem(item.value, dropdownType),
                  ),
                )
                .toList(),
            selectedItem: (cardFilter) {
              print("SELECTED ITEM ${cardFilter.value}");
              return DropdownItem<CardFilter>(
                value: cardFilter,
                child: _getDropdownItem(cardFilter, dropdownType, isSelected: true),
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
    CardFilter filter,
    DropdownType dropdownType, {
    bool isSelected = false,
  }) {
    switch (dropdownType) {
      case DropdownType.cardSet:
        return SetDropdownItem(
          cardFilter: filter,
          isSelected: isSelected,
        );
      case DropdownType.cardClass:
        return HSDropdownItem(
          text: filter.localized(),
          assetImagePath: assetPath(kSubfolderClass, filter.value.isEmpty ? "allClasses_icon" : "${filter.value}_icon"),
          isSelected: isSelected,
        );

      default:
        return HSDropdownItem(
          text: filter.localized(),
          isSelected: isSelected,
        );
    }
  }
}
