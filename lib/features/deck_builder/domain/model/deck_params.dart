import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck_params.freezed.dart';

@freezed
class DeckParams with _$DeckParams {
  const factory DeckParams({
    @Default("") String? ids,
    @Default("") String? code,
    @Default("") String? hero,
    @Default("en_US") String locale,
  }) = _DeckParams;
}