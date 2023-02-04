import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_filter_params.freezed.dart';

@freezed
class CardFilterParams with _$CardFilterParams {
  const factory CardFilterParams({
     @Default(0) int? pageSize,
     @Default(0) num? page,
     @Default("en_US") String? locale,
     @Default("") String? set,
     @Default("") String? heroClass,
     @Default("") String? manaCost,
     @Default("") String? attack,
     @Default("") String? health,
     @Default("") String? collectible,
     @Default("") String? rarity,
     @Default("") String? type,
     @Default("") String? minionType,
     @Default("") String? keyword,
     @Default("") String? textFilter,
     @Default("standard") String? gameMode,
     @Default("") String? spellSchool,
     @Default("manaCost:asc") String? sort,
  }) = _CardFilterParams;
}