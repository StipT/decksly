import 'package:auto_size_text/auto_size_text.dart';
import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/design/fonts.dart';
import 'package:decksly/features/card_details/ui/screen/card_details_screen.dart';
import 'package:decksly/features/card_details/ui/widgets/hero_dialog_route.dart';
import 'package:decksly/features/deck_builder/ui/bloc/deck_builder_bloc.dart';
import 'package:decksly/features/deck_builder/ui/screen/widgets/deck_list_menu/deck_card_item.dart';
import 'package:decksly/l10n/locale_keys.g.dart';
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
            margin: EdgeInsets.only(left: 15.w, right: 5.w, top: 4.h, bottom: 4.h),
            child: state.deck.cards.isEmpty
                ? Center(
                    child: Container(
                      padding: EdgeInsets.only(right: 10.w),
                      child: AutoSizeText(
                        LocaleKeys.tapCardsToAddThemOrHold.tr(),
                        style: FontStyles.bold11Purple,
                        minFontSize: 9,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : RawScrollbar(
                    thumbVisibility: true,
                    thumbColor: AppColors.bistreBrown,
                    radius: Radius.circular(20.r),
                    child: ListView.builder(
                        padding: EdgeInsets.only(right: 10.w),
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.deck.cards.length,
                        itemBuilder: (context, index) {
                          int amount = state.deck.cards.where((element) => element == state.deck.cards[index]).length;
                          print(amount);
                          return DeckCardItem(
                            card: state.deck.cards[index].card,
                            amount: state.deck.cards[index].amount,
                            onTap: (card) => BlocProvider.of<DeckBuilderBloc>(context).add(RemoveCardEvent(card)),
                            onLongPress: (card) => Navigator.push(
                              context,
                              HeroDialogRoute(
                                builder: (context) {
                                  return CardDetailsScreen(card);
                                }
                              ),
                            ),
                          );
                        }),
                  ),
          ),
        );
      },
    );
  }
}
