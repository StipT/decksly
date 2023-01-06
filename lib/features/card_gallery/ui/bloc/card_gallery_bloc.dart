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

    on<SortByChangedEvent>((event, emit) async => await handleSortByChangedEvent(emit, event.sortBy));
    on<AttackFilterChangedEvent>((event, emit) async => await handleAttackFilterChangedEvent(emit, event.attack));
    on<HealthFilterChangedEvent>((event, emit) async => await handleHealthFilterChangedEvent(emit, event.health));
    on<CardTypeFilterChangedEvent>((event, emit) async => await handleCardTypeFilterChangedEvent(emit, event.cardType));
    on<MinionTypeFilterChangedEvent>((event, emit) async => await handleMinionTypeFilterChangedEvent(emit, event.minionType));
    on<SpellSchoolFilterChangedEvent>((event, emit) async => await handleSpellSchoolFilterChangedEvent(emit, event.spellSchool));

    on<RarityFilterChangedEvent>((event, emit) async => await handleRarityFilterChangedEvent(emit, event.rarity));
    on<KeywordFilterChangedEvent>((event, emit) async => await handleKeywordFilterChangedEvent(emit, event.keyword));
    _streamInternetConnectionState();
  }

  final NetworkInfo _networkInfo;
  late final Stream<bool> internetConnectionState;
  final FetchCardsUsecase fetchCardsUsecase;

  String? locale = "en_US";
  String? set = "standard";
  String? heroClass = "";
  String? manaCost = "";
  String? attack = "";
  String? health = "";
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

  Future<void> handleSortByChangedEvent(Emitter<CardGalleryState> emit, String sortBy) async {
    this.sort = sortBy;
    await handleFetchCards(emit, 1, true);
  }

  Future<void> handleAttackFilterChangedEvent(Emitter<CardGalleryState> emit, String attack) async {
    this.attack = attack;
    await handleFetchCards(emit, 1, true);
  }

  Future<void> handleHealthFilterChangedEvent(Emitter<CardGalleryState> emit, String health) async {
    this.health = health;
    await handleFetchCards(emit, 1, true);
  }

  Future<void> handleCardTypeFilterChangedEvent(Emitter<CardGalleryState> emit, String type) async {
    this.type = type;
    await handleFetchCards(emit, 1, true);
  }

  Future<void> handleMinionTypeFilterChangedEvent(Emitter<CardGalleryState> emit, String minionType) async {
    this.minionType = minionType;
    await handleFetchCards(emit, 1, true);
  }

  Future<void> handleSpellSchoolFilterChangedEvent(Emitter<CardGalleryState> emit, String spellSchool) async {
    this.spellSchool = spellSchool;
    await handleFetchCards(emit, 1, true);
  }

  Future<void> handleRarityFilterChangedEvent(Emitter<CardGalleryState> emit, String rarity) async {
    this.rarity = rarity;
    await handleFetchCards(emit, 1, true);
  }

  Future<void> handleKeywordFilterChangedEvent(Emitter<CardGalleryState> emit, String keyword) async {
    this.keyword = keyword;
    await handleFetchCards(emit, 1, true);
  }
}
