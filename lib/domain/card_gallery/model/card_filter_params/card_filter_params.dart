import "package:freezed_annotation/freezed_annotation.dart";

part "card_filter_params.freezed.dart";

@freezed
class CardFilterParams with _$CardFilterParams {
  const factory CardFilterParams({
    @Default(0) int? pageSize,
    @Default(0) num? page,
    @Default("en_US") String locale,
    @Default("standard") String set,
    @Default([]) List<String> heroClass,
    @Default("") String manaCost,
    @Default("") String attack,
    @Default("") String health,
    @Default("1") String collectible,
    @Default("") String rarity,
    @Default("") String type,
    @Default("") String minionType,
    @Default("") String keyword,
    @Default("") String textFilter,
    @Default("constructed") String gameMode,
    @Default("") String spellSchool,
    @Default("manaCost:asc") String sort,
  }) = _CardFilterParams;
}
