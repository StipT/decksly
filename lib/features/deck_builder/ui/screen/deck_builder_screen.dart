import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/common/dev/logger.dart';
import 'package:decksly/features/card_details/ui/screen/card_details_screen.dart';
import 'package:decksly/features/card_details/ui/widgets/hero_dialog_route.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/features/card_gallery/ui/screen/card_item.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filter_app_bar.dart';
import 'package:decksly/features/card_gallery/ui/screen/side_menu/side_menu.dart';
import 'package:decksly/features/deck_builder/domain/model/deck.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_class.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_type.dart';
import 'package:decksly/features/deck_builder/ui/bloc/deck_builder_bloc.dart';
import 'package:decksly/features/deck_builder/ui/screen/widgets/deck_list_menu/deck_list_menu.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:decksly/reusable_ui/no_results_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shimmer/shimmer.dart';

class DeckBuilderArguments {
  const DeckBuilderArguments(this.deckType, this.deckClass);

  final DeckType? deckType;
  final DeckClass? deckClass;
}

class DeckBuilderScreen extends StatefulWidget {
  const DeckBuilderScreen({
    super.key,
    required this.deckBuilderArguments,
  });

  final DeckBuilderArguments deckBuilderArguments;

  @override
  State<DeckBuilderScreen> createState() => _DeckBuilderScreenState();
}

class _DeckBuilderScreenState extends State<DeckBuilderScreen> {
  final PagingController<int, CardDTO> _pagingController = PagingController(firstPageKey: 0);
  final ScrollController _scrollController = ScrollController();

  bool? isSideMenuOpen;
  bool isFilterBarExtended = false;

  @override
  void initState() {
    BlocProvider.of<DeckBuilderBloc>(context).add(
      DeckChangedEvent(
        Deck(
          cards: [],
          modeType: widget.deckBuilderArguments.deckType ?? DeckType.standard,
          classType: widget.deckBuilderArguments.deckClass ?? DeckClass.warrior,
        ),
      ),
    );

    BlocProvider.of<CardGalleryBloc>(context).add(CardFilterParamsChangedEvent(BlocProvider.of<CardGalleryBloc>(context)
        .state
        .cardFilterParams
        .copyWith(
            heroClass: [widget.deckBuilderArguments.deckClass?.name ?? "", "neutral"],
            set: widget.deckBuilderArguments.deckType?.name ?? "standard")));

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CardGalleryBloc, CardGalleryState>(
      listener: (ctx, state) => listenToCardGalleryBloc(ctx, state),
      child: BlocBuilder<DeckBuilderBloc, DeckBuilderState>(
        builder: (BuildContext context, state) {
          return BlocBuilder<CardGalleryBloc, CardGalleryState>(builder: (BuildContext context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        _cardList(),
                        _deckList(),
                      ],
                    ),
                    SideMenu(
                      onToggle: (isOpen) {
                        setState(() {
                          isSideMenuOpen = isOpen;
                          isFilterBarExtended = false;
                        });
                      },
                      inDeckBuilderMode: true,
                    ),
                    FilterAppBar(
                      deckClass: widget.deckBuilderArguments.deckClass,
                      forceCollapse: isSideMenuOpen ?? false,
                      height: 40.h,
                      onToggle: () {
                        setState(() {
                          isFilterBarExtended = !isFilterBarExtended;
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _cardList() {
    return Expanded(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 32.w,
              top: 40.h,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(assetPath(SUBFOLDER_BACKGROUND, "scroll_background")),
                fit: BoxFit.fill,
              ),
            ),
            child: AnimatedPadding(
              padding: EdgeInsets.only(top: isFilterBarExtended ? 30.h : 0),
              curve: Curves.bounceOut,
              duration: const Duration(milliseconds: 500),
              child: PagedGridView<int, CardDTO>(
                pagingController: _pagingController,
                scrollController: _scrollController,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),

                builderDelegate: PagedChildBuilderDelegate<CardDTO>(
                  animateTransitions: true,
                  noItemsFoundIndicatorBuilder: (context) {
                    return NoResultsWidget(
                      onTap: () {},
                    );
                  },
                  itemBuilder: (ctx, card, _) {
                    return CardItem(
                      card: card,
                      onLongPress: (card) => Navigator.push(context, HeroDialogRoute(builder: (context) {
                        return CardDetailsScreen(card);
                      })),
                      onTap: (card) => BlocProvider.of<DeckBuilderBloc>(context).add(AddCardEvent(card)),
                      inDeckBuilderMode: true,
                    );
                    return GestureDetector(
                      onLongPress: () => Navigator.push(context, HeroDialogRoute(builder: (context) {
                        return CardDetailsScreen(card);
                      })),
                      onTap: () => BlocProvider.of<DeckBuilderBloc>(context).add(AddCardEvent(card)),
                      child: Container(
                        color: Colors.green,
                        child: Image.network(
                          // TODO deck-28 Add image not found asset
                          card.image,
                          loadingBuilder: (context, widget, chunk) {
                            return chunk?.cumulativeBytesLoaded == chunk?.expectedTotalBytes
                                ? widget
                                : Container(
                                    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                                    child: Shimmer.fromColors(
                                      baseColor: AppColors.spanishGrey,
                                      highlightColor: AppColors.shimmerGrey,
                                      child: Image.asset(
                                        assetPath(SUBFOLDER_MISC, "card_template_grey"),
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ),
                    );
                  },
                  firstPageProgressIndicatorBuilder: (_) => const SpinKitRipple(color: AppColors.spanishGrey),
                  newPageProgressIndicatorBuilder: (_) => Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                      child: Shimmer.fromColors(
                        baseColor: AppColors.spanishGrey,
                        highlightColor: AppColors.shimmerGrey,
                        child: Image.asset(
                          assetPath(SUBFOLDER_MISC, "card_template_grey"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (isSideMenuOpen ?? false)
            Container(
              color: Colors.black54,
            ),
        ],
      ),
    );
  }

  void listenToCardGalleryBloc(BuildContext ctx, CardGalleryState state) {
    state.when(initial: (cards, cardParams) {
      BlocProvider.of<CardGalleryBloc>(context).add(FetchCardsEvent(state.cardFilterParams));
    }, fetching: (cardParams) {
      BlocProvider.of<CardGalleryBloc>(context).add(FetchCardsEvent(state.cardFilterParams));
    }, fetched: (cardParams, cards) {
      log(cardParams.toString());
      final nextPageKey = _pagingController.nextPageKey ?? 0;
      if (cards.cardCount == 0 && cards.page == 1) {
        _pagingController.refresh();
        _scrollController.animateTo(0, curve: Curves.easeIn, duration: const Duration(milliseconds: 500));
        _pagingController.appendLastPage(cards.cards!);
        return;
      }

      if (cards.page == 1) {
        _pagingController.refresh();
        _scrollController.jumpTo(0);
      }

      if (cards.pageCount! > cards.page!) {
        _pagingController.appendPage(cards.cards!, nextPageKey + cards.cards!.length);
      } else {
        _pagingController.appendLastPage(cards.cards!);
      }
    }, failure: (filterParams, failure) {
      _pagingController.error = failure;
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(failure.message),
        ),
      );
    });
  }

  _deckList() {
    return SizedBox(
      width: 234.w,
      child: DeckListMenu(
        width: 234.w,
        isFilterBarExtended: isFilterBarExtended,
        onCreateNewDeck: () => log("onCreateNewDeck"),
        onSave: () => log("onCreateNewDeck"),
      ),
    );
  }
}
