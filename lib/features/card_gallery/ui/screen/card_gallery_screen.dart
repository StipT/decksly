import 'package:decksly/features/card_details/ui/screen/card_details_screen.dart';
import 'package:decksly/features/card_details/ui/widgets/hero_dialog_route.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/features/card_gallery/ui/screen/filter_bar/filter_app_bar.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CardGalleryScreen extends StatefulWidget {
  const CardGalleryScreen({super.key});

  @override
  State<CardGalleryScreen> createState() => _CardGalleryScreenState();
}

class _CardGalleryScreenState extends State<CardGalleryScreen> {
  final PagingController<int, CardDTO> _pagingController = PagingController(firstPageKey: 0);

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CardGalleryBloc, CardGalleryState>(
      listener: (ctx, state) => listenToCardGalleryBloc(ctx, state),
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                FilterAppBar(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/background/scroll_background.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: PagedGridView<int, CardDTO>(
                      pagingController: _pagingController,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      padding: EdgeInsets.zero,
                      builderDelegate: PagedChildBuilderDelegate<CardDTO>(
                        itemBuilder: (ctx, card, _) {
                          return GestureDetector(
                            onTap: () => Navigator.push(context, HeroDialogRoute(builder: (context) {
                              return CardDetailsScreen(card);
                            })),
                            child: Hero(
                              tag: card.id,
                              child: Image.network(
                                card.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                        firstPageProgressIndicatorBuilder: (_) => const Center(
                          child: CircularProgressIndicator.adaptive(
                            strokeWidth: 1.4,
                          ),
                        ),
                        newPageProgressIndicatorBuilder: (_) => const Center(
                          child: CircularProgressIndicator.adaptive(
                            strokeWidth: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void listenToCardGalleryBloc(BuildContext ctx, CardGalleryState state) {
    if (state is CardsLoaded) {
      final nextPageKey = _pagingController.nextPageKey ?? 0;
      _pagingController.appendPage(state.cards, nextPageKey + state.cards.length);
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
