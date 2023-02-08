import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_class.dart';
import 'package:decksly/features/deck_builder/ui/bloc/deck_builder_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassFilter extends StatefulWidget {
  ClassFilter({
    Key? key,
    this.height = 40,
    this.width = 150,
    required this.deckClass,
    required this.onToggleClassFilter,
    required this.onToggleNeutralFilter,
  }) : super(key: key);

  double height;
  double width;
  final DeckClass deckClass;
  final VoidCallback onToggleClassFilter;
  final VoidCallback onToggleNeutralFilter;

  @override
  State<StatefulWidget> createState() => _ClassFilterState();
}

class _ClassFilterState extends State<ClassFilter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardGalleryBloc, CardGalleryState>(
        builder: (BuildContext context, state) {
          return Container(
            height: widget.height,
            width: widget.width,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Stack(
              children: [
                Image.asset(
                  assetPath(SUBFOLDER_MISC, "class_filter"),
                  fit: BoxFit.fitHeight,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: widget.onToggleClassFilter,
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 5.h,
                            bottom: 5.h,
                          ),
                          child: Image.asset(
                            assetPath(SUBFOLDER_CLASS, _getClassIcon(widget.deckClass)),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: widget.onToggleNeutralFilter,
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 5.h,
                            bottom: 5.h,
                          ),
                          child: Image.asset(
                            assetPath(SUBFOLDER_CLASS, "neutral_icon"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 3.5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if(state.cardFilterParams.heroClass.contains(widget.deckClass.name))
                        GestureDetector(
                          onTap: widget.onToggleClassFilter,
                          child: Image.asset(
                            assetPath(SUBFOLDER_MISC, "class_filter_selected"),
                          ),
                        ),
                      if(state.cardFilterParams.heroClass.contains("neutral"))
                      GestureDetector(
                        onTap: widget.onToggleNeutralFilter,
                        child: Image.asset(
                          assetPath(SUBFOLDER_MISC, "class_filter_selected"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  String _getClassIcon(DeckClass deckClass) {
    switch (deckClass) {
      case DeckClass.deathKnight:
        return "deathKnight_icon";
      case DeckClass.demonHunter:
        return "demonHunter_icon";
      case DeckClass.druid:
        return "druid_icon";
      case DeckClass.hunter:
        return "hunter_icon";
      case DeckClass.mage:
        return "mage_icon";
      case DeckClass.paladin:
        return "paladin_icon";
      case DeckClass.priest:
        return "priest_icon";
      case DeckClass.rogue:
        return "rogue_icon";
      case DeckClass.shaman:
        return "shaman_icon";
      case DeckClass.warlock:
        return "warlock_icon";
      case DeckClass.warrior:
        return "warrior_icon";
    }
  }
}
