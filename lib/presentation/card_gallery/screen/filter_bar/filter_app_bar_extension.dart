import "package:decksly/common/reusable_ui/dropdown/hs_dropdown.dart";
import "package:decksly/domain/card_gallery/model/card_filter_params/card_filter_params.dart";
import "package:decksly/domain/card_gallery/model/card_filters/attack.dart";
import "package:decksly/domain/card_gallery/model/card_filters/card_type.dart";
import "package:decksly/domain/card_gallery/model/card_filters/health.dart";
import "package:decksly/domain/card_gallery/model/card_filters/keywords.dart";
import "package:decksly/domain/card_gallery/model/card_filters/minion_type.dart";
import "package:decksly/domain/card_gallery/model/card_filters/rarity.dart";
import "package:decksly/domain/card_gallery/model/card_filters/sort_by.dart";
import "package:decksly/domain/card_gallery/model/card_filters/spell_school.dart";
import "package:decksly/presentation/card_gallery/bloc/card_gallery_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class FilterAppBarExtension extends StatelessWidget {
  const FilterAppBarExtension({super.key, required this.height, required this.cardFilterParams});

  final double height;
  final CardFilterParams cardFilterParams;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: double.infinity,
      child: Stack(
        children: [
          ListView(
            key: const Key("filterAppBarExtension"),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              HSDropdown(
                key: const Key("sortByDropdown"),
                width: 140.w,
                height: 70.h,
                selectedValue: cardFilterParams.sort,
                dropdownType: DropdownType.sortBy,
                dropdownValues: SortBy.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardFilterParamsChangedEvent(cardFilterParams.copyWith(sort: value))),
              ),
              HSDropdown(
                key: const Key("attackDropdown"),
                width: 120.w,
                height: 70.h,
                selectedValue: cardFilterParams.attack,
                dropdownType: DropdownType.attack,
                dropdownValues: Attack.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardFilterParamsChangedEvent(cardFilterParams.copyWith(attack: value))),
              ),
              HSDropdown(
                key: const Key("healthDropdown"),
                width: 120.w,
                height: 70.h,
                selectedValue: cardFilterParams.health,
                dropdownType: DropdownType.health,
                dropdownValues: Health.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardFilterParamsChangedEvent(cardFilterParams.copyWith(health: value))),
              ),
              HSDropdown(
                key: const Key("typeDropdown"),
                width: 140.w,
                height: 70.h,
                selectedValue: cardFilterParams.type,
                dropdownType: DropdownType.cardType,
                dropdownValues: CardType.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardFilterParamsChangedEvent(cardFilterParams.copyWith(type: value))),
              ),
              HSDropdown(
                key: const Key("minionTypeDropdown"),
                width: 140.w,
                height: 70.h,
                selectedValue: cardFilterParams.minionType,
                dropdownType: DropdownType.minionType,
                dropdownValues: MinionType.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardFilterParamsChangedEvent(cardFilterParams.copyWith(minionType: value))),
              ),
              HSDropdown(
                key: const Key("spellSchoolDropdown"),
                width: 140.w,
                height: 70.h,
                selectedValue: cardFilterParams.spellSchool,
                dropdownType: DropdownType.spellSchool,
                dropdownValues: SpellSchool.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardFilterParamsChangedEvent(cardFilterParams.copyWith(spellSchool: value))),
              ),
              HSDropdown(
                key: const Key("rarityDropdown"),
                width: 140.w,
                height: 70.h,
                selectedValue: cardFilterParams.rarity,
                dropdownType: DropdownType.rarity,
                dropdownValues: Rarity.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardFilterParamsChangedEvent(cardFilterParams.copyWith(rarity: value))),
              ),
              HSDropdown(
                key: const Key("keywordDropdown"),
                width: 140.w,
                height: 70.h,
                selectedValue: cardFilterParams.keyword,
                dropdownType: DropdownType.keywords,
                dropdownValues: Keyword.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardFilterParamsChangedEvent(cardFilterParams.copyWith(keyword: value))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
