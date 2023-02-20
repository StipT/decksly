import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/features/deck_builder/ui/bloc/deck_builder_bloc.dart';
import 'package:decksly/features/deck_builder/ui/screen/widgets/deck_list_menu/deck_list_body.dart';
import 'package:decksly/features/deck_builder/ui/screen/widgets/deck_list_menu/deck_list_footer.dart';
import 'package:decksly/features/deck_builder/ui/screen/widgets/deck_list_menu/deck_list_header.dart';
import 'package:decksly/features/deck_builder/ui/screen/widgets/deck_list_menu/hs_deck_list_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckListMenu extends StatefulWidget {
  const DeckListMenu({
    Key? key,
    required this.width,
    required this.isFilterBarExtended,
    required this.onSave,
    required this.onCreateNewDeck,
  }) : super(key: key);

  final double? width;
  final bool isFilterBarExtended;
  final VoidCallback onSave;
  final VoidCallback onCreateNewDeck;

  @override
  State<DeckListMenu> createState() => _DeckListMenuState();
}

class _DeckListMenuState extends State<DeckListMenu>
    with TickerProviderStateMixin {
  late double _width;
  late bool _isFilterBarExtended;

  @override
  void initState() {
    _width = widget.width ?? 234.h;
    _isFilterBarExtended = widget.isFilterBarExtended;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeckBuilderBloc, DeckBuilderState>(
      builder: (BuildContext context, state) {
        return Container(
          width: _width,
          height: 0.82.sh,
          margin: EdgeInsets.only(top: 0.18.sh),
          child: AnimatedPadding(
              padding: EdgeInsets.only(top: _isFilterBarExtended ? 30.h : 0),
              curve: Curves.bounceOut,
              duration: const Duration(milliseconds: 500),
              child: Stack(
                children: [
                  Image.asset(
                    assetPath(SUBFOLDER_BACKGROUND, "purple_velvet_background"),
                    width: _width,
                    fit: BoxFit.fill,
                  ),
                  const HSDeckListBackground(),
                  Column(
                    children: [
                      DeckListHeader(
                        onConvertMode: () => {},
                      ),
                      const DeckListBody(),
                      DeckListFooter(
                        onCreateNewDeck: () => {},
                        onSave: () => {},
                      ),
                    ],
                  )
                ],
              )),
        );
      },
    );
  }
}
