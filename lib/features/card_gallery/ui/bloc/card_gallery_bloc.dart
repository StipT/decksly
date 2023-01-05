import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:decksly/common/failures.dart';
import 'package:decksly/common/network_info.dart';
import 'package:decksly/features/card_gallery/domain/model/cards_page.dart';
import 'package:decksly/features/card_gallery/domain/usecase/fetch_cards_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'card_gallery_event.dart';

part 'card_gallery_state.dart';

@injectable
class CardGalleryBloc extends Bloc<CardGalleryEvent, CardGalleryState> {
  CardGalleryBloc(this._networkInfo, {required this.fetchCardsUsecase}) : super(const CardsInitial()) {
    on<FetchCardsEvent>((event, emit) => handleFetchCards(emit, event.page, false));
    on<CardSetChangedEvent>((event, emit) async => await handleCardSetChanged(emit, event.set));
    on<CardClassChangedEvent>((event, emit) async => await handleCardClassChanged(emit, event.heroClass));

    on<ManaFilterChangedEvent>((event, emit) async => await handleManaFilterChangedEvent(emit, event.manaCost));
    on<SearchFilterChangedEvent>((event, emit) async => await handleSearchFilterChangedEvent(emit, event.textFilter));
    _streamInternetConnectionState();
  }

  final NetworkInfo _networkInfo;
  late final Stream<bool> internetConnectionState;
  final FetchCardsUsecase fetchCardsUsecase;

  String? locale = "en_US";
  String? set = "standard";
  String? heroClass = "";
  String? manaCost = "";
  List<num>? attack = [];
  List<num>? health = [];
  List<num>? collectible = [];
  String? rarity = "";
  String? type = "";
  String? minionType = "";
  String? keyword = "";
  String? textFilter = "";
  String? gameMode = "constructed";
  String? spellSchool = "";
  String? sort = "manaCost:asc";
  num _pageNumber = 1;
  final int pageSize = 20;

  void _streamInternetConnectionState() {
    internetConnectionState = _networkInfo.resultStream
        .map((result) => result != ConnectivityResult.none)
        .debounceTime(const Duration(milliseconds: 60));
  }

  Future<void> handleFetchCards(
    Emitter<CardGalleryState> emit,
    int pageKey,
    bool refresh,
  ) async {
    emit(const CardsLoading());
    _pageNumber = (pageKey < pageSize) ? 1 : pageKey ~/ pageSize;

    final fetchCardsParams = FetchCardsParams(
      page: _pageNumber,
      textFilter: textFilter,
      manaCost: manaCost,
      heroClass: heroClass,
      set: set,
      locale: locale,
      attack: attack,
      collectible: collectible,
      gameMode: gameMode,
      health: health,
      keyword: keyword,
      minionType: minionType,
      rarity: rarity,
      sort: sort,
      spellSchool: spellSchool,
      type: type,
    );

    final resultOrFailure = await fetchCardsUsecase(fetchCardsParams);
    resultOrFailure.fold(
      (failure) => emit(CardsError(failure)),
      (cards) {
        emit(CardsLoaded(cards, refresh));
        pageKey++;
      },
    );
  }

  Future<void> handleCardSetChanged(Emitter<CardGalleryState> emit, String set) async {
    this.set = set;
    await handleFetchCards(emit, 1, true);
  }

  Future<void> handleCardClassChanged(Emitter<CardGalleryState> emit, String heroClass) async {
    this.heroClass = heroClass;
    await handleFetchCards(emit, 1, true);
  }

  Future<void> handleManaFilterChangedEvent(Emitter<CardGalleryState> emit, String manaCost) async {
    this.manaCost = manaCost;
    await handleFetchCards(emit, 1, true);
  }

  Future<void> handleSearchFilterChangedEvent(Emitter<CardGalleryState> emit, String textFilter) async {
    this.textFilter = textFilter.isEmpty ? null : textFilter;
    await handleFetchCards(emit, 1, true);
  }
}
