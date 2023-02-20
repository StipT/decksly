// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  String get language => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String language) initial,
    required TResult Function(String language) changed,
    required TResult Function(String language, Failure failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String language)? initial,
    TResult? Function(String language)? changed,
    TResult? Function(String language, Failure failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String language)? initial,
    TResult Function(String language)? changed,
    TResult Function(String language, Failure failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStateInitial value) initial,
    required TResult Function(_AppStateChanged value) changed,
    required TResult Function(_AppStateError value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppStateInitial value)? initial,
    TResult? Function(_AppStateChanged value)? changed,
    TResult? Function(_AppStateError value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStateInitial value)? initial,
    TResult Function(_AppStateChanged value)? changed,
    TResult Function(_AppStateError value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call({String language});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppStateInitialCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateInitialCopyWith(
          _$_AppStateInitial value, $Res Function(_$_AppStateInitial) then) =
      __$$_AppStateInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String language});
}

/// @nodoc
class __$$_AppStateInitialCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppStateInitial>
    implements _$$_AppStateInitialCopyWith<$Res> {
  __$$_AppStateInitialCopyWithImpl(
      _$_AppStateInitial _value, $Res Function(_$_AppStateInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_$_AppStateInitial(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppStateInitial implements _AppStateInitial {
  const _$_AppStateInitial({required this.language});

  @override
  final String language;

  @override
  String toString() {
    return 'AppState.initial(language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppStateInitial &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateInitialCopyWith<_$_AppStateInitial> get copyWith =>
      __$$_AppStateInitialCopyWithImpl<_$_AppStateInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String language) initial,
    required TResult Function(String language) changed,
    required TResult Function(String language, Failure failure) failure,
  }) {
    return initial(language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String language)? initial,
    TResult? Function(String language)? changed,
    TResult? Function(String language, Failure failure)? failure,
  }) {
    return initial?.call(language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String language)? initial,
    TResult Function(String language)? changed,
    TResult Function(String language, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(language);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStateInitial value) initial,
    required TResult Function(_AppStateChanged value) changed,
    required TResult Function(_AppStateError value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppStateInitial value)? initial,
    TResult? Function(_AppStateChanged value)? changed,
    TResult? Function(_AppStateError value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStateInitial value)? initial,
    TResult Function(_AppStateChanged value)? changed,
    TResult Function(_AppStateError value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AppStateInitial implements AppState {
  const factory _AppStateInitial({required final String language}) =
      _$_AppStateInitial;

  @override
  String get language;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateInitialCopyWith<_$_AppStateInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AppStateChangedCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateChangedCopyWith(
          _$_AppStateChanged value, $Res Function(_$_AppStateChanged) then) =
      __$$_AppStateChangedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String language});
}

/// @nodoc
class __$$_AppStateChangedCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppStateChanged>
    implements _$$_AppStateChangedCopyWith<$Res> {
  __$$_AppStateChangedCopyWithImpl(
      _$_AppStateChanged _value, $Res Function(_$_AppStateChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_$_AppStateChanged(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppStateChanged implements _AppStateChanged {
  const _$_AppStateChanged({required this.language});

  @override
  final String language;

  @override
  String toString() {
    return 'AppState.changed(language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppStateChanged &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateChangedCopyWith<_$_AppStateChanged> get copyWith =>
      __$$_AppStateChangedCopyWithImpl<_$_AppStateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String language) initial,
    required TResult Function(String language) changed,
    required TResult Function(String language, Failure failure) failure,
  }) {
    return changed(language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String language)? initial,
    TResult? Function(String language)? changed,
    TResult? Function(String language, Failure failure)? failure,
  }) {
    return changed?.call(language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String language)? initial,
    TResult Function(String language)? changed,
    TResult Function(String language, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(language);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStateInitial value) initial,
    required TResult Function(_AppStateChanged value) changed,
    required TResult Function(_AppStateError value) failure,
  }) {
    return changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppStateInitial value)? initial,
    TResult? Function(_AppStateChanged value)? changed,
    TResult? Function(_AppStateError value)? failure,
  }) {
    return changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStateInitial value)? initial,
    TResult Function(_AppStateChanged value)? changed,
    TResult Function(_AppStateError value)? failure,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(this);
    }
    return orElse();
  }
}

abstract class _AppStateChanged implements AppState {
  const factory _AppStateChanged({required final String language}) =
      _$_AppStateChanged;

  @override
  String get language;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateChangedCopyWith<_$_AppStateChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AppStateErrorCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateErrorCopyWith(
          _$_AppStateError value, $Res Function(_$_AppStateError) then) =
      __$$_AppStateErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String language, Failure failure});
}

/// @nodoc
class __$$_AppStateErrorCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppStateError>
    implements _$$_AppStateErrorCopyWith<$Res> {
  __$$_AppStateErrorCopyWithImpl(
      _$_AppStateError _value, $Res Function(_$_AppStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? failure = null,
  }) {
    return _then(_$_AppStateError(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_AppStateError implements _AppStateError {
  const _$_AppStateError({required this.language, required this.failure});

  @override
  final String language;
  @override
  final Failure failure;

  @override
  String toString() {
    return 'AppState.failure(language: $language, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppStateError &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateErrorCopyWith<_$_AppStateError> get copyWith =>
      __$$_AppStateErrorCopyWithImpl<_$_AppStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String language) initial,
    required TResult Function(String language) changed,
    required TResult Function(String language, Failure failure) failure,
  }) {
    return failure(language, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String language)? initial,
    TResult? Function(String language)? changed,
    TResult? Function(String language, Failure failure)? failure,
  }) {
    return failure?.call(language, this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String language)? initial,
    TResult Function(String language)? changed,
    TResult Function(String language, Failure failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(language, this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppStateInitial value) initial,
    required TResult Function(_AppStateChanged value) changed,
    required TResult Function(_AppStateError value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppStateInitial value)? initial,
    TResult? Function(_AppStateChanged value)? changed,
    TResult? Function(_AppStateError value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppStateInitial value)? initial,
    TResult Function(_AppStateChanged value)? changed,
    TResult Function(_AppStateError value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _AppStateError implements AppState {
  const factory _AppStateError(
      {required final String language,
      required final Failure failure}) = _$_AppStateError;

  @override
  String get language;
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateErrorCopyWith<_$_AppStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
