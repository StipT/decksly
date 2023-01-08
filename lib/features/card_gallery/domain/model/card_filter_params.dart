import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_filter_params.freezed.dart';

@freezed
class CardFilterParams with _$CardFilterParams {
  const factory CardFilterParams({
     int? pageSize,
     num? page,
     String? locale,
     String? set,
     String? heroClass,
     String? manaCost,
     String? attack,
     String? health,
     String? collectible,
     String? rarity,
     String? type,
     String? minionType,
     String? keyword,
     String? textFilter,
     String? gameMode,
     String? spellSchool,
     String? sort,
  }) = _CardFilterParams;
}