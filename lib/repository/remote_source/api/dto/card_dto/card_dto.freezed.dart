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

  int get cardSetId => throw _privateConstructorUsedError;

  int get classId => throw _privateConstructorUsedError;

  int? get parentId => throw _privateConstructorUsedError;

  int get cardTypeId => throw _privateConstructorUsedError;

  int get rarityId => throw _privateConstructorUsedError;

  int get collectible => throw _privateConstructorUsedError;

  String? get slug => throw _privateConstructorUsedError;

  String get name => throw _privateConstructorUsedError;

  String? get artistName => throw _privateConstructorUsedError;

  String? get text => throw _privateConstructorUsedError;

  String get image => throw _privateConstructorUsedError;

  String get imageGold => throw _privateConstructorUsedError;

  String? get flavorText => throw _privateConstructorUsedError;

  String? get cropImage => throw _privateConstructorUsedError;

  int get manaCost => throw _privateConstructorUsedError;

  DuelsDTO? get duels => throw _privateConstructorUsedError;

  RuneCostDTO? get runeCost => throw _privateConstructorUsedError;

  List<int>? get keywordIds => throw _privateConstructorUsedError;

  List<int>? get childIds => throw _privateConstructorUsedError;

  int? get spellSchoolId => throw _privateConstructorUsedError;

  List<int>? get multiClassIds => throw _privateConstructorUsedError;

  List<int>? get multiTypeIds => throw _privateConstructorUsedError;

  int? get copyOfCardId => throw _privateConstructorUsedError;

  int? get minionTypeId => throw _privateConstructorUsedError;

  int? get health => throw _privateConstructorUsedError;

  int? get attack => throw _privateConstructorUsedError;

  int? get armor => throw _privateConstructorUsedError;

  int? get durability => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardDTOCopyWith<CardDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardDTOCopyWith<$Res> {
  factory $CardDTOCopyWith(CardDTO value, $Res Function(CardDTO) then) = _$CardDTOCopyWithImpl<$Res, CardDTO>;

  @useResult
  $Res call(
      {int id,
      int cardSetId,
      int classId,
      int? parentId,
      int cardTypeId,
      int rarityId,
      int collectible,
      String? slug,
      String name,
      String? artistName,
      String? text,
      String image,
      String imageGold,
      String? flavorText,
      String? cropImage,
      int manaCost,
      DuelsDTO? duels,
      RuneCostDTO? runeCost,
      List<int>? keywordIds,
      List<int>? childIds,
      int? spellSchoolId,
      List<int>? multiClassIds,
      List<int>? multiTypeIds,
      int? copyOfCardId,
      int? minionTypeId,
      int? health,
      int? attack,
      int? armor,
      int? durability});

  $DuelsDTOCopyWith<$Res>? get duels;

  $RuneCostDTOCopyWith<$Res>? get runeCost;
}

/// @nodoc
class _$CardDTOCopyWithImpl<$Res, $Val extends CardDTO> implements $CardDTOCopyWith<$Res> {
  _$CardDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cardSetId = null,
    Object? classId = null,
    Object? parentId = freezed,
    Object? cardTypeId = null,
    Object? rarityId = null,
    Object? collectible = null,
    Object? slug = freezed,
    Object? name = null,
    Object? artistName = freezed,
    Object? text = freezed,
    Object? image = null,
    Object? imageGold = null,
    Object? flavorText = freezed,
    Object? cropImage = freezed,
    Object? manaCost = null,
    Object? duels = freezed,
    Object? runeCost = freezed,
    Object? keywordIds = freezed,
    Object? childIds = freezed,
    Object? spellSchoolId = freezed,
    Object? multiClassIds = freezed,
    Object? multiTypeIds = freezed,
    Object? copyOfCardId = freezed,
    Object? minionTypeId = freezed,
    Object? health = freezed,
    Object? attack = freezed,
    Object? armor = freezed,
    Object? durability = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cardSetId: null == cardSetId
          ? _value.cardSetId
          : cardSetId // ignore: cast_nullable_to_non_nullable
              as int,
      classId: null == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      cardTypeId: null == cardTypeId
          ? _value.cardTypeId
          : cardTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      rarityId: null == rarityId
          ? _value.rarityId
          : rarityId // ignore: cast_nullable_to_non_nullable
              as int,
      collectible: null == collectible
          ? _value.collectible
          : collectible // ignore: cast_nullable_to_non_nullable
              as int,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: freezed == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      imageGold: null == imageGold
          ? _value.imageGold
          : imageGold // ignore: cast_nullable_to_non_nullable
              as String,
      flavorText: freezed == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String?,
      cropImage: freezed == cropImage
          ? _value.cropImage
          : cropImage // ignore: cast_nullable_to_non_nullable
              as String?,
      manaCost: null == manaCost
          ? _value.manaCost
          : manaCost // ignore: cast_nullable_to_non_nullable
              as int,
      duels: freezed == duels
          ? _value.duels
          : duels // ignore: cast_nullable_to_non_nullable
              as DuelsDTO?,
      runeCost: freezed == runeCost
          ? _value.runeCost
          : runeCost // ignore: cast_nullable_to_non_nullable
              as RuneCostDTO?,
      keywordIds: freezed == keywordIds
          ? _value.keywordIds
          : keywordIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      childIds: freezed == childIds
          ? _value.childIds
          : childIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      spellSchoolId: freezed == spellSchoolId
          ? _value.spellSchoolId
          : spellSchoolId // ignore: cast_nullable_to_non_nullable
              as int?,
      multiClassIds: freezed == multiClassIds
          ? _value.multiClassIds
          : multiClassIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      multiTypeIds: freezed == multiTypeIds
          ? _value.multiTypeIds
          : multiTypeIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      copyOfCardId: freezed == copyOfCardId
          ? _value.copyOfCardId
          : copyOfCardId // ignore: cast_nullable_to_non_nullable
              as int?,
      minionTypeId: freezed == minionTypeId
          ? _value.minionTypeId
          : minionTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      health: freezed == health
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as int?,
      attack: freezed == attack
          ? _value.attack
          : attack // ignore: cast_nullable_to_non_nullable
              as int?,
      armor: freezed == armor
          ? _value.armor
          : armor // ignore: cast_nullable_to_non_nullable
              as int?,
      durability: freezed == durability
          ? _value.durability
          : durability // ignore: cast_nullable_to_non_nullable
              as int?,
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

  @override
  @pragma('vm:prefer-inline')
  $RuneCostDTOCopyWith<$Res>? get runeCost {
    if (_value.runeCost == null) {
      return null;
    }

    return $RuneCostDTOCopyWith<$Res>(_value.runeCost!, (value) {
      return _then(_value.copyWith(runeCost: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CardDTOCopyWith<$Res> implements $CardDTOCopyWith<$Res> {
  factory _$$_CardDTOCopyWith(_$_CardDTO value, $Res Function(_$_CardDTO) then) = __$$_CardDTOCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {int id,
      int cardSetId,
      int classId,
      int? parentId,
      int cardTypeId,
      int rarityId,
      int collectible,
      String? slug,
      String name,
      String? artistName,
      String? text,
      String image,
      String imageGold,
      String? flavorText,
      String? cropImage,
      int manaCost,
      DuelsDTO? duels,
      RuneCostDTO? runeCost,
      List<int>? keywordIds,
      List<int>? childIds,
      int? spellSchoolId,
      List<int>? multiClassIds,
      List<int>? multiTypeIds,
      int? copyOfCardId,
      int? minionTypeId,
      int? health,
      int? attack,
      int? armor,
      int? durability});

  @override
  $DuelsDTOCopyWith<$Res>? get duels;

  @override
  $RuneCostDTOCopyWith<$Res>? get runeCost;
}

/// @nodoc
class __$$_CardDTOCopyWithImpl<$Res> extends _$CardDTOCopyWithImpl<$Res, _$_CardDTO>
    implements _$$_CardDTOCopyWith<$Res> {
  __$$_CardDTOCopyWithImpl(_$_CardDTO _value, $Res Function(_$_CardDTO) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cardSetId = null,
    Object? classId = null,
    Object? parentId = freezed,
    Object? cardTypeId = null,
    Object? rarityId = null,
    Object? collectible = null,
    Object? slug = freezed,
    Object? name = null,
    Object? artistName = freezed,
    Object? text = freezed,
    Object? image = null,
    Object? imageGold = null,
    Object? flavorText = freezed,
    Object? cropImage = freezed,
    Object? manaCost = null,
    Object? duels = freezed,
    Object? runeCost = freezed,
    Object? keywordIds = freezed,
    Object? childIds = freezed,
    Object? spellSchoolId = freezed,
    Object? multiClassIds = freezed,
    Object? multiTypeIds = freezed,
    Object? copyOfCardId = freezed,
    Object? minionTypeId = freezed,
    Object? health = freezed,
    Object? attack = freezed,
    Object? armor = freezed,
    Object? durability = freezed,
  }) {
    return _then(_$_CardDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cardSetId: null == cardSetId
          ? _value.cardSetId
          : cardSetId // ignore: cast_nullable_to_non_nullable
              as int,
      classId: null == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      cardTypeId: null == cardTypeId
          ? _value.cardTypeId
          : cardTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      rarityId: null == rarityId
          ? _value.rarityId
          : rarityId // ignore: cast_nullable_to_non_nullable
              as int,
      collectible: null == collectible
          ? _value.collectible
          : collectible // ignore: cast_nullable_to_non_nullable
              as int,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: freezed == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      imageGold: null == imageGold
          ? _value.imageGold
          : imageGold // ignore: cast_nullable_to_non_nullable
              as String,
      flavorText: freezed == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String?,
      cropImage: freezed == cropImage
          ? _value.cropImage
          : cropImage // ignore: cast_nullable_to_non_nullable
              as String?,
      manaCost: null == manaCost
          ? _value.manaCost
          : manaCost // ignore: cast_nullable_to_non_nullable
              as int,
      duels: freezed == duels
          ? _value.duels
          : duels // ignore: cast_nullable_to_non_nullable
              as DuelsDTO?,
      runeCost: freezed == runeCost
          ? _value.runeCost
          : runeCost // ignore: cast_nullable_to_non_nullable
              as RuneCostDTO?,
      keywordIds: freezed == keywordIds
          ? _value._keywordIds
          : keywordIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      childIds: freezed == childIds
          ? _value._childIds
          : childIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      spellSchoolId: freezed == spellSchoolId
          ? _value.spellSchoolId
          : spellSchoolId // ignore: cast_nullable_to_non_nullable
              as int?,
      multiClassIds: freezed == multiClassIds
          ? _value._multiClassIds
          : multiClassIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      multiTypeIds: freezed == multiTypeIds
          ? _value._multiTypeIds
          : multiTypeIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      copyOfCardId: freezed == copyOfCardId
          ? _value.copyOfCardId
          : copyOfCardId // ignore: cast_nullable_to_non_nullable
              as int?,
      minionTypeId: freezed == minionTypeId
          ? _value.minionTypeId
          : minionTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      health: freezed == health
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as int?,
      attack: freezed == attack
          ? _value.attack
          : attack // ignore: cast_nullable_to_non_nullable
              as int?,
      armor: freezed == armor
          ? _value.armor
          : armor // ignore: cast_nullable_to_non_nullable
              as int?,
      durability: freezed == durability
          ? _value.durability
          : durability // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardDTO implements _CardDTO {
  const _$_CardDTO(
      {required this.id,
      required this.cardSetId,
      required this.classId,
      required this.parentId,
      required this.cardTypeId,
      required this.rarityId,
      required this.collectible,
      required this.slug,
      required this.name,
      required this.artistName,
      required this.text,
      required this.image,
      required this.imageGold,
      required this.flavorText,
      required this.cropImage,
      required this.manaCost,
      required this.duels,
      required this.runeCost,
      required final List<int>? keywordIds,
      required final List<int>? childIds,
      required this.spellSchoolId,
      required final List<int>? multiClassIds,
      required final List<int>? multiTypeIds,
      required this.copyOfCardId,
      required this.minionTypeId,
      required this.health,
      required this.attack,
      required this.armor,
      required this.durability})
      : _keywordIds = keywordIds,
        _childIds = childIds,
        _multiClassIds = multiClassIds,
        _multiTypeIds = multiTypeIds;

  factory _$_CardDTO.fromJson(Map<String, dynamic> json) => _$$_CardDTOFromJson(json);

  @override
  final int id;
  @override
  final int cardSetId;
  @override
  final int classId;
  @override
  final int? parentId;
  @override
  final int cardTypeId;
  @override
  final int rarityId;
  @override
  final int collectible;
  @override
  final String? slug;
  @override
  final String name;
  @override
  final String? artistName;
  @override
  final String? text;
  @override
  final String image;
  @override
  final String imageGold;
  @override
  final String? flavorText;
  @override
  final String? cropImage;
  @override
  final int manaCost;
  @override
  final DuelsDTO? duels;
  @override
  final RuneCostDTO? runeCost;
  final List<int>? _keywordIds;

  @override
  List<int>? get keywordIds {
    final value = _keywordIds;
    if (value == null) return null;
    if (_keywordIds is EqualUnmodifiableListView) return _keywordIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _childIds;

  @override
  List<int>? get childIds {
    final value = _childIds;
    if (value == null) return null;
    if (_childIds is EqualUnmodifiableListView) return _childIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? spellSchoolId;
  final List<int>? _multiClassIds;

  @override
  List<int>? get multiClassIds {
    final value = _multiClassIds;
    if (value == null) return null;
    if (_multiClassIds is EqualUnmodifiableListView) return _multiClassIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _multiTypeIds;

  @override
  List<int>? get multiTypeIds {
    final value = _multiTypeIds;
    if (value == null) return null;
    if (_multiTypeIds is EqualUnmodifiableListView) return _multiTypeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? copyOfCardId;
  @override
  final int? minionTypeId;
  @override
  final int? health;
  @override
  final int? attack;
  @override
  final int? armor;
  @override
  final int? durability;

  @override
  String toString() {
    return 'CardDTO(id: $id, cardSetId: $cardSetId, classId: $classId, parentId: $parentId, cardTypeId: $cardTypeId, rarityId: $rarityId, collectible: $collectible, slug: $slug, name: $name, artistName: $artistName, text: $text, image: $image, imageGold: $imageGold, flavorText: $flavorText, cropImage: $cropImage, manaCost: $manaCost, duels: $duels, runeCost: $runeCost, keywordIds: $keywordIds, childIds: $childIds, spellSchoolId: $spellSchoolId, multiClassIds: $multiClassIds, multiTypeIds: $multiTypeIds, copyOfCardId: $copyOfCardId, minionTypeId: $minionTypeId, health: $health, attack: $attack, armor: $armor, durability: $durability)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cardSetId, cardSetId) || other.cardSetId == cardSetId) &&
            (identical(other.classId, classId) || other.classId == classId) &&
            (identical(other.parentId, parentId) || other.parentId == parentId) &&
            (identical(other.cardTypeId, cardTypeId) || other.cardTypeId == cardTypeId) &&
            (identical(other.rarityId, rarityId) || other.rarityId == rarityId) &&
            (identical(other.collectible, collectible) || other.collectible == collectible) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.artistName, artistName) || other.artistName == artistName) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.imageGold, imageGold) || other.imageGold == imageGold) &&
            (identical(other.flavorText, flavorText) || other.flavorText == flavorText) &&
            (identical(other.cropImage, cropImage) || other.cropImage == cropImage) &&
            (identical(other.manaCost, manaCost) || other.manaCost == manaCost) &&
            (identical(other.duels, duels) || other.duels == duels) &&
            (identical(other.runeCost, runeCost) || other.runeCost == runeCost) &&
            const DeepCollectionEquality().equals(other._keywordIds, _keywordIds) &&
            const DeepCollectionEquality().equals(other._childIds, _childIds) &&
            (identical(other.spellSchoolId, spellSchoolId) || other.spellSchoolId == spellSchoolId) &&
            const DeepCollectionEquality().equals(other._multiClassIds, _multiClassIds) &&
            const DeepCollectionEquality().equals(other._multiTypeIds, _multiTypeIds) &&
            (identical(other.copyOfCardId, copyOfCardId) || other.copyOfCardId == copyOfCardId) &&
            (identical(other.minionTypeId, minionTypeId) || other.minionTypeId == minionTypeId) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.attack, attack) || other.attack == attack) &&
            (identical(other.armor, armor) || other.armor == armor) &&
            (identical(other.durability, durability) || other.durability == durability));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        cardSetId,
        classId,
        parentId,
        cardTypeId,
        rarityId,
        collectible,
        slug,
        name,
        artistName,
        text,
        image,
        imageGold,
        flavorText,
        cropImage,
        manaCost,
        duels,
        runeCost,
        const DeepCollectionEquality().hash(_keywordIds),
        const DeepCollectionEquality().hash(_childIds),
        spellSchoolId,
        const DeepCollectionEquality().hash(_multiClassIds),
        const DeepCollectionEquality().hash(_multiTypeIds),
        copyOfCardId,
        minionTypeId,
        health,
        attack,
        armor,
        durability
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardDTOCopyWith<_$_CardDTO> get copyWith => __$$_CardDTOCopyWithImpl<_$_CardDTO>(this, _$identity);

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
      required final int cardSetId,
      required final int classId,
      required final int? parentId,
      required final int cardTypeId,
      required final int rarityId,
      required final int collectible,
      required final String? slug,
      required final String name,
      required final String? artistName,
      required final String? text,
      required final String image,
      required final String imageGold,
      required final String? flavorText,
      required final String? cropImage,
      required final int manaCost,
      required final DuelsDTO? duels,
      required final RuneCostDTO? runeCost,
      required final List<int>? keywordIds,
      required final List<int>? childIds,
      required final int? spellSchoolId,
      required final List<int>? multiClassIds,
      required final List<int>? multiTypeIds,
      required final int? copyOfCardId,
      required final int? minionTypeId,
      required final int? health,
      required final int? attack,
      required final int? armor,
      required final int? durability}) = _$_CardDTO;

  factory _CardDTO.fromJson(Map<String, dynamic> json) = _$_CardDTO.fromJson;

  @override
  int get id;

  @override
  int get cardSetId;

  @override
  int get classId;

  @override
  int? get parentId;

  @override
  int get cardTypeId;

  @override
  int get rarityId;

  @override
  int get collectible;

  @override
  String? get slug;

  @override
  String get name;

  @override
  String? get artistName;

  @override
  String? get text;

  @override
  String get image;

  @override
  String get imageGold;

  @override
  String? get flavorText;

  @override
  String? get cropImage;

  @override
  int get manaCost;

  @override
  DuelsDTO? get duels;

  @override
  RuneCostDTO? get runeCost;

  @override
  List<int>? get keywordIds;

  @override
  List<int>? get childIds;

  @override
  int? get spellSchoolId;

  @override
  List<int>? get multiClassIds;

  @override
  List<int>? get multiTypeIds;

  @override
  int? get copyOfCardId;

  @override
  int? get minionTypeId;

  @override
  int? get health;

  @override
  int? get attack;

  @override
  int? get armor;

  @override
  int? get durability;

  @override
  @JsonKey(ignore: true)
  _$$_CardDTOCopyWith<_$_CardDTO> get copyWith => throw _privateConstructorUsedError;
}
