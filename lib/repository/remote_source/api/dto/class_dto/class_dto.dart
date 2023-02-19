import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_dto.freezed.dart';
part 'class_dto.g.dart';

@freezed
class ClassDTO with _$ClassDTO {
  const factory ClassDTO({
    required int id,
    required String slug,
    required String? name,
  }) = _ClassDTO;

  factory ClassDTO.fromJson(Map<String, dynamic> json) =>
      _$ClassDTOFromJson(json);
}
