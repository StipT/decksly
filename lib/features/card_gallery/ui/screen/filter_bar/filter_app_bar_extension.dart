import 'package:decksly/data/attack.dart';
import 'package:decksly/data/card_type.dart';
import 'package:decksly/data/health.dart';
import 'package:decksly/data/keywords.dart';
import 'package:decksly/data/minion_type.dart';
import 'package:decksly/data/rarity.dart';
import 'package:decksly/data/sort_by.dart';
import 'package:decksly/data/spell_school.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filter_params.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/reusable_ui/dropdown/hs_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterAppBarExtension extends StatelessWidget {
  const FilterAppBarExtension({Key? key, required this.height, required this.cardFilterParams}) : super(key: key);

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
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              HSDropdown(
                width: 140.w,
                height: 40.h,
                selectedValue: cardFilterParams.sort ?? SortBy.manaAsc.value,
                dropdownType: DropdownType.sortBy,
                dropdownValues: SortBy.values.map((e) => e.value).toList(),
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardFilterParamsChangedEvent(cardFilterParams.copyWith(sort: sortByFromIndex(value).value))),
              ),
              HSDropdown(
                width: 120.w,
                height: 40.h,
                selectedValue: cardFilterParams.attack ?? Attack.any.value,
                dropdownType: DropdownType.attack,
                dropdownValues: Attack.values.map((e) => e.value).toList(),
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardFilterParamsChangedEvent(cardFilterParams.copyWith(attack: attackFromIndex(value).value))),
              ),
              HSDropdown(
                width: 120.w,
                height: 40.h,
                selectedValue: cardFilterParams.health ?? Health.any.value,
                dropdownType: DropdownType.health,
                dropdownValues: Health.values.map((e) => e.value).toList(),
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardFilterParamsChangedEvent(cardFilterParams.copyWith(health: healthFromIndex(value).value))),
              ),
              HSDropdown(
                width: 140.w,
                height: 40.h,
                selectedValue: cardFilterParams.type ?? CardType.any.value,
                dropdownType: DropdownType.cardType,
                dropdownValues: CardType.values.map((e) => e.value).toList(),
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardFilterParamsChangedEvent(cardFilterParams.copyWith(type: cardTypeFromIndex(value).value))),
              ),
              HSDropdown(
                width: 140.w,
                height: 40.h,
                selectedValue: cardFilterParams.minionType ?? MinionType.any.value,
                dropdownType: DropdownType.minionType,
                dropdownValues: MinionType.values.map((e) => e.value).toList(),
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context).add(CardFilterParamsChangedEvent(
                    cardFilterParams.copyWith(minionType: minionTypeFromIndex(value).value))),
              ),
              HSDropdown(
                width: 140.w,
                height: 40.h,
                selectedValue: cardFilterParams.spellSchool ?? SpellSchool.any.value,
                dropdownType: DropdownType.spellSchool,
                dropdownValues: SpellSchool.values.map((e) => e.value).toList(),
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context).add(CardFilterParamsChangedEvent(
                    cardFilterParams.copyWith(spellSchool: spellSchoolFromIndex(value).value))),
              ),
              HSDropdown(
                width: 140.w,
                height: 40.h,
                selectedValue: cardFilterParams.rarity ?? Rarity.any.value,
                dropdownType: DropdownType.rarity,
                dropdownValues: Rarity.values.map((e) => e.value).toList(),
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardFilterParamsChangedEvent(cardFilterParams.copyWith(rarity: rarityFromIndex(value).value))),
              ),
              HSDropdown(
                width: 140.w,
                height: 40.h,
                selectedValue: cardFilterParams.keyword ?? Keyword.any.value,
                dropdownType: DropdownType.keywords,
                dropdownValues: Keyword.values.map((e) => e.value).toList(),
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context).add(
                    CardFilterParamsChangedEvent(cardFilterParams.copyWith(keyword: keywordFromIndex(value).value))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
