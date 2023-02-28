// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rune_cost_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RuneCostDTO _$RuneCostDTOFromJson(Map<String, dynamic> json) {
  return _RuneCostDTO.fromJson(json);
}

/// @nodoc
mixin _$RuneCostDTO {
  int? get blood => throw _privateConstructorUsedError;
  int? get frost => throw _privateConstructorUsedError;
  int? get unholy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RuneCostDTOCopyWith<RuneCostDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuneCostDTOCopyWith<$Res> {
  factory $RuneCostDTOCopyWith(
          RuneCostDTO value, $Res Function(RuneCostDTO) then) =
      _$RuneCostDTOCopyWithImpl<$Res, RuneCostDTO>;
  @useResult
  $Res call({int? blood, int? frost, int? unholy});
}

/// @nodoc
class _$RuneCostDTOCopyWithImpl<$Res, $Val extends RuneCostDTO>
    implements $RuneCostDTOCopyWith<$Res> {
  _$RuneCostDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blood = freezed,
    Object? frost = freezed,
    Object? unholy = freezed,
  }) {
    return _then(_value.copyWith(
      blood: freezed == blood
          ? _value.blood
          : blood // ignore: cast_nullable_to_non_nullable
              as int?,
      frost: freezed == frost
          ? _value.frost
          : frost // ignore: cast_nullable_to_non_nullable
              as int?,
      unholy: freezed == unholy
          ? _value.unholy
          : unholy // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RuneCostDTOCopyWith<$Res>
    implements $RuneCostDTOCopyWith<$Res> {
  factory _$$_RuneCostDTOCopyWith(
          _$_RuneCostDTO value, $Res Function(_$_RuneCostDTO) then) =
      __$$_RuneCostDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? blood, int? frost, int? unholy});
}

/// @nodoc
class __$$_RuneCostDTOCopyWithImpl<$Res>
    extends _$RuneCostDTOCopyWithImpl<$Res, _$_RuneCostDTO>
    implements _$$_RuneCostDTOCopyWith<$Res> {
  __$$_RuneCostDTOCopyWithImpl(
      _$_RuneCostDTO _value, $Res Function(_$_RuneCostDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blood = freezed,
    Object? frost = freezed,
    Object? unholy = freezed,
  }) {
    return _then(_$_RuneCostDTO(
      blood: freezed == blood
          ? _value.blood
          : blood // ignore: cast_nullable_to_non_nullable
              as int?,
      frost: freezed == frost
          ? _value.frost
          : frost // ignore: cast_nullable_to_non_nullable
              as int?,
      unholy: freezed == unholy
          ? _value.unholy
          : unholy // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RuneCostDTO implements _RuneCostDTO {
  const _$_RuneCostDTO(
      {required this.blood, required this.frost, required this.unholy});

  factory _$_RuneCostDTO.fromJson(Map<String, dynamic> json) =>
      _$$_RuneCostDTOFromJson(json);

  @override
  final int? blood;
  @override
  final int? frost;
  @override
  final int? unholy;

  @override
  String toString() {
    return 'RuneCostDTO(blood: $blood, frost: $frost, unholy: $unholy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RuneCostDTO &&
            (identical(other.blood, blood) || other.blood == blood) &&
            (identical(other.frost, frost) || other.frost == frost) &&
            (identical(other.unholy, unholy) || other.unholy == unholy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, blood, frost, unholy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RuneCostDTOCopyWith<_$_RuneCostDTO> get copyWith =>
      __$$_RuneCostDTOCopyWithImpl<_$_RuneCostDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RuneCostDTOToJson(
      this,
    );
  }
}

abstract class _RuneCostDTO implements RuneCostDTO {
  const factory _RuneCostDTO(
      {required final int? blood,
      required final int? frost,
      required final int? unholy}) = _$_RuneCostDTO;

  factory _RuneCostDTO.fromJson(Map<String, dynamic> json) =
      _$_RuneCostDTO.fromJson;

  @override
  int? get blood;
  @override
  int? get frost;
  @override
  int? get unholy;
  @override
  @JsonKey(ignore: true)
  _$$_RuneCostDTOCopyWith<_$_RuneCostDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
