import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:decksly/common/dev/logger.dart';
import 'package:decksly/common/util/failures.dart';
import 'package:decksly/common/util/network_info.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filter_params/card_filter_params.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filters/card_class.dart';
import 'package:decksly/features/card_gallery/domain/model/cards_page/cards_page.dart';
import 'package:decksly/features/card_gallery/domain/usecase/fetch_cards_usecase.dart';
import 'package:decksly/features/deck_builder/domain/model/deck_class.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

part 'card_gallery_bloc.freezed.dart';

part 'card_gallery_event.dart';

part 'card_gallery_state.dart';

@injectable
class CardGalleryBloc extends Bloc<CardGalleryEvent, CardGalleryState> {
  CardGalleryBloc(this._networkInfo, this.fetchCardsUsecase)
      : super(const CardGalleryState.initial(cardFilterParams: CardFilterParams(), page: CardsPage())) {
    on<FetchCardsEvent>((event, emit) => handleFetchCards(emit, event.cardFilterParams));

    on<CardFilterParamsChangedEvent>((event, emit) => handleCardFilterParamsChanged(emit, event.cardFilterParams));
    on<LocaleChangedEvent>((event, emit) => handleLocaleChanged(emit, event.cardFilterParams));
    on<ToggleClassCardsEvent>((event, emit) => handleToggleClassCards(emit, event.deckCLass));
    on<ToggleNeutralCardsEvent>((event, emit) => handleToggleNeutralCards(emit, event.deckCLass));
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
        emit(CardGalleryState.failure(failure: failure, cardFilterParams: updatedParams));
      },
      (cards) {
        emit(CardGalleryState.fetched(cardFilterParams: updatedParams, page: cards));
      },
    );
  }

  Future<void> handleCardFilterParamsChanged(Emitter<CardGalleryState> emit, CardFilterParams cardFilterParams) async {
    emit(CardGalleryState.fetching(cardFilterParams: cardFilterParams.copyWith(page: 0)));
  }

  Future<void> handleLocaleChanged(Emitter<CardGalleryState> emit, CardFilterParams cardFilterParams) async {
    emit(CardGalleryState.localeChanged(cardFilterParams: cardFilterParams.copyWith(page: 0)));
  }

  Future<void> handleToggleClassCards(Emitter<CardGalleryState> emit, DeckClass deckClass) async {
    List<String> classes = [];
    classes.addAll(state.cardFilterParams.heroClass);
    if (classes.contains(deckClass.name) && classes.length == 1) {
      classes.remove(deckClass.name);
      classes.add(CardClass.neutral.value);
    } else if (classes.contains(deckClass.name) && classes.length > 1) {
      classes.remove(deckClass.name);
    } else {
      classes.add(deckClass.name);
    }
    emit(CardGalleryState.fetching(cardFilterParams: state.cardFilterParams.copyWith(heroClass: classes, page: 0)));
  }

  Future<void> handleToggleNeutralCards(Emitter<CardGalleryState> emit, DeckClass deckClass) async {
    List<String> classes = [];
    classes.addAll(state.cardFilterParams.heroClass);
    if (classes.contains(CardClass.neutral.value) && classes.length == 1) {
      classes.remove(CardClass.neutral.value);
      classes.add(deckClass.name);
    } else if (classes.contains(CardClass.neutral.value) && classes.length > 1) {
      classes.remove(CardClass.neutral.value);
    } else {
      classes.add(CardClass.neutral.value);
    }
    emit(CardGalleryState.fetching(cardFilterParams: state.cardFilterParams.copyWith(heroClass: classes, page: 0)));
  }
}
