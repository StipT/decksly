part of 'app_bloc.dart';


@immutable
abstract class AppEvent {
  const AppEvent();
}

class LanguageChangedEvent extends AppEvent {
  const LanguageChangedEvent(this.language);
  final String language;
}
