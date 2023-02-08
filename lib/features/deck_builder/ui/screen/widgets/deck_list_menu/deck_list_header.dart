import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_class.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_type.dart';
import 'package:decksly/features/deck_builder/ui/bloc/deck_builder_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckListHeader extends StatefulWidget {
  const DeckListHeader({Key? key, required this.onConvertMode}) : super(key: key);

  final VoidCallback onConvertMode;

  @override
  State<DeckListHeader> createState() => _DeckListHeaderState();
}

class _DeckListHeaderState extends State<DeckListHeader> with TickerProviderStateMixin {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeckBuilderBloc, DeckBuilderState>(
      builder: (BuildContext context, state) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            width: 232.w,
            height: 34.h,
            margin: EdgeInsets.only(left: 8.w, right: 8.w, top: 6.h),
            child: Stack(
              children: [
                Image.asset(
                  assetPath(SUBFOLDER_CLASS, _headerBackground(state.deck.classType), fileExtension: JPG_EXTENSION),
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  assetPath(SUBFOLDER_MISC, _headerBorder(state.deck.modeType)),
                  fit: BoxFit.fill,
                ),
                if (isExpanded) Image.asset(assetPath(SUBFOLDER_MISC, _headerBorderSelected(state.deck.modeType))),
                _headerContent(),
                Positioned(
                  right: 12.5.w,
                  top: 12.5.h,
                  child: Image.asset(
                    assetPath(SUBFOLDER_MISC, "arrow"),
                    fit: BoxFit.fill,
                    width: 10.w,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _headerBackground(DeckClass classType) {
    switch (classType) {
      case DeckClass.deathKnight:
        return "death_knight_header";
      case DeckClass.demonHunter:
        return "demon_hunter_header";
      case DeckClass.druid:
        return "druid_header";
      case DeckClass.hunter:
        return "hunter_header";
      case DeckClass.mage:
        return "mage_header";
      case DeckClass.paladin:
        return "paladin_header";
      case DeckClass.priest:
        return "priest_header";
      case DeckClass.rogue:
        return "rogue_header";
      case DeckClass.shaman:
        return "shaman_header";
      case DeckClass.warlock:
        return "warlock_header";
      case DeckClass.warrior:
        return "warrior_header";
    }
  }

  String _headerBorder(DeckType modeType) {
    switch (modeType) {
      case DeckType.standard:
      case DeckType.classic:
        return "class_header";
      case DeckType.wild:
        return "class_header_wild";
    }
  }

  String _headerBorderSelected(DeckType modeType) {
    switch (modeType) {
      case DeckType.standard:
      case DeckType.classic:
        return "class_header_selected";
      case DeckType.wild:
        return "class_header_wild_selected";
    }
  }

  _headerContent() {
    return Container(
        child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 8.h,
            bottom: 8.h,
            left: 15.w,
            right: 5.w,
          ),
          child: Image.asset(
            assetPath(SUBFOLDER_MISC, "standard_badge_borderless"),
            height: 22.h,
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              top: 7.5.h,
              bottom: 7.5.h,
              left: 5.w,
              right: 30.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    child: AutoSizeText(
                  "Standard Paladin Deck",
                  style: FontStyles.bold11WithShadow,
                  minFontSize: 8,
                )),
                Flexible(
                    child: AutoSizeText(
                  "0/30",
                  style: FontStyles.bold11Gold,
                  textAlign: TextAlign.start,
                  minFontSize: 8,
                )),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
