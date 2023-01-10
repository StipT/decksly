// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duels_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DuelsDTO _$DuelsDTOFromJson(Map<String, dynamic> json) {
  return _DuelsDTO.fromJson(json);
}

/// @nodoc
mixin _$DuelsDTO {
  bool? get relevant => throw _privateConstructorUsedError;
  bool? get constructed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DuelsDTOCopyWith<DuelsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DuelsDTOCopyWith<$Res> {
  factory $DuelsDTOCopyWith(DuelsDTO value, $Res Function(DuelsDTO) then) =
      _$DuelsDTOCopyWithImpl<$Res, DuelsDTO>;
  @useResult
  $Res call({bool? relevant, bool? constructed});
}

/// @nodoc
class _$DuelsDTOCopyWithImpl<$Res, $Val extends DuelsDTO>
    implements $DuelsDTOCopyWith<$Res> {
  _$DuelsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relevant = freezed,
    Object? constructed = freezed,
  }) {
    return _then(_value.copyWith(
      relevant: freezed == relevant
          ? _value.relevant
          : relevant // ignore: cast_nullable_to_non_nullable
              as bool?,
      constructed: freezed == constructed
          ? _value.constructed
          : constructed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DuelsDTOCopyWith<$Res> implements $DuelsDTOCopyWith<$Res> {
  factory _$$_DuelsDTOCopyWith(
          _$_DuelsDTO value, $Res Function(_$_DuelsDTO) then) =
      __$$_DuelsDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? relevant, bool? constructed});
}

/// @nodoc
class __$$_DuelsDTOCopyWithImpl<$Res>
    extends _$DuelsDTOCopyWithImpl<$Res, _$_DuelsDTO>
    implements _$$_DuelsDTOCopyWith<$Res> {
  __$$_DuelsDTOCopyWithImpl(
      _$_DuelsDTO _value, $Res Function(_$_DuelsDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relevant = freezed,
    Object? constructed = freezed,
  }) {
    return _then(_$_DuelsDTO(
      relevant: freezed == relevant
          ? _value.relevant
          : relevant // ignore: cast_nullable_to_non_nullable
              as bool?,
      constructed: freezed == constructed
          ? _value.constructed
          : constructed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DuelsDTO implements _DuelsDTO {
  const _$_DuelsDTO({required this.relevant, required this.constructed});

  factory _$_DuelsDTO.fromJson(Map<String, dynamic> json) =>
      _$$_DuelsDTOFromJson(json);

  @override
  final bool? relevant;
  @override
  final bool? constructed;

  @override
  String toString() {
    return 'DuelsDTO(relevant: $relevant, constructed: $constructed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DuelsDTO &&
            (identical(other.relevant, relevant) ||
                other.relevant == relevant) &&
            (identical(other.constructed, constructed) ||
                other.constructed == constructed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, relevant, constructed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DuelsDTOCopyWith<_$_DuelsDTO> get copyWith =>
      __$$_DuelsDTOCopyWithImpl<_$_DuelsDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DuelsDTOToJson(
      this,
    );
  }
}

abstract class _DuelsDTO implements DuelsDTO {
  const factory _DuelsDTO(
      {required final bool? relevant,
      required final bool? constructed}) = _$_DuelsDTO;

  factory _DuelsDTO.fromJson(Map<String, dynamic> json) = _$_DuelsDTO.fromJson;

  @override
  bool? get relevant;
  @override
  bool? get constructed;
  @override
  @JsonKey(ignore: true)
  _$$_DuelsDTOCopyWith<_$_DuelsDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
