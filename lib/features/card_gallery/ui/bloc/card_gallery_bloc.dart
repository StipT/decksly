import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:decksly/common/failures.dart';
import 'package:decksly/common/network_info.dart';
import 'package:decksly/features/card_gallery/domain/usecase/fetch_cards_usecase.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'card_gallery_event.dart';
part 'card_gallery_state.dart';

@injectable
class CardGalleryBloc extends Bloc<CardGalleryEvent, CardGalleryState> {
  CardGalleryBloc(this._networkInfo, {required this.fetchCardsUsecase})
      : super(const CardsInitial()) {
    on<FetchCardsEvent>((event, emit) => handleFetchCards(emit, event.page));
    _streamInternetConnectionState();
  }

  final NetworkInfo _networkInfo;
  late final Stream<bool> internetConnectionState;
  final FetchCardsUsecase fetchCardsUsecase;
  int _pageNumber = 1;

  void _streamInternetConnectionState() {
    internetConnectionState = _networkInfo.resultStream
        .map((result) => result != ConnectivityResult.none)
        .debounceTime(const Duration(milliseconds: 60));
  }

  Future<void> handleFetchCards(Emitter<CardGalleryState> emit, int pageKey) async {
    emit(const CardsLoading());
    if (pageKey == 0) {
      _pageNumber = 1;
    }
    final resultOrFailure = await fetchCardsUsecase(FetchCardsParams(_pageNumber, 'en'));
    resultOrFailure.fold(
      (failure) => emit(CardsError(failure)),
      (cards) {
        _pageNumber++;
        emit(CardsLoaded(cards));
      },
    );
  }
}
