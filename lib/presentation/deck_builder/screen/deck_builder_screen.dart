import "package:auto_route/auto_route.dart";
import "package:collection/collection.dart";
import "package:decksly/app/di.dart";
import "package:decksly/common/design/colors.dart";
import "package:decksly/common/dev/asset_loader.dart";
import "package:decksly/common/dev/logger.dart";
import "package:decksly/common/reusable_ui/misc/card_loading.dart";
import "package:decksly/common/reusable_ui/misc/no_connection_widget.dart";
import "package:decksly/common/reusable_ui/misc/no_results_widget.dart";
import "package:decksly/common/reusable_ui/misc/snackbar.dart";
import "package:decksly/domain/card_gallery/model/card_filters/card_class.dart";
import "package:decksly/domain/deck_builder/model/deck.dart";
import "package:decksly/domain/deck_builder/model/deck_type.dart";
import "package:decksly/l10n/locale_keys.g.dart";
import "package:decksly/presentation/card_gallery/bloc/card_gallery_bloc.dart";
import "package:decksly/presentation/card_gallery/screen/card_details/card_details_screen.dart";
import "package:decksly/presentation/card_gallery/screen/card_details/hero_dialog_route.dart";
import "package:decksly/presentation/card_gallery/screen/card_item.dart";
import "package:decksly/presentation/card_gallery/screen/filter_bar/filter_app_bar.dart";
import "package:decksly/presentation/card_gallery/screen/side_menu/side_menu.dart";
import "package:decksly/presentation/deck_builder/bloc/deck_builder_bloc.dart";
import "package:decksly/presentation/deck_builder/screen/deck_list/deck_list_menu.dart";
import "package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";

class DeckBuilderScreen extends StatefulWidget implements AutoRouteWrapper {
  const DeckBuilderScreen({
    super.key,
    required this.deck,
  });

  final Deck deck;

  @override
  State<DeckBuilderScreen> createState() => _DeckBuilderScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<CardGalleryBloc>()),
        BlocProvider(create: (_) => getIt<DeckBuilderBloc>()),
      ],
      child: this,
    );
  }
}

class _DeckBuilderScreenState extends State<DeckBuilderScreen> {
  final PagingController<int, CardDTO> _pagingController = PagingController(firstPageKey: 0);
  final ScrollController _scrollController = ScrollController();

