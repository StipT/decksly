import 'package:decksly/common/fonts.dart';
import 'package:decksly/features/card_details/ui/screen/card_details_screen.dart';
import 'package:decksly/features/card_details/ui/widgets/hero_dialog_route.dart';
import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
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
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/scroll_background.png"),
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
              Container(
                height: 0.125.sh,
                padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/velvet_background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    // TODO deck-8 Add Class filter
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Image.asset("assets/classes/warlock_icon.png"),
                      ),
                    ),
                    // TODO deck-9 Add Card Set filter
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Text(
                          "Standard Cards",
                          style: FontStyles.regular12,
                        ),
                      ),
                    ),
                    // TODO deck-10 Add Mana filter
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Image.asset("assets/misc/mana_inactive.png"),
                      ),
                    ),
                    // TODO deck-11 Add Search filter
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Text(
                          "Search...",
                          style: FontStyles.regular12,
                        ),
                      ),
                    ),
                    // TODO deck-12 Add filter Dialog
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Text(
                          "Filters",
                          style: FontStyles.regular12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
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
