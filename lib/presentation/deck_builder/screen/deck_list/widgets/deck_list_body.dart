import "package:auto_size_text/auto_size_text.dart";
import "package:decksly/common/design/colors.dart";
import "package:decksly/common/design/fonts.dart";
import "package:decksly/common/util/throttler.dart";
import "package:decksly/domain/deck_builder/model/deck_card.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:decksly/presentation/card_gallery/bloc/card_gallery_bloc.dart";
import "package:decksly/presentation/card_gallery/screen/card_details/card_details_screen.dart";
import "package:decksly/presentation/card_gallery/screen/card_details/hero_dialog_route.dart";
import "package:decksly/presentation/deck_builder/bloc/deck_builder_bloc.dart";
import "package:decksly/presentation/deck_builder/screen/deck_list/widgets/deck_card_item.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class DeckListBody extends StatefulWidget {
  const DeckListBody({
    super.key,
  });

  @override
  State<DeckListBody> createState() => _DeckListBodyState();
}

class _DeckListBodyState extends State<DeckListBody> {
  var _key = GlobalKey<AnimatedListState>();
  final _throttler = Throttler(milliseconds: 250);
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CardGalleryBloc, CardGalleryState>(
          listener: (ctx, state) => listenForCardChanges(ctx, state),
        ),
        BlocListener<DeckBuilderBloc, DeckBuilderState>(
          listener: (ctx, state) => listenForDeckChanges(ctx, state),
        ),
      ],
      child: BlocBuilder<DeckBuilderBloc, DeckBuilderState>(
        builder: (BuildContext context, state) {
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15.w, right: 5.w, top: 4.h, bottom: 4.h),
              child: Stack(
                children: [
                  if (state.deck.cards.isEmpty)
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(right: 15.w, left: 5.w),
                        child: AutoSizeText(
                          LocaleKeys.tapCardsToAddThemOrHold.tr(),
                          style: FontStyles.bold11Purple(),
                          minFontSize: 9,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ScrollConfiguration(
                    behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
                    child: RawScrollbar(
                      controller: _scrollController,
                      thumbVisibility: true,
                      thumbColor: AppColors.bistreBrown,
                      radius: Radius.circular(20.r),
                      child: AnimatedList(
                        key: _key,
                        controller: _scrollController,
                        physics: const ClampingScrollPhysics(),
                        initialItemCount: state.deck.cards.length,
                        itemBuilder: (context, index, animation) {
                          return _buildItem(index, state.deck.cards[index], context, animation);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildItem(int index, DeckCard deckCard, BuildContext context, Animation<double> animation) {
    final slideTween = Tween<Offset>(
      begin: const Offset(-0.5, 0.0),
      end: Offset.zero,
    );

    final opacityTween = Tween<double>(
      begin: 0.3,
      end: 1,
    );

    return SlideTransition(
      position: animation.drive(slideTween),
      child: FadeTransition(
        opacity: animation.drive(opacityTween),
        child: DeckCardItem(
          key: UniqueKey(),
          index: index,
          deckCard: deckCard,
          onTap: (i, deckCard) async => _throttler.run(() {
            removeItem(index, deckCard);
          }),
          onLongPress: (deckCard) => Navigator.push(
            context,
            HeroDialogRoute(
              builder: (context) {
                return CardDetailsScreen(deckCard.card);
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> removeItem(int index, DeckCard deckCard) async {
    BlocProvider.of<DeckBuilderBloc>(context).add(RemoveCardEvent(index, deckCard.card));
    if (deckCard.amount == 1) {
      _key.currentState?.removeItem(
        index,
        (context, animation) => _buildItem(index, deckCard, context, animation),
        duration: const Duration(milliseconds: 200),
      );
    }
  }

  void insertItem(int index, List<DeckCard> deckCards) {
    _scrollController.animateTo(
      deckCards.length > 6 ? index * 21.h : 0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
    );
    _key.currentState?.insertItem(index, duration: const Duration(milliseconds: 200));
  }

  void _loadAnimatedList(List<DeckCard> itemList) {
    var future = Future(() {});
    for (var i = 0; i < itemList.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _key.currentState?.insertItem(i, duration: const Duration(milliseconds: 200));
        });
      });
    }
  }

  void _clearAnimatedList() {
    setState(() => _key = GlobalKey<AnimatedListState>());
  }

  void listenForDeckChanges(BuildContext context, DeckBuilderState state) {
    state.whenOrNull(
      initial: (deck) => _loadAnimatedList(deck.cards),
      cardAdded: (index, deck) => insertItem(index, deck.cards),
    );
  }

  void listenForCardChanges(BuildContext context, CardGalleryState state) {
    state.whenOrNull(localeChanged: (_) => _clearAnimatedList());
  }
}
