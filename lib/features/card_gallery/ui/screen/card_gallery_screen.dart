import 'package:auto_route/auto_route.dart';
import 'package:decksly/app/di.dart';
import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/common/dev/logger.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/features/card_gallery/ui/screen/card_details/card_details_screen.dart';
import 'package:decksly/features/card_gallery/ui/screen/card_details/hero_dialog_route.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filter_app_bar.dart';
import 'package:decksly/features/card_gallery/ui/screen/side_menu/side_menu.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:decksly/reusable_ui/misc/no_results_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shimmer/shimmer.dart';

class CardGalleryScreen extends StatefulWidget implements AutoRouteWrapper {
  const CardGalleryScreen({super.key});

  @override
  State<CardGalleryScreen> createState() => _CardGalleryScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CardGalleryBloc>(),
      child: this,
    );
  }
}

class _CardGalleryScreenState extends State<CardGalleryScreen> {
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
    return BlocListener<CardGalleryBloc, CardGalleryState>(
      listener: (ctx, state) => listenToCardGalleryBloc(ctx, state),
      child: BlocBuilder<CardGalleryBloc, CardGalleryState>(builder: (BuildContext context, state) {
        state.maybeWhen(
          initial: (cardParams, cards) {
            BlocProvider.of<CardGalleryBloc>(context)
                .add(FetchCardsEvent(cardParams.copyWith(locale: context.locale.toStringWithSeparator())));
          },
          orElse: () {},
        );

        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                _cardList(),
                SideMenu(
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
      }),
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
              pagingController: _pagingController,
              scrollController: _scrollController,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              padding: EdgeInsets.zero,
              builderDelegate: PagedChildBuilderDelegate<CardDTO>(
                animateTransitions: true,
                noItemsFoundIndicatorBuilder: (context) {
                  return NoResultsWidget(
                    onTap: () {},
                  );
                },
                itemBuilder: (ctx, card, _) {
                  return GestureDetector(
                    onTap: () => Navigator.push(context, HeroDialogRoute(builder: (context) {
                      return CardDetailsScreen(card);
                    })),
                    child: Image.network(
                      // TODO deck-28 Add image not found asset
                      card.image,
                      loadingBuilder: (context, widget, chunk) {
                        return chunk?.cumulativeBytesLoaded == chunk?.expectedTotalBytes
                            ? widget
                            : Container(
                                padding: EdgeInsets.symmetric(vertical: 8.75.h, horizontal: 20.w),
                                child: Shimmer.fromColors(
                                  baseColor: AppColors.spanishGrey,
                                  highlightColor: AppColors.shimmerGrey,
                                  child: Image.asset(
                                    assetPath(kSubfolderMisc, "card_template_grey"),
                                  ),
                                ),
                              );
                      },
                    ),
                  );
                },
                firstPageProgressIndicatorBuilder: (_) => const SpinKitRipple(color: AppColors.velvet),
                newPageProgressIndicatorBuilder: (_) => Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.75.h, horizontal: 20.w),
                    child: Shimmer.fromColors(
                      baseColor: AppColors.spanishGrey,
                      highlightColor: AppColors.shimmerGrey,
                      child: Image.asset(
                        assetPath(kSubfolderMisc, "card_template_grey"),
                      ),
                    ),
                  ),
                ),
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

  void listenToCardGalleryBloc(BuildContext ctx, CardGalleryState state) {
    state.whenOrNull(initial: (cards, cardParams) {
      BlocProvider.of<CardGalleryBloc>(context).add(FetchCardsEvent(state.cardFilterParams));
    }, fetching: (cardParams) {
      BlocProvider.of<CardGalleryBloc>(context).add(FetchCardsEvent(state.cardFilterParams));
    }, localeChanged: (cardParams) {
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
}
