import 'package:decksly/common/asset_loader.dart';
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
  const FilterAppBarExtension({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            children: [
              HSDropdown(
                width: 0.2.sw,
                dropdownType: DropdownType.sortBy,
                dropdownValues: SortBy.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(SortByChangedEvent(sortByFromIndex(value).value)),
              ),
              HSDropdown(
                width: 0.12.sw,
                dropdownType: DropdownType.attack,
                dropdownValues: Attack.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(AttackFilterChangedEvent(attackFromIndex(value).value)),
              ),
              HSDropdown(
                width: 0.12.sw,
                dropdownType: DropdownType.health,
                dropdownValues: Health.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(HealthFilterChangedEvent(healthFromIndex(value).value)),
              ),
              HSDropdown(
                width: 0.2.sw,
                dropdownType: DropdownType.cardType,
                dropdownValues: CardType.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardTypeFilterChangedEvent(cardTypeFromIndex(value).value)),
              ),
              HSDropdown(
                width: 0.2.sw,
                dropdownType: DropdownType.minionType,
                dropdownValues: MinionType.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(MinionTypeFilterChangedEvent(minionTypeFromIndex(value).value)),
              ),
              HSDropdown(
                width: 0.2.sw,
                dropdownType: DropdownType.spellSchool,
                dropdownValues: SpellSchool.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(SpellSchoolFilterChangedEvent(spellSchoolFromIndex(value).value)),
              ),
              HSDropdown(
                width: 0.2.sw,
                dropdownType: DropdownType.rarity,
                dropdownValues: Rarity.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(RarityFilterChangedEvent(rarityFromIndex(value).value)),
              ),
              HSDropdown(
                width: 0.2.sw,
                dropdownType: DropdownType.keywords,
                dropdownValues: Keyword.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(KeywordFilterChangedEvent(keywordFromIndex(value).value)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