  bool isSideMenuExtended = false;
  bool isFilterBarExtended = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _initialState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CardGalleryBloc, CardGalleryState>(
          listener: (ctx, state) => listenToCardGalleryBloc(ctx, state),
        ),
        BlocListener<DeckBuilderBloc, DeckBuilderState>(
          listener: (ctx, state) => listenForDeckCode(ctx, state),
        ),
      ],
      child: BlocBuilder<DeckBuilderBloc, DeckBuilderState>(
        builder: (BuildContext context, state) {
          return BlocBuilder<CardGalleryBloc, CardGalleryState>(
            builder: (BuildContext context, state) {
              return WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: SizedBox(
                    height: 1.sh,
                    width: 1.sw,
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Row(
                              children: [
                                _cardList(),
                                _deckList(),
                              ],
                            ),
                            if (isSideMenuExtended)
                              Container(
                                color: Colors.black54,
                              ),
                          ],
                        ),
                        SideMenu(
                          isExtended: isSideMenuExtended,
                          onToggle: () => _onSideMenuToggle(),
                          inDeckBuilderMode: true,
                        ),
                        FilterAppBar(
                          deckType: widget.deck.type,
                          deckClass: widget.deck.heroClass,
                          isExtended: isFilterBarExtended,
                          onToggle: () => _onFilterAppBarToggle(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _cardList() {
    return BlocBuilder<DeckBuilderBloc, DeckBuilderState>(
      builder: (BuildContext context, state) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(
              left: 32.w,
              top: 70.h,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(assetPath(kSubfolderBackground, "scroll_background")),
                fit: BoxFit.fill,
              ),
            ),
            child: AnimatedPadding(
              padding: EdgeInsets.only(top: isFilterBarExtended ? 52.5.h : 0, left: 10.w, right: 10.w),
              curve: Curves.bounceOut,
              duration: const Duration(milliseconds: 500),
              child: PagedGridView<int, CardDTO>(
                pagingController: _pagingController,
                scrollController: _scrollController,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 210.h),
                builderDelegate: PagedChildBuilderDelegate<CardDTO>(
                  animateTransitions: true,
                  firstPageErrorIndicatorBuilder: (context) => const NoConnectionWidget(),
                  noItemsFoundIndicatorBuilder: (context) => const NoResultsWidget(),
                  itemBuilder: (ctx, card, _) {
                    return CardItem(
                      card: card,
                      amount: state.deck.cards.firstWhereOrNull((element) => element.card == card)?.amount ?? 0,
                      onLongPress: (card) => Navigator.push(
                        context,
                        HeroDialogRoute(
                          builder: (context) {
                            return CardDetailsScreen(card);
                          },
                        ),
                      ),
                      onTap: (card) => BlocProvider.of<DeckBuilderBloc>(context).add(AddCardEvent(card)),
                      inDeckBuilderMode: true,
                    );
                  },
                  firstPageProgressIndicatorBuilder: (_) => const SpinKitRipple(color: AppColors.velvet),
                  newPageProgressIndicatorBuilder: (_) => const CardLoading(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _deckList() {
    return SizedBox(
      width: 234.w,
      child: AnimatedPadding(
        padding: EdgeInsets.only(top: isFilterBarExtended ? 52.5.h : 0),
        curve: Curves.bounceOut,
        duration: const Duration(milliseconds: 500),
        child: DeckListMenu(
          width: 234.w,
          isFilterBarExtended: isFilterBarExtended,
        ),
      ),
    );
  }

  void _onSideMenuToggle() {
    setState(() {
      isSideMenuExtended = !isSideMenuExtended;

      if (isSideMenuExtended && isFilterBarExtended) {
        isFilterBarExtended = false;
      }
    });
  }

  void _onFilterAppBarToggle() {
    setState(() {
      isFilterBarExtended = !isFilterBarExtended;

      if (isSideMenuExtended && isFilterBarExtended) {
        isSideMenuExtended = false;
      }
    });
  }

  void listenToCardGalleryBloc(BuildContext ctx, CardGalleryState state) {
    state.whenOrNull(
      initial: (cards, cardParams) {
        BlocProvider.of<CardGalleryBloc>(context).add(FetchCardsEvent(state.cardFilterParams));
      },
      fetching: (cardParams) {
        BlocProvider.of<CardGalleryBloc>(context).add(FetchCardsEvent(state.cardFilterParams));
      },
      localeChanged: (cardParams) {
        BlocProvider.of<DeckBuilderBloc>(context).add(DeckChangedEvent(widget.deck.copyWith(cards: [], code: "")));

        BlocProvider.of<CardGalleryBloc>(context).add(FetchCardsEvent(state.cardFilterParams));
      },
      fetched: (cardParams, cards) {
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
      },
      failure: (filterParams, failure) {
        _pagingController.error = failure;
        HSSnackBar.show(context, HSSnackBarType.failure, failure.message);
      },
    );
  }

  void _initialState() {
    BlocProvider.of<DeckBuilderBloc>(context).add(
      DeckChangedEvent(
        Deck(
          cards: widget.deck.cards,
          type: widget.deck.type,
          heroClass: widget.deck.heroClass,
        ),
      ),
    );

    BlocProvider.of<CardGalleryBloc>(context).add(
      CardFilterParamsChangedEvent(
        BlocProvider.of<CardGalleryBloc>(context).state.cardFilterParams.copyWith(
              locale: context.locale.toStringWithSeparator(),
              heroClass: [widget.deck.heroClass.name, CardClass.neutral.value],
              set: widget.deck.type.value,
            ),
      ),
    );
  }

  void listenForDeckCode(BuildContext context, DeckBuilderState state) {
    state.whenOrNull(
      initial: (_) => _initialState(),
      codeGenerated: (deck) => Clipboard.setData(ClipboardData(text: deck.code)).then((_) {
        HSSnackBar.show(context, HSSnackBarType.message, LocaleKeys.deckCodeHasBeenCopiedToClipboard.tr());
      }),
      failure: (deck, failure) =>
          HSSnackBar.show(context, HSSnackBarType.alert, LocaleKeys.thereWasAnErrorGeneratingDeckCode.tr()),
    );
  }
}
