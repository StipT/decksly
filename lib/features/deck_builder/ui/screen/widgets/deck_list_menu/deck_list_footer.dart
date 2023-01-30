import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/features/deck_builder/ui/bloc/deck_builder_bloc.dart';
import 'package:decksly/presentation/resources/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckListFooter extends StatelessWidget {
  const DeckListFooter({
    Key? key,
    required this.onSave,
    required this.onCreateNewDeck,
  }) : super(key: key);

  final VoidCallback onSave;
  final VoidCallback onCreateNewDeck;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeckBuilderBloc, DeckBuilderState>(
      builder: (BuildContext context, state) {
        return Container(
          height: 20.h,
          margin: EdgeInsets.only(bottom: 5.h, left: 15.w, right: 15.w),
          child: Row(
            children: [
              Expanded(
                flex: 2, child: Container(margin: EdgeInsets.only(left: 6.w, top: 2.h, bottom: 3.h), child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(assetPath(SUBFOLDER_MISC, "copy_deck_button"),),
                  Text(LocaleKeys.copyDeckCode.tr(), style: FontStyles.bold11,),
                ],
              )),),
              Image.asset(assetPath(SUBFOLDER_MISC, "wood_divider")),
              Container(margin: EdgeInsets.only(right: 5.w, top: 2.h, bottom: 3.h),
                  child: Image.asset(assetPath(SUBFOLDER_MISC, "new_deck_button"),)),
            ],
          ),
        );
      },
    );
  }
}
