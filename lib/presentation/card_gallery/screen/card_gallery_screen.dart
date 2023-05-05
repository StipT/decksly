import "package:decksly/common/design/colors.dart";
import "package:decksly/common/dev/asset_loader.dart";
import "package:decksly/common/dev/logger.dart";
import "package:decksly/common/reusable_ui/misc/card_loading.dart";
import "package:decksly/common/reusable_ui/misc/no_connection_widget.dart";
import "package:decksly/common/reusable_ui/misc/no_results_widget.dart";
import "package:decksly/common/reusable_ui/misc/snackbar.dart";
import "package:decksly/presentation/card_gallery/provider/card_gallery_state.dart";
import "package:decksly/presentation/card_gallery/provider/card_gallery_state_notifier.dart";
import "package:decksly/presentation/card_gallery/screen/card_details/card_details_screen.dart";
import "package:decksly/presentation/card_gallery/screen/card_details/hero_dialog_route.dart";
import "package:decksly/presentation/card_gallery/screen/filter_bar/filter_app_bar.dart";
import "package:decksly/presentation/card_gallery/screen/side_menu/side_menu.dart";
import "package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";

class CardGalleryScreen extends ConsumerStatefulWidget {
  const CardGalleryScreen({super.key});

  @override
  ConsumerState<CardGalleryScreen> createState() => _CardGalleryScreenState();
}

class _CardGalleryScreenState extends ConsumerState<CardGalleryScreen> {
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
    final state = ref.watch(cardGalleryNotifierProvider(CardGalleryNotifierInstanceType.cardGallery));

    state.whenOrNull(
      initial: (cardParams, page) => ref.read(cardGalleryNotifierProvider(CardGalleryNotifierInstanceType.cardGallery).notifier).handleFetchCards(
            cardParams.copyWith(
              locale: context.locale.toStringWithSeparator(),
            ),
          ),
    );

    ref.listen(
      cardGalleryNotifierProvider(CardGalleryNotifierInstanceType.cardGallery),
      (previous, next) => listenToCardGalleryNotifier(context, next as CardGalleryState?),
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            _cardList(),
            SideMenu(
              key: const Key("sideMenu"),
              isExtended: isSideMenuExtended,
              onToggle: () => _onSideMenuToggle(),
              inDeckBuilderMode: false,
            ),
            FilterAppBar(
              isExtended: isFilterBarExtended,
              onToggle: () => _onFilterAppBarToggle(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardList() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 32.w,
            top: 70.h,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetPath("background", "scroll_background")),
              fit: BoxFit.cover,
            ),
          ),
          child: AnimatedPadding(
            padding: EdgeInsets.only(top: isFilterBarExtended ? 52.5.h : 0),
            curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 500),
            child: PagedGridView<int, CardDTO>(
              key: const Key("cardList"),
              pagingController: _pagingController,
              scrollController: _scrollController,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              padding: EdgeInsets.zero,
              builderDelegate: PagedChildBuilderDelegate<CardDTO>(
                animateTransitions: true,
                firstPageErrorIndicatorBuilder: (context) => const NoConnectionWidget(),
                newPageErrorIndicatorBuilder: (context) => const NoConnectionWidget(),
                noItemsFoundIndicatorBuilder: (context) => const NoResultsWidget(),
                itemBuilder: (ctx, card, _) {
                  return GestureDetector(
                    key: const Key("cardListItem"),
                    onTap: () => Navigator.push(
                      context,
                      HeroDialogRoute(
                        builder: (context) {
                          return CardDetailsScreen(card);
                        },
                      ),
                    ),
                    child: card.image.isNotEmpty
                        ? Image.network(
                            card.image,
                            loadingBuilder: (context, widget, chunk) {
                              return chunk?.cumulativeBytesLoaded == chunk?.expectedTotalBytes
                                  ? widget
                                  : const CardLoading(key: Key("imageCardLoading"));
                            },
                            errorBuilder: (context, object, stackTrace) =>
                                const CardLoading(key: Key("imageCardLoading")),
                          )
                        : Container(
                            alignment: Alignment.bottomCenter,
                            padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                            child: Image.asset(
                              assetPath(kSubfolderMisc, "card_template_grey"),
                            ),
                          ),
                  );
                },
                firstPageProgressIndicatorBuilder: (_) =>
                    const SpinKitRipple(key: Key("spinner"), color: AppColors.velvet),
                newPageProgressIndicatorBuilder: (_) => const CardLoading(key: Key("newPageCardLoading")),
              ),
            ),
          ),
        ),
        if (isSideMenuExtended)
          Container(
            color: Colors.black54,
          ),
      ],
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

  void listenToCardGalleryNotifier(BuildContext ctx, CardGalleryState? state) {
    state?.whenOrNull(
      fetching: (cardParams) => ref.read(cardGalleryNotifierProvider(CardGalleryNotifierInstanceType.cardGallery).notifier).handleFetchCards(state.cardFilterParams),
      localeChanged: (cardParams) =>
          ref.read(cardGalleryNotifierProvider(CardGalleryNotifierInstanceType.cardGallery).notifier).handleFetchCards(state.cardFilterParams),
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
}
