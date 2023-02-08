import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/features/deck_builder/ui/bloc/deck_builder_bloc.dart';
import 'package:decksly/features/deck_builder/ui/screen/widgets/deck_list_menu/deck_card_item.dart';
import 'package:decksly/presentation/resources/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeckListBody extends StatelessWidget {
  const DeckListBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeckBuilderBloc, DeckBuilderState>(
      builder: (BuildContext context, state) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
                child: state.deck.cards.isEmpty ?
                AutoSizeText(
                  LocaleKeys.tapCardsToAddThemOrHold.tr(),
                  style: FontStyles.bold11Purple,
                  minFontSize: 9,
                  textAlign: TextAlign.center,
                ) :
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.deck.cards.length,
                    itemBuilder: (context, index) {
                      print(state.deck.cards.toString());
                      print(state.deck.cards[index].name ?? "Name");
                      return DeckCardItem(card: state.deck.cards[index], amount: "1", onTapInfo: (){}, onTapMinus: (){}, onTapPlus: (){},);
                    }
                  ),
          ),
        );
      },
    );
  }
}
