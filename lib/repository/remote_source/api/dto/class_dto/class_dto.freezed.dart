// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClassDTO _$ClassDTOFromJson(Map<String, dynamic> json) {
  return _ClassDTO.fromJson(json);
}

/// @nodoc
mixin _$ClassDTO {
  int get id => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassDTOCopyWith<ClassDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassDTOCopyWith<$Res> {
  factory $ClassDTOCopyWith(ClassDTO value, $Res Function(ClassDTO) then) =
      _$ClassDTOCopyWithImpl<$Res, ClassDTO>;
  @useResult
  $Res call({int id, String slug, String? name});
}

/// @nodoc
class _$ClassDTOCopyWithImpl<$Res, $Val extends ClassDTO>
    implements $ClassDTOCopyWith<$Res> {
  _$ClassDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? slug = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClassDTOCopyWith<$Res> implements $ClassDTOCopyWith<$Res> {
  factory _$$_ClassDTOCopyWith(
          _$_ClassDTO value, $Res Function(_$_ClassDTO) then) =
      __$$_ClassDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String slug, String? name});
}

/// @nodoc
class __$$_ClassDTOCopyWithImpl<$Res>
    extends _$ClassDTOCopyWithImpl<$Res, _$_ClassDTO>
    implements _$$_ClassDTOCopyWith<$Res> {
  __$$_ClassDTOCopyWithImpl(
      _$_ClassDTO _value, $Res Function(_$_ClassDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? slug = null,
    Object? name = freezed,
  }) {
    return _then(_$_ClassDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClassDTO implements _ClassDTO {
  const _$_ClassDTO({required this.id, required this.slug, required this.name});

  factory _$_ClassDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ClassDTOFromJson(json);

  @override
  final int id;
  @override
  final String slug;
  @override
  final String? name;

  @override
  String toString() {
    return 'ClassDTO(id: $id, slug: $slug, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClassDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, slug, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClassDTOCopyWith<_$_ClassDTO> get copyWith =>
      __$$_ClassDTOCopyWithImpl<_$_ClassDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClassDTOToJson(
      this,
    );
  }
}

abstract class _ClassDTO implements ClassDTO {
  const factory _ClassDTO(
      {required final int id,
      required final String slug,
      required final String? name}) = _$_ClassDTO;

  factory _ClassDTO.fromJson(Map<String, dynamic> json) = _$_ClassDTO.fromJson;

  @override
  int get id;
  @override
  String get slug;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_ClassDTOCopyWith<_$_ClassDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
