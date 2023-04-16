import "package:collection/collection.dart";
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
import "package:decksly/presentation/card_gallery/provider/card_gallery_state.dart";
import "package:decksly/presentation/card_gallery/provider/card_gallery_state_notifier.dart";
import "package:decksly/presentation/card_gallery/screen/card_details/card_details_screen.dart";
import "package:decksly/presentation/card_gallery/screen/card_details/hero_dialog_route.dart";
import "package:decksly/presentation/card_gallery/screen/card_item.dart";
import "package:decksly/presentation/card_gallery/screen/filter_bar/filter_app_bar.dart";
import "package:decksly/presentation/card_gallery/screen/side_menu/side_menu.dart";
import "package:decksly/presentation/deck_builder/provider/deck_builder_state.dart";
import "package:decksly/presentation/deck_builder/provider/deck_builder_state_notifier.dart";
import "package:decksly/presentation/deck_builder/screen/deck_list/deck_list_menu.dart";
import "package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";

class DeckBuilderScreen extends ConsumerStatefulWidget {
  const DeckBuilderScreen({
    super.key,
    required this.deck,
  });

  final Deck deck;

  @override
  ConsumerState<DeckBuilderScreen> createState() => _DeckBuilderScreenState();
}

class _DeckBuilderScreenState extends ConsumerState<DeckBuilderScreen> {
  final PagingController<int, CardDTO> _pagingController = PagingController(firstPageKey: 0);
  final ScrollController _scrollController = ScrollController();

  bool isSideMenuExtended = false;
  bool isFilterBarExtended = false;

  @override
  void dispose() {
    _pagingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardGalleryState = ref.watch(cardGalleryNotifierProvider);
    final deckBuilderState = ref.watch(deckBuilderNotifierProvider);

    ref.listen(cardGalleryNotifierProvider, (previous, next) => listenToCardGallery(context, cardGalleryState));
    ref.listen(
      deckBuilderNotifierProvider,
      (previous, next) => listenForDeckCode(context, deckBuilderState, cardGalleryState),
    );

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
                      _cardList(deckBuilderState),
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
  }

  Widget _cardList(DeckBuilderState state) {
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
            key: const Key("deckBuilderCardList"),
            pagingController: _pagingController,
            scrollController: _scrollController,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 210.h),
            builderDelegate: PagedChildBuilderDelegate<CardDTO>(
              animateTransitions: true,
              firstPageErrorIndicatorBuilder: (context) => const NoConnectionWidget(),
              noItemsFoundIndicatorBuilder: (context) => const NoResultsWidget(),
              itemBuilder: (ctx, card, index) {
                return CardItem(
                  key: Key("cardItem_$index"),
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
                  onTap: (card) => ref.read(deckBuilderNotifierProvider.notifier).handleAddCard(card),
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

  void listenToCardGallery(BuildContext ctx, CardGalleryState state) {
    state.whenOrNull(
      initial: (cards, cardParams) =>
          ref.read(cardGalleryNotifierProvider.notifier).handleFetchCards(state.cardFilterParams),
      fetching: (cardParams) => ref.read(cardGalleryNotifierProvider.notifier).handleFetchCards(state.cardFilterParams),
      localeChanged: (cardParams) {
        ref.read(deckBuilderNotifierProvider.notifier).handleDeckChanged(widget.deck.copyWith(cards: [], code: ""));
        ref.read(cardGalleryNotifierProvider.notifier).handleFetchCards(state.cardFilterParams);
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

  void _initialState(CardGalleryState cardGalleryState) {
    ref.read(deckBuilderNotifierProvider.notifier).handleDeckChanged(
          Deck(
            cards: widget.deck.cards,
            type: widget.deck.type,
            heroClass: widget.deck.heroClass,
          ),
        );

    ref.read(cardGalleryNotifierProvider.notifier).handleCardFilterParamsChanged(
          cardGalleryState.cardFilterParams.copyWith(
            locale: context.locale.toStringWithSeparator(),
            heroClass: [widget.deck.heroClass.name, CardClass.neutral.value],
            set: widget.deck.type.value,
          ),
        );
  }

  void listenForDeckCode(BuildContext context, DeckBuilderState deckBuilderState, CardGalleryState cardGalleryState) {
    deckBuilderState.whenOrNull(
      initial: (_) => _initialState(cardGalleryState),
      codeGenerated: (deck) => Clipboard.setData(ClipboardData(text: deck.code)).then((_) {
        HSSnackBar.show(context, HSSnackBarType.message, LocaleKeys.deckCodeHasBeenCopiedToClipboard.tr());
      }),
      failure: (deck, failure) =>
          HSSnackBar.show(context, HSSnackBarType.alert, LocaleKeys.thereWasAnErrorGeneratingDeckCode.tr()),
    );
  }
}
