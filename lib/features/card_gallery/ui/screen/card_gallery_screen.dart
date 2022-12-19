import 'package:decksly/features/card_gallery/ui/bloc/card_gallery_bloc.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foil/foil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xl/xl.dart';

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
              //   AppBar(backgroundColor: Colors.grey),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: PagedGridView<int, CardDTO>(
                    pagingController: _pagingController,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    padding: EdgeInsets.zero,
                    builderDelegate: PagedChildBuilderDelegate<CardDTO>(
                      itemBuilder: (ctx, card, _) {
                        return GestureDetector(
                          onTap: () => Navigator.push(context, HeroDialogRoute(
                              //  fullscreenDialog: true,
                              builder: (context) {
                            return DetailScreen(card);
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

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.card, {super.key});

  final CardDTO card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.transparent,
        child: XL(
          sharesPointer: false,
          layers: [
            XLayer(
                xRotation: 0.5,
                yRotation: 0.5,
                xOffset: 0,
                yOffset: 0,
                child: Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          card.artistName,
                          style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ))),
                Expanded(child: const SizedBox()),
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          card.flavorText,
                          style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ))),
              ],
            )),
            XLayer(
              xRotation: 1.0,
              yRotation: 1.0,
              xOffset: 0,
              yOffset: 200,
              child: Foil(
                useSensor: true,
                isUnwrapped: false,
                opacity: 0.3,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Hero(
                      tag: card.id.toString(),
                      child: Image.network(
                        card.image,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({required this.builder}) : super();

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 100);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => "throw UnimplementedError()";
}
