import 'package:decksly/data/attack.dart';
import 'package:decksly/data/card_type.dart';
import 'package:decksly/data/health.dart';
import 'package:decksly/data/keywords.dart';
import 'package:decksly/data/minion_type.dart';
import 'package:decksly/data/rarity.dart';
import 'package:decksly/data/sort_by.dart';
import 'package:decksly/data/spell_school.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/reusable_ui/dropdown/hs_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterAppBarExtension extends StatelessWidget {
  const FilterAppBarExtension({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardGalleryBloc, CardGalleryState>(builder: (context, state) {
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
                  selectedValue: state.cardFilterParams.sort ?? SortBy.manaAsc.value,
                  dropdownType: DropdownType.sortBy,
                  dropdownValues: SortBy.values.map((e) => e.value).toList(),
                  onChange: (value) =>
                      BlocProvider.of<CardGalleryBloc>(context).add(SortByChangedEvent(sortByFromIndex(value).value)),
                ),
                HSDropdown(
                  width: 120.w,
                  height: 40.h,
                  selectedValue: state.cardFilterParams.attack ?? Attack.any.value,
                  dropdownType: DropdownType.attack,
                  dropdownValues: Attack.values.map((e) => e.value).toList(),
                  onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                      .add(AttackFilterChangedEvent(attackFromIndex(value).value)),
                ),
                HSDropdown(
                  width: 120.w,
                  height: 40.h,
                  selectedValue: state.cardFilterParams.health ?? Health.any.value,
                  dropdownType: DropdownType.health,
                  dropdownValues: Health.values.map((e) => e.value).toList(),
                  onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                      .add(HealthFilterChangedEvent(healthFromIndex(value).value)),
                ),
                HSDropdown(
                  width: 140.w,
                  height: 40.h,
                  selectedValue: state.cardFilterParams.type ?? CardType.any.value,
                  dropdownType: DropdownType.cardType,
                  dropdownValues: CardType.values.map((e) => e.value).toList(),
                  onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                      .add(CardTypeFilterChangedEvent(cardTypeFromIndex(value).value)),
                ),
                HSDropdown(
                  width: 140.w,
                  height: 40.h,
                  selectedValue: state.cardFilterParams.minionType ?? MinionType.any.value,
                  dropdownType: DropdownType.minionType,
                  dropdownValues: MinionType.values.map((e) => e.value).toList(),
                  onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                      .add(MinionTypeFilterChangedEvent(minionTypeFromIndex(value).value)),
                ),
                HSDropdown(
                  width: 140.w,
                  height: 40.h,
                  selectedValue: state.cardFilterParams.spellSchool ?? SpellSchool.any.value,
                  dropdownType: DropdownType.spellSchool,
                  dropdownValues: SpellSchool.values.map((e) => e.value).toList(),
                  onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                      .add(SpellSchoolFilterChangedEvent(spellSchoolFromIndex(value).value)),
                ),
                HSDropdown(
                  width: 140.w,
                  height: 40.h,
                  selectedValue: state.cardFilterParams.rarity ?? Rarity.any.value,
                  dropdownType: DropdownType.rarity,
                  dropdownValues: Rarity.values.map((e) => e.value).toList(),
                  onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                      .add(RarityFilterChangedEvent(rarityFromIndex(value).value)),
                ),
                HSDropdown(
                  width: 140.w,
                  height: 40.h,
                  selectedValue: state.cardFilterParams.keyword ?? Keyword.any.value,
                  dropdownType: DropdownType.keywords,
                  dropdownValues: Keyword.values.map((e) => e.value).toList(),
                  onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                      .add(KeywordFilterChangedEvent(keywordFromIndex(value).value)),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
