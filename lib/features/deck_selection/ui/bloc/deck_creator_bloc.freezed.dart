// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_selection_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeckCreatorState {
  String get deckCode => throw _privateConstructorUsedError;
  DeckType get deckType => throw _privateConstructorUsedError;
  DeckClass? get deckClass => throw _privateConstructorUsedError;
  String? get selectedDeckId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String deckCode, DeckType deckType,
            DeckClass? deckClass, String? selectedDeckId)
        initial,
    required TResult Function(String deckCode, DeckType deckType,
            DeckClass? deckClass, String? selectedDeckId)
        changed,
    required TResult Function(String deckCode, DeckType deckType,
            DeckClass? deckClass, String? selectedDeckId, Failure failure)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        initial,
    TResult? Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        changed,
    TResult? Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId, Failure failure)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        initial,
    TResult Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        changed,
    TResult Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId, Failure failure)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeckCreatorInitial value) initial,
    required TResult Function(_DeckCreatorChanged value) changed,
    required TResult Function(_DeckCreatorFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeckCreatorInitial value)? initial,
    TResult? Function(_DeckCreatorChanged value)? changed,
    TResult? Function(_DeckCreatorFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeckCreatorInitial value)? initial,
    TResult Function(_DeckCreatorChanged value)? changed,
    TResult Function(_DeckCreatorFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeckCreatorStateCopyWith<DeckSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckCreatorStateCopyWith<$Res> {
  factory $DeckCreatorStateCopyWith(
          DeckSelectionState value, $Res Function(DeckSelectionState) then) =
      _$DeckCreatorStateCopyWithImpl<$Res, DeckSelectionState>;
  @useResult
  $Res call(
      {String deckCode,
      DeckType deckType,
      DeckClass? deckClass,
      String? selectedDeckId});
}

/// @nodoc
class _$DeckCreatorStateCopyWithImpl<$Res, $Val extends DeckSelectionState>
    implements $DeckCreatorStateCopyWith<$Res> {
  _$DeckCreatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckCode = null,
    Object? deckType = null,
    Object? deckClass = freezed,
    Object? selectedDeckId = freezed,
  }) {
    return _then(_value.copyWith(
      deckCode: null == deckCode
          ? _value.deckCode
          : deckCode // ignore: cast_nullable_to_non_nullable
              as String,
      deckType: null == deckType
          ? _value.deckType
          : deckType // ignore: cast_nullable_to_non_nullable
              as DeckType,
      deckClass: freezed == deckClass
          ? _value.deckClass
          : deckClass // ignore: cast_nullable_to_non_nullable
              as DeckClass?,
      selectedDeckId: freezed == selectedDeckId
          ? _value.selectedDeckId
          : selectedDeckId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeckCreatorInitialCopyWith<$Res>
    implements $DeckCreatorStateCopyWith<$Res> {
  factory _$$_DeckCreatorInitialCopyWith(_$_DeckCreatorInitial value,
          $Res Function(_$_DeckCreatorInitial) then) =
      __$$_DeckCreatorInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deckCode,
      DeckType deckType,
      DeckClass? deckClass,
      String? selectedDeckId});
}

/// @nodoc
class __$$_DeckCreatorInitialCopyWithImpl<$Res>
    extends _$DeckCreatorStateCopyWithImpl<$Res, _$_DeckCreatorInitial>
    implements _$$_DeckCreatorInitialCopyWith<$Res> {
  __$$_DeckCreatorInitialCopyWithImpl(
      _$_DeckCreatorInitial _value, $Res Function(_$_DeckCreatorInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckCode = null,
    Object? deckType = null,
    Object? deckClass = freezed,
    Object? selectedDeckId = freezed,
  }) {
    return _then(_$_DeckCreatorInitial(
      deckCode: null == deckCode
          ? _value.deckCode
          : deckCode // ignore: cast_nullable_to_non_nullable
              as String,
      deckType: null == deckType
          ? _value.deckType
          : deckType // ignore: cast_nullable_to_non_nullable
              as DeckType,
      deckClass: freezed == deckClass
          ? _value.deckClass
          : deckClass // ignore: cast_nullable_to_non_nullable
              as DeckClass?,
      selectedDeckId: freezed == selectedDeckId
          ? _value.selectedDeckId
          : selectedDeckId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DeckCreatorInitial implements _DeckCreatorInitial {
  const _$_DeckCreatorInitial(
      {required this.deckCode,
      required this.deckType,
      required this.deckClass,
      required this.selectedDeckId});

  @override
  final String deckCode;
  @override
  final DeckType deckType;
  @override
  final DeckClass? deckClass;
  @override
  final String? selectedDeckId;

  @override
  String toString() {
    return 'DeckCreatorState.initial(deckCode: $deckCode, deckType: $deckType, deckClass: $deckClass, selectedDeckId: $selectedDeckId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckCreatorInitial &&
            (identical(other.deckCode, deckCode) ||
                other.deckCode == deckCode) &&
            (identical(other.deckType, deckType) ||
                other.deckType == deckType) &&
            (identical(other.deckClass, deckClass) ||
                other.deckClass == deckClass) &&
            (identical(other.selectedDeckId, selectedDeckId) ||
                other.selectedDeckId == selectedDeckId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, deckCode, deckType, deckClass, selectedDeckId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckCreatorInitialCopyWith<_$_DeckCreatorInitial> get copyWith =>
      __$$_DeckCreatorInitialCopyWithImpl<_$_DeckCreatorInitial>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String deckCode, DeckType deckType,
            DeckClass? deckClass, String? selectedDeckId)
        initial,
    required TResult Function(String deckCode, DeckType deckType,
            DeckClass? deckClass, String? selectedDeckId)
        changed,
    required TResult Function(String deckCode, DeckType deckType,
            DeckClass? deckClass, String? selectedDeckId, Failure failure)
        failure,
  }) {
    return initial(deckCode, deckType, deckClass, selectedDeckId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        initial,
    TResult? Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        changed,
    TResult? Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId, Failure failure)?
        failure,
  }) {
    return initial?.call(deckCode, deckType, deckClass, selectedDeckId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        initial,
    TResult Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        changed,
    TResult Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId, Failure failure)?
        failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(deckCode, deckType, deckClass, selectedDeckId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeckCreatorInitial value) initial,
    required TResult Function(_DeckCreatorChanged value) changed,
    required TResult Function(_DeckCreatorFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeckCreatorInitial value)? initial,
    TResult? Function(_DeckCreatorChanged value)? changed,
    TResult? Function(_DeckCreatorFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeckCreatorInitial value)? initial,
    TResult Function(_DeckCreatorChanged value)? changed,
    TResult Function(_DeckCreatorFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _DeckCreatorInitial implements DeckSelectionState {
  const factory _DeckCreatorInitial(
      {required final String deckCode,
      required final DeckType deckType,
      required final DeckClass? deckClass,
      required final String? selectedDeckId}) = _$_DeckCreatorInitial;

  @override
  String get deckCode;
  @override
  DeckType get deckType;
  @override
  DeckClass? get deckClass;
  @override
  String? get selectedDeckId;
  @override
  @JsonKey(ignore: true)
  _$$_DeckCreatorInitialCopyWith<_$_DeckCreatorInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeckCreatorChangedCopyWith<$Res>
    implements $DeckCreatorStateCopyWith<$Res> {
  factory _$$_DeckCreatorChangedCopyWith(_$_DeckCreatorChanged value,
          $Res Function(_$_DeckCreatorChanged) then) =
      __$$_DeckCreatorChangedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deckCode,
      DeckType deckType,
      DeckClass? deckClass,
      String? selectedDeckId});
}

/// @nodoc
class __$$_DeckCreatorChangedCopyWithImpl<$Res>
    extends _$DeckCreatorStateCopyWithImpl<$Res, _$_DeckCreatorChanged>
    implements _$$_DeckCreatorChangedCopyWith<$Res> {
  __$$_DeckCreatorChangedCopyWithImpl(
      _$_DeckCreatorChanged _value, $Res Function(_$_DeckCreatorChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckCode = null,
    Object? deckType = null,
    Object? deckClass = freezed,
    Object? selectedDeckId = freezed,
  }) {
    return _then(_$_DeckCreatorChanged(
      deckCode: null == deckCode
          ? _value.deckCode
          : deckCode // ignore: cast_nullable_to_non_nullable
              as String,
      deckType: null == deckType
          ? _value.deckType
          : deckType // ignore: cast_nullable_to_non_nullable
              as DeckType,
      deckClass: freezed == deckClass
          ? _value.deckClass
          : deckClass // ignore: cast_nullable_to_non_nullable
              as DeckClass?,
      selectedDeckId: freezed == selectedDeckId
          ? _value.selectedDeckId
          : selectedDeckId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DeckCreatorChanged implements _DeckCreatorChanged {
  const _$_DeckCreatorChanged(
      {required this.deckCode,
      required this.deckType,
      required this.deckClass,
      required this.selectedDeckId});

  @override
  final String deckCode;
  @override
  final DeckType deckType;
  @override
  final DeckClass? deckClass;
  @override
  final String? selectedDeckId;

  @override
  String toString() {
    return 'DeckCreatorState.changed(deckCode: $deckCode, deckType: $deckType, deckClass: $deckClass, selectedDeckId: $selectedDeckId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckCreatorChanged &&
            (identical(other.deckCode, deckCode) ||
                other.deckCode == deckCode) &&
            (identical(other.deckType, deckType) ||
                other.deckType == deckType) &&
            (identical(other.deckClass, deckClass) ||
                other.deckClass == deckClass) &&
            (identical(other.selectedDeckId, selectedDeckId) ||
                other.selectedDeckId == selectedDeckId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, deckCode, deckType, deckClass, selectedDeckId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckCreatorChangedCopyWith<_$_DeckCreatorChanged> get copyWith =>
      __$$_DeckCreatorChangedCopyWithImpl<_$_DeckCreatorChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String deckCode, DeckType deckType,
            DeckClass? deckClass, String? selectedDeckId)
        initial,
    required TResult Function(String deckCode, DeckType deckType,
            DeckClass? deckClass, String? selectedDeckId)
        changed,
    required TResult Function(String deckCode, DeckType deckType,
            DeckClass? deckClass, String? selectedDeckId, Failure failure)
        failure,
  }) {
    return changed(deckCode, deckType, deckClass, selectedDeckId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        initial,
    TResult? Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        changed,
    TResult? Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId, Failure failure)?
        failure,
  }) {
    return changed?.call(deckCode, deckType, deckClass, selectedDeckId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        initial,
    TResult Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        changed,
    TResult Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId, Failure failure)?
        failure,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(deckCode, deckType, deckClass, selectedDeckId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeckCreatorInitial value) initial,
    required TResult Function(_DeckCreatorChanged value) changed,
    required TResult Function(_DeckCreatorFailure value) failure,
  }) {
    return changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeckCreatorInitial value)? initial,
    TResult? Function(_DeckCreatorChanged value)? changed,
    TResult? Function(_DeckCreatorFailure value)? failure,
  }) {
    return changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeckCreatorInitial value)? initial,
    TResult Function(_DeckCreatorChanged value)? changed,
    TResult Function(_DeckCreatorFailure value)? failure,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(this);
    }
    return orElse();
  }
}

abstract class _DeckCreatorChanged implements DeckSelectionState {
  const factory _DeckCreatorChanged(
      {required final String deckCode,
      required final DeckType deckType,
      required final DeckClass? deckClass,
      required final String? selectedDeckId}) = _$_DeckCreatorChanged;

  @override
  String get deckCode;
  @override
  DeckType get deckType;
  @override
  DeckClass? get deckClass;
  @override
  String? get selectedDeckId;
  @override
  @JsonKey(ignore: true)
  _$$_DeckCreatorChangedCopyWith<_$_DeckCreatorChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeckCreatorFailureCopyWith<$Res>
    implements $DeckCreatorStateCopyWith<$Res> {
  factory _$$_DeckCreatorFailureCopyWith(_$_DeckCreatorFailure value,
          $Res Function(_$_DeckCreatorFailure) then) =
      __$$_DeckCreatorFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String deckCode,
      DeckType deckType,
      DeckClass? deckClass,
      String? selectedDeckId,
      Failure failure});
}

/// @nodoc
class __$$_DeckCreatorFailureCopyWithImpl<$Res>
    extends _$DeckCreatorStateCopyWithImpl<$Res, _$_DeckCreatorFailure>
    implements _$$_DeckCreatorFailureCopyWith<$Res> {
  __$$_DeckCreatorFailureCopyWithImpl(
      _$_DeckCreatorFailure _value, $Res Function(_$_DeckCreatorFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckCode = null,
    Object? deckType = null,
    Object? deckClass = freezed,
    Object? selectedDeckId = freezed,
    Object? failure = null,
  }) {
    return _then(_$_DeckCreatorFailure(
      deckCode: null == deckCode
          ? _value.deckCode
          : deckCode // ignore: cast_nullable_to_non_nullable
              as String,
      deckType: null == deckType
          ? _value.deckType
          : deckType // ignore: cast_nullable_to_non_nullable
              as DeckType,
      deckClass: freezed == deckClass
          ? _value.deckClass
          : deckClass // ignore: cast_nullable_to_non_nullable
              as DeckClass?,
      selectedDeckId: freezed == selectedDeckId
          ? _value.selectedDeckId
          : selectedDeckId // ignore: cast_nullable_to_non_nullable
              as String?,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_DeckCreatorFailure implements _DeckCreatorFailure {
  const _$_DeckCreatorFailure(
      {required this.deckCode,
      required this.deckType,
      required this.deckClass,
      required this.selectedDeckId,
      required this.failure});

  @override
  final String deckCode;
  @override
  final DeckType deckType;
  @override
  final DeckClass? deckClass;
  @override
  final String? selectedDeckId;
  @override
  final Failure failure;

  @override
  String toString() {
    return 'DeckCreatorState.failure(deckCode: $deckCode, deckType: $deckType, deckClass: $deckClass, selectedDeckId: $selectedDeckId, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeckCreatorFailure &&
            (identical(other.deckCode, deckCode) ||
                other.deckCode == deckCode) &&
            (identical(other.deckType, deckType) ||
                other.deckType == deckType) &&
            (identical(other.deckClass, deckClass) ||
                other.deckClass == deckClass) &&
            (identical(other.selectedDeckId, selectedDeckId) ||
                other.selectedDeckId == selectedDeckId) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, deckCode, deckType, deckClass, selectedDeckId, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckCreatorFailureCopyWith<_$_DeckCreatorFailure> get copyWith =>
      __$$_DeckCreatorFailureCopyWithImpl<_$_DeckCreatorFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String deckCode, DeckType deckType,
            DeckClass? deckClass, String? selectedDeckId)
        initial,
    required TResult Function(String deckCode, DeckType deckType,
            DeckClass? deckClass, String? selectedDeckId)
        changed,
    required TResult Function(String deckCode, DeckType deckType,
            DeckClass? deckClass, String? selectedDeckId, Failure failure)
        failure,
  }) {
    return failure(deckCode, deckType, deckClass, selectedDeckId, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        initial,
    TResult? Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        changed,
    TResult? Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId, Failure failure)?
        failure,
  }) {
    return failure?.call(
        deckCode, deckType, deckClass, selectedDeckId, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        initial,
    TResult Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId)?
        changed,
    TResult Function(String deckCode, DeckType deckType, DeckClass? deckClass,
            String? selectedDeckId, Failure failure)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(
          deckCode, deckType, deckClass, selectedDeckId, this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeckCreatorInitial value) initial,
    required TResult Function(_DeckCreatorChanged value) changed,
    required TResult Function(_DeckCreatorFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeckCreatorInitial value)? initial,
    TResult? Function(_DeckCreatorChanged value)? changed,
    TResult? Function(_DeckCreatorFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeckCreatorInitial value)? initial,
    TResult Function(_DeckCreatorChanged value)? changed,
    TResult Function(_DeckCreatorFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _DeckCreatorFailure implements DeckSelectionState {
  const factory _DeckCreatorFailure(
      {required final String deckCode,
      required final DeckType deckType,
      required final DeckClass? deckClass,
      required final String? selectedDeckId,
      required final Failure failure}) = _$_DeckCreatorFailure;

  @override
  String get deckCode;
  @override
  DeckType get deckType;
  @override
  DeckClass? get deckClass;
  @override
  String? get selectedDeckId;
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_DeckCreatorFailureCopyWith<_$_DeckCreatorFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
