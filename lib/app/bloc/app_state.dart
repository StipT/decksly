part of 'app_bloc.dart';

@Freezed()
class AppState with _$AppState {
  const factory AppState.initial({required String language}) = _AppStateInitial;
  const factory AppState.changed({required String language}) = _AppStateChanged;
  const factory AppState.failure({required String language, required Failure failure}) = _AppStateError;
}