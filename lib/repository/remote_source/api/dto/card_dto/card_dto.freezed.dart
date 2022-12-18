// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardDTO _$CardDTOFromJson(Map<String, dynamic> json) {
  return _CardDTO.fromJson(json);
}

/// @nodoc
mixin _$CardDTO {
  int get id => throw _privateConstructorUsedError;
  int get collectible => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  int get classId => throw _privateConstructorUsedError;
  List<int?>? get multiClassIds => throw _privateConstructorUsedError;
  int? get spellSchoolId => throw _privateConstructorUsedError;
  int get cardTypeId => throw _privateConstructorUsedError;
  int get cardSetId => throw _privateConstructorUsedError;
  int get rarityId => throw _privateConstructorUsedError;
  int get parentId => throw _privateConstructorUsedError;
  String get artistName => throw _privateConstructorUsedError;
  int get manaCost => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get imageGold => throw _privateConstructorUsedError;
  String get flavorText => throw _privateConstructorUsedError;
  String get cropImage => throw _privateConstructorUsedError;
  List<int?>? get keywordIds => throw _privateConstructorUsedError;
  List<int?>? get childIds => throw _privateConstructorUsedError;
  DuelsDTO? get duels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardDTOCopyWith<CardDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardDTOCopyWith<$Res> {
  factory $CardDTOCopyWith(CardDTO value, $Res Function(CardDTO) then) =
      _$CardDTOCopyWithImpl<$Res, CardDTO>;
  @useResult
  $Res call(
      {int id,
      int collectible,
      String slug,
      int classId,
      List<int?>? multiClassIds,
      int? spellSchoolId,
      int cardTypeId,
      int cardSetId,
      int rarityId,
      int parentId,
      String artistName,
      int manaCost,
      String name,
      String text,
      String image,
      String imageGold,
      String flavorText,
      String cropImage,
      List<int?>? keywordIds,
      List<int?>? childIds,
      DuelsDTO? duels});

  $DuelsDTOCopyWith<$Res>? get duels;
}

/// @nodoc
class _$CardDTOCopyWithImpl<$Res, $Val extends CardDTO>
    implements $CardDTOCopyWith<$Res> {
  _$CardDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collectible = null,
    Object? slug = null,
    Object? classId = null,
    Object? multiClassIds = freezed,
    Object? spellSchoolId = freezed,
    Object? cardTypeId = null,
    Object? cardSetId = null,
    Object? rarityId = null,
    Object? parentId = null,
    Object? artistName = null,
    Object? manaCost = null,
    Object? name = null,
    Object? text = null,
    Object? image = null,
    Object? imageGold = null,
    Object? flavorText = null,
    Object? cropImage = null,
    Object? keywordIds = freezed,
    Object? childIds = freezed,
    Object? duels = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      collectible: null == collectible
          ? _value.collectible
          : collectible // ignore: cast_nullable_to_non_nullable
              as int,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      classId: null == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as int,
      multiClassIds: freezed == multiClassIds
          ? _value.multiClassIds
          : multiClassIds // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      spellSchoolId: freezed == spellSchoolId
          ? _value.spellSchoolId
          : spellSchoolId // ignore: cast_nullable_to_non_nullable
              as int?,
      cardTypeId: null == cardTypeId
          ? _value.cardTypeId
          : cardTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      cardSetId: null == cardSetId
          ? _value.cardSetId
          : cardSetId // ignore: cast_nullable_to_non_nullable
              as int,
      rarityId: null == rarityId
          ? _value.rarityId
          : rarityId // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      manaCost: null == manaCost
          ? _value.manaCost
          : manaCost // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      imageGold: null == imageGold
          ? _value.imageGold
          : imageGold // ignore: cast_nullable_to_non_nullable
              as String,
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
      cropImage: null == cropImage
          ? _value.cropImage
          : cropImage // ignore: cast_nullable_to_non_nullable
              as String,
      keywordIds: freezed == keywordIds
          ? _value.keywordIds
          : keywordIds // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      childIds: freezed == childIds
          ? _value.childIds
          : childIds // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      duels: freezed == duels
          ? _value.duels
          : duels // ignore: cast_nullable_to_non_nullable
              as DuelsDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DuelsDTOCopyWith<$Res>? get duels {
    if (_value.duels == null) {
      return null;
    }

    return $DuelsDTOCopyWith<$Res>(_value.duels!, (value) {
      return _then(_value.copyWith(duels: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CardDTOCopyWith<$Res> implements $CardDTOCopyWith<$Res> {
  factory _$$_CardDTOCopyWith(
          _$_CardDTO value, $Res Function(_$_CardDTO) then) =
      __$$_CardDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int collectible,
      String slug,
      int classId,
      List<int?>? multiClassIds,
      int? spellSchoolId,
      int cardTypeId,
      int cardSetId,
      int rarityId,
      int parentId,
      String artistName,
      int manaCost,
      String name,
      String text,
      String image,
      String imageGold,
      String flavorText,
      String cropImage,
      List<int?>? keywordIds,
      List<int?>? childIds,
      DuelsDTO? duels});

  @override
  $DuelsDTOCopyWith<$Res>? get duels;
}

/// @nodoc
class __$$_CardDTOCopyWithImpl<$Res>
    extends _$CardDTOCopyWithImpl<$Res, _$_CardDTO>
    implements _$$_CardDTOCopyWith<$Res> {
  __$$_CardDTOCopyWithImpl(_$_CardDTO _value, $Res Function(_$_CardDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collectible = null,
    Object? slug = null,
    Object? classId = null,
    Object? multiClassIds = freezed,
    Object? spellSchoolId = freezed,
    Object? cardTypeId = null,
    Object? cardSetId = null,
    Object? rarityId = null,
    Object? parentId = null,
    Object? artistName = null,
    Object? manaCost = null,
    Object? name = null,
    Object? text = null,
    Object? image = null,
    Object? imageGold = null,
    Object? flavorText = null,
    Object? cropImage = null,
    Object? keywordIds = freezed,
    Object? childIds = freezed,
    Object? duels = freezed,
  }) {
    return _then(_$_CardDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      collectible: null == collectible
          ? _value.collectible
          : collectible // ignore: cast_nullable_to_non_nullable
              as int,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      classId: null == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as int,
      multiClassIds: freezed == multiClassIds
          ? _value._multiClassIds
          : multiClassIds // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      spellSchoolId: freezed == spellSchoolId
          ? _value.spellSchoolId
          : spellSchoolId // ignore: cast_nullable_to_non_nullable
              as int?,
      cardTypeId: null == cardTypeId
          ? _value.cardTypeId
          : cardTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      cardSetId: null == cardSetId
          ? _value.cardSetId
          : cardSetId // ignore: cast_nullable_to_non_nullable
              as int,
      rarityId: null == rarityId
          ? _value.rarityId
          : rarityId // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      manaCost: null == manaCost
          ? _value.manaCost
          : manaCost // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      imageGold: null == imageGold
          ? _value.imageGold
          : imageGold // ignore: cast_nullable_to_non_nullable
              as String,
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
      cropImage: null == cropImage
          ? _value.cropImage
          : cropImage // ignore: cast_nullable_to_non_nullable
              as String,
      keywordIds: freezed == keywordIds
          ? _value._keywordIds
          : keywordIds // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      childIds: freezed == childIds
          ? _value._childIds
          : childIds // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      duels: freezed == duels
          ? _value.duels
          : duels // ignore: cast_nullable_to_non_nullable
              as DuelsDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardDTO implements _CardDTO {
  const _$_CardDTO(
      {required this.id,
      required this.collectible,
      required this.slug,
      required this.classId,
      required final List<int?>? multiClassIds,
      required this.spellSchoolId,
      required this.cardTypeId,
      required this.cardSetId,
      required this.rarityId,
      required this.parentId,
      required this.artistName,
      required this.manaCost,
      required this.name,
      required this.text,
      required this.image,
      required this.imageGold,
      required this.flavorText,
      required this.cropImage,
      required final List<int?>? keywordIds,
      required final List<int?>? childIds,
      required this.duels})
      : _multiClassIds = multiClassIds,
        _keywordIds = keywordIds,
        _childIds = childIds;

  factory _$_CardDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CardDTOFromJson(json);

  @override
  final int id;
  @override
  final int collectible;
  @override
  final String slug;
  @override
  final int classId;
  final List<int?>? _multiClassIds;
  @override
  List<int?>? get multiClassIds {
    final value = _multiClassIds;
    if (value == null) return null;
    if (_multiClassIds is EqualUnmodifiableListView) return _multiClassIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? spellSchoolId;
  @override
  final int cardTypeId;
  @override
  final int cardSetId;
  @override
  final int rarityId;
  @override
  final int parentId;
  @override
  final String artistName;
  @override
  final int manaCost;
  @override
  final String name;
  @override
  final String text;
  @override
  final String image;
  @override
  final String imageGold;
  @override
  final String flavorText;
  @override
  final String cropImage;
  final List<int?>? _keywordIds;
  @override
  List<int?>? get keywordIds {
    final value = _keywordIds;
    if (value == null) return null;
    if (_keywordIds is EqualUnmodifiableListView) return _keywordIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int?>? _childIds;
  @override
  List<int?>? get childIds {
    final value = _childIds;
    if (value == null) return null;
    if (_childIds is EqualUnmodifiableListView) return _childIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DuelsDTO? duels;

  @override
  String toString() {
    return 'CardDTO(id: $id, collectible: $collectible, slug: $slug, classId: $classId, multiClassIds: $multiClassIds, spellSchoolId: $spellSchoolId, cardTypeId: $cardTypeId, cardSetId: $cardSetId, rarityId: $rarityId, parentId: $parentId, artistName: $artistName, manaCost: $manaCost, name: $name, text: $text, image: $image, imageGold: $imageGold, flavorText: $flavorText, cropImage: $cropImage, keywordIds: $keywordIds, childIds: $childIds, duels: $duels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.collectible, collectible) ||
                other.collectible == collectible) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.classId, classId) || other.classId == classId) &&
            const DeepCollectionEquality()
                .equals(other._multiClassIds, _multiClassIds) &&
            (identical(other.spellSchoolId, spellSchoolId) ||
                other.spellSchoolId == spellSchoolId) &&
            (identical(other.cardTypeId, cardTypeId) ||
                other.cardTypeId == cardTypeId) &&
            (identical(other.cardSetId, cardSetId) ||
                other.cardSetId == cardSetId) &&
            (identical(other.rarityId, rarityId) ||
                other.rarityId == rarityId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.manaCost, manaCost) ||
                other.manaCost == manaCost) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.imageGold, imageGold) ||
                other.imageGold == imageGold) &&
            (identical(other.flavorText, flavorText) ||
                other.flavorText == flavorText) &&
            (identical(other.cropImage, cropImage) ||
                other.cropImage == cropImage) &&
            const DeepCollectionEquality()
                .equals(other._keywordIds, _keywordIds) &&
            const DeepCollectionEquality().equals(other._childIds, _childIds) &&
            (identical(other.duels, duels) || other.duels == duels));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        collectible,
        slug,
        classId,
        const DeepCollectionEquality().hash(_multiClassIds),
        spellSchoolId,
        cardTypeId,
        cardSetId,
        rarityId,
        parentId,
        artistName,
        manaCost,
        name,
        text,
        image,
        imageGold,
        flavorText,
        cropImage,
        const DeepCollectionEquality().hash(_keywordIds),
        const DeepCollectionEquality().hash(_childIds),
        duels
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardDTOCopyWith<_$_CardDTO> get copyWith =>
      __$$_CardDTOCopyWithImpl<_$_CardDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardDTOToJson(
      this,
    );
  }
}

abstract class _CardDTO implements CardDTO {
  const factory _CardDTO(
      {required final int id,
      required final int collectible,
      required final String slug,
      required final int classId,
      required final List<int?>? multiClassIds,
      required final int? spellSchoolId,
      required final int cardTypeId,
      required final int cardSetId,
      required final int rarityId,
      required final int parentId,
      required final String artistName,
      required final int manaCost,
      required final String name,
      required final String text,
      required final String image,
      required final String imageGold,
      required final String flavorText,
      required final String cropImage,
      required final List<int?>? keywordIds,
      required final List<int?>? childIds,
      required final DuelsDTO? duels}) = _$_CardDTO;

  factory _CardDTO.fromJson(Map<String, dynamic> json) = _$_CardDTO.fromJson;

  @override
  int get id;
  @override
  int get collectible;
  @override
  String get slug;
  @override
  int get classId;
  @override
  List<int?>? get multiClassIds;
  @override
  int? get spellSchoolId;
  @override
  int get cardTypeId;
  @override
  int get cardSetId;
  @override
  int get rarityId;
  @override
  int get parentId;
  @override
  String get artistName;
  @override
  int get manaCost;
  @override
  String get name;
  @override
  String get text;
  @override
  String get image;
  @override
  String get imageGold;
  @override
  String get flavorText;
  @override
  String get cropImage;
  @override
  List<int?>? get keywordIds;
  @override
  List<int?>? get childIds;
  @override
  DuelsDTO? get duels;
  @override
  @JsonKey(ignore: true)
  _$$_CardDTOCopyWith<_$_CardDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
