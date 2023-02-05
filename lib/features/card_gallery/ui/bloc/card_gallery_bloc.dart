import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:decksly/common/dev/logger.dart';
import 'package:decksly/common/util/failures.dart';
import 'package:decksly/common/util/network_info.dart';
import 'package:decksly/features/card_gallery/domain/model/card_filter_params.dart';
import 'package:decksly/features/card_gallery/domain/model/cards_page.dart';
import 'package:decksly/features/card_gallery/domain/usecase/fetch_cards_usecase.dart';
import 'package:flutter/material.dart';
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
  CardGalleryBloc(this._networkInfo, {required this.fetchCardsUsecase})
      : super(const CardGalleryState.initial(cardFilterParams: CardFilterParams(), page: CardsPage())) {
    on<FetchCardsEvent>((event, emit) => handleFetchCards(emit, event.cardFilterParams));
    on<CardFilterParamsChangedEvent>(
        (event, emit) async => await handleCardFilterParamsChanged(emit, event.cardFilterParams));
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
}
