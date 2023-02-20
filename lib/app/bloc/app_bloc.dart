import 'package:decksly/common/util/failures.dart';
import 'package:decksly/features/card_gallery/domain/usecase/fetch_cards_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bloc.freezed.dart';

part 'app_event.dart';

part 'app_state.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.fetchCardsUsecase})
      : super(const AppState.initial(language: "en_US")) {
    on<LanguageChangedEvent>((event, emit) => handleLanguageChanged(emit, event.language));
  }

  final FetchCardsUsecase fetchCardsUsecase;

  Future<void> handleLanguageChanged(Emitter<AppState> emit, String language) async {
    emit(AppState.changed(language: language));
  }

}