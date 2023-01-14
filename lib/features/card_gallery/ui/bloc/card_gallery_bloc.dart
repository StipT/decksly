import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:decksly/common/dev/logger.dart';
import 'package:decksly/common/util/failures.dart';
import 'package:decksly/common/util/network_info.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filter_params.dart';
import 'package:decksly/features/card_gallery/domain/model/cards_page.dart';
import 'package:decksly/features/card_gallery/domain/usecase/fetch_cards_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

part 'card_gallery_event.dart';
part 'card_gallery_state.dart';

@injectable
class CardGalleryBloc extends Bloc<CardGalleryEvent, CardGalleryState> {
  CardGalleryBloc(this._networkInfo, {required this.fetchCardsUsecase}) : super(const CardsInitial()) {
    log("INITIAL BLOC ", level: Level.error);
    on<FetchCardsEvent>((event, emit) => handleFetchCards(emit, state.cardFilterParams));
    on<CardSetChangedEvent>((event, emit) async => await handleCardSetChanged(emit, event.set));
    on<CardClassChangedEvent>((event, emit) async => await handleCardClassChanged(emit, event.heroClass));
    on<ManaFilterChangedEvent>((event, emit) async => await handleManaFilterChangedEvent(emit, event.manaCost));
    on<SearchFilterChangedEvent>((event, emit) async => await handleSearchFilterChangedEvent(emit, event.textFilter));

    on<SortByChangedEvent>((event, emit) async => await handleSortByChangedEvent(emit, event.sortBy));
    on<AttackFilterChangedEvent>((event, emit) async => await handleAttackFilterChangedEvent(emit, event.attack));
    on<HealthFilterChangedEvent>((event, emit) async => await handleHealthFilterChangedEvent(emit, event.health));
    on<CardTypeFilterChangedEvent>((event, emit) async => await handleCardTypeFilterChangedEvent(emit, event.cardType));
    on<MinionTypeFilterChangedEvent>(
        (event, emit) async => await handleMinionTypeFilterChangedEvent(emit, event.minionType));
    on<SpellSchoolFilterChangedEvent>(
        (event, emit) async => await handleSpellSchoolFilterChangedEvent(emit, event.spellSchool));

    on<RarityFilterChangedEvent>((event, emit) async => await handleRarityFilterChangedEvent(emit, event.rarity));
    on<KeywordFilterChangedEvent>((event, emit) async => await handleKeywordFilterChangedEvent(emit, event.keyword));
    _streamInternetConnectionState();
  }

  final NetworkInfo _networkInfo;
  late final Stream<bool> internetConnectionState;
  final FetchCardsUsecase fetchCardsUsecase;

  void _streamInternetConnectionState() {
    internetConnectionState = _networkInfo.resultStream
        .map((result) => result != ConnectivityResult.none)
        .debounceTime(const Duration(milliseconds: 60));
  }

  Future<void> handleFetchCards(
    Emitter<CardGalleryState> emit,
    CardFilterParams cardFilterParams,
  ) async {
    final updatedParams = cardFilterParams.copyWith(page: cardFilterParams.page! + 1);
    final resultOrFailure = await fetchCardsUsecase(updatedParams);
    resultOrFailure.fold(
      (failure) {
        log(failure.message, level: Level.error);
        emit(CardsError(failure));
      },
      (cards) {
    //    log(state.cardFilterParams.toString(), level: Level.error);
        emit(CardsLoaded(cards, updatedParams));
      },
    );
  }

  Future<void> handleCardSetChanged(Emitter<CardGalleryState> emit, String set) async {
    final CardFilterParams params = state.cardFilterParams.copyWith(set: set, page: 0);
    await handleFetchCards(emit, params);
  }

  Future<void> handleCardClassChanged(Emitter<CardGalleryState> emit, String heroClass) async {
    final CardFilterParams params = state.cardFilterParams.copyWith(heroClass: heroClass, page: 0);
    await handleFetchCards(emit, params);
  }

  Future<void> handleManaFilterChangedEvent(Emitter<CardGalleryState> emit, String manaCost) async {
    final CardFilterParams params = state.cardFilterParams.copyWith(manaCost: manaCost, page: 0);
    await handleFetchCards(emit, params);
  }

  Future<void> handleSearchFilterChangedEvent(Emitter<CardGalleryState> emit, String textFilter) async {
    final CardFilterParams params = state.cardFilterParams.copyWith(textFilter: textFilter, page: 0);
    await handleFetchCards(emit, params);
  }

  Future<void> handleSortByChangedEvent(Emitter<CardGalleryState> emit, String sort) async {
    final CardFilterParams params = state.cardFilterParams.copyWith(sort: sort, page: 0);
    await handleFetchCards(emit, params);
  }

  Future<void> handleAttackFilterChangedEvent(Emitter<CardGalleryState> emit, String attack) async {
    final CardFilterParams params = state.cardFilterParams.copyWith(attack: attack, page: 0);
    await handleFetchCards(emit, params);
  }

  Future<void> handleHealthFilterChangedEvent(Emitter<CardGalleryState> emit, String health) async {
    final CardFilterParams params = state.cardFilterParams.copyWith(health: health, page: 0);
    await handleFetchCards(emit, params);
  }

  Future<void> handleCardTypeFilterChangedEvent(Emitter<CardGalleryState> emit, String type) async {
    final CardFilterParams params = state.cardFilterParams.copyWith(type: type, page: 0);
    await handleFetchCards(emit, params);
  }

  Future<void> handleMinionTypeFilterChangedEvent(Emitter<CardGalleryState> emit, String minionType) async {
    final CardFilterParams params = state.cardFilterParams.copyWith(minionType: minionType, page: 0);
    await handleFetchCards(emit, params);
  }

  Future<void> handleSpellSchoolFilterChangedEvent(Emitter<CardGalleryState> emit, String spellSchool) async {
    final CardFilterParams params = state.cardFilterParams.copyWith(spellSchool: spellSchool, page: 0);
    await handleFetchCards(emit, params);
  }

  Future<void> handleRarityFilterChangedEvent(Emitter<CardGalleryState> emit, String rarity) async {
    final CardFilterParams params = state.cardFilterParams.copyWith(rarity: rarity, page: 0);
    await handleFetchCards(emit, params);
  }

  Future<void> handleKeywordFilterChangedEvent(Emitter<CardGalleryState> emit, String keyword) async {
    final CardFilterParams params = state.cardFilterParams.copyWith(keyword: keyword, page: 0);
    await handleFetchCards(emit, params);
  }
}
