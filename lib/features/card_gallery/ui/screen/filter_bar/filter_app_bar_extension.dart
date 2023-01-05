import 'package:decksly/data/card_class.dart';
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
            children: [
              HSDropdown(
                width: 0.15.sw,
                dropdownWidth: 0.225.sw,
                dropdownType: DropdownType.cardClass,
                dropdownValues: CardClass.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardClassChangedEvent(cardClassFromIndex(value).value)),
              ),
              HSDropdown(
                width: 0.15.sw,
                dropdownWidth: 0.225.sw,
                dropdownType: DropdownType.cardClass,
                dropdownValues: CardClass.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardClassChangedEvent(cardClassFromIndex(value).value)),
              ),
              HSDropdown(
                width: 0.15.sw,
                dropdownWidth: 0.225.sw,
                dropdownType: DropdownType.cardClass,
                dropdownValues: CardClass.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardClassChangedEvent(cardClassFromIndex(value).value)),
              ),
              HSDropdown(
                width: 0.15.sw,
                dropdownWidth: 0.225.sw,
                dropdownType: DropdownType.cardClass,
                dropdownValues: CardClass.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardClassChangedEvent(cardClassFromIndex(value).value)),
              ),
              HSDropdown(
                width: 0.15.sw,
                dropdownWidth: 0.225.sw,
                dropdownType: DropdownType.cardClass,
                dropdownValues: CardClass.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardClassChangedEvent(cardClassFromIndex(value).value)),
              ),
              HSDropdown(
                width: 0.15.sw,
                dropdownWidth: 0.225.sw,
                dropdownType: DropdownType.cardClass,
                dropdownValues: CardClass.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardClassChangedEvent(cardClassFromIndex(value).value)),
              ),
              HSDropdown(
                width: 0.15.sw,
                dropdownWidth: 0.225.sw,
                dropdownType: DropdownType.cardClass,
                dropdownValues: CardClass.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardClassChangedEvent(cardClassFromIndex(value).value)),
              ),
              HSDropdown(
                width: 0.15.sw,
                dropdownWidth: 0.225.sw,
                dropdownType: DropdownType.cardClass,
                dropdownValues: CardClass.values,
                onChange: (value) => BlocProvider.of<CardGalleryBloc>(context)
                    .add(CardClassChangedEvent(cardClassFromIndex(value).value)),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
