import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/common/reusable_ui/backgrounds/hs_deck_list_background.dart';
import 'package:decksly/features/deck_builder/ui/bloc/deck_builder_bloc.dart';
import 'package:decksly/features/deck_builder/ui/screen/deck_list/widgets/deck_list_body.dart';
import 'package:decksly/features/deck_builder/ui/screen/deck_list/widgets/deck_list_footer.dart';
import 'package:decksly/features/deck_builder/ui/screen/deck_list/widgets/deck_list_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckListMenu extends StatefulWidget {
  const DeckListMenu({
    Key? key,
    required this.width,
    required this.isFilterBarExtended,
  }) : super(key: key);

  final double? width;
  final bool isFilterBarExtended;

  @override
  State<DeckListMenu> createState() => _DeckListMenuState();
}

class _DeckListMenuState extends State<DeckListMenu> with TickerProviderStateMixin {
  late double _width;
  late bool _isFilterBarExtended;

  @override
  void initState() {
    _width = widget.width ?? 409.5.h;
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
              padding: EdgeInsets.only(top: _isFilterBarExtended ? 52.5.h : 0),
              curve: Curves.bounceOut,
              duration: const Duration(milliseconds: 500),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    assetPath(kSubfolderBackground, "purple_velvet_background"),
                    width: _width,
                    fit: BoxFit.fill,
                  ),
                  HSDeckListBackground(headerHeight: 70.h, footerHeight: 60.h),
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
