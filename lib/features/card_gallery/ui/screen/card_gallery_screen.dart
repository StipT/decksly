import 'package:decksly/common/design/colors.dart';
import 'package:decksly/common/dev/asset_loader.dart';
import 'package:decksly/common/dev/logger.dart';
import 'package:decksly/features/card_details/ui/screen/card_details_screen.dart';
import 'package:decksly/features/card_details/ui/widgets/hero_dialog_route.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filter_app_bar.dart';
import 'package:decksly/features/card_gallery/ui/screen/side_menu/side_menu.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:decksly/reusable_ui/no_results_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shimmer/shimmer.dart';

class CardGalleryScreen extends StatefulWidget {
  const CardGalleryScreen({super.key});

  @override
  State<CardGalleryScreen> createState() => _CardGalleryScreenState();
}

class _CardGalleryScreenState extends State<CardGalleryScreen> {
  final PagingController<int, CardDTO> _pagingController = PagingController(firstPageKey: 0);
  final ScrollController _scrollController = ScrollController();

  bool? isSideMenuOpen;
  bool isFilterBarExtended = false;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<CardGalleryBloc>(context).add(FetchCardsEvent(pageKey));
    });
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
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            _cardList(),
            SideMenu(
              onToggle: (isOpen) {
                setState(() {
                  isSideMenuOpen = isOpen;
                  isFilterBarExtended = false;
                });
              },
              inDeckBuilderMode: false,
            ),
            FilterAppBar(
              forceCollapse: isSideMenuOpen ?? false,
              height: 40.h,
              onToggle: () {
                setState(() {
                  isFilterBarExtended = !isFilterBarExtended;
                  log("isFilterBarExtended $isFilterBarExtended");
                });
              },
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
            top: 40.h,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetPath("background", "scroll_background")),
              fit: BoxFit.cover,
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
    );
  }

  void listenToCardGalleryBloc(BuildContext ctx, CardGalleryState state) {
    if (state is CardsLoaded) {
      final nextPageKey = _pagingController.nextPageKey ?? 0;
      // log("Page ${state.page}, ");
      if (state.page.cardCount == 0 && state.page.page == 1) {
        _pagingController.refresh();
        _scrollController.animateTo(0, curve: Curves.easeIn, duration: const Duration(milliseconds: 500));
        _pagingController.appendLastPage(state.page.cards);
        return;
      }

      if (state.page.page == 1) {
        _pagingController.refresh();
        _scrollController.jumpTo(0);
      }

      if (state.page.pageCount > state.page.page) {
        _pagingController.appendPage(state.page.cards, nextPageKey + state.page.cards.length);
      } else {
        _pagingController.appendLastPage(state.page.cards);
      }
    } else if (state is CardsError) {
      _pagingController.error = state.failure;
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(state.failure.message),
        ),
      );
    }
  }
}
