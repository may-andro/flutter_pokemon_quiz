// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_favorite_pokemon_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddFavoritePokemonUseCaseFailure {
  Exception? get error => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception? error, StackTrace? stackTrace) server,
    required TResult Function(Exception? error, StackTrace? stackTrace) parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exception? error, StackTrace? stackTrace)? server,
    TResult Function(Exception? error, StackTrace? stackTrace)? parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception? error, StackTrace? stackTrace)? server,
    TResult Function(Exception? error, StackTrace? stackTrace)? parse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddFavoritePokemonLocalFailure value) server,
    required TResult Function(AddFavoritePokemonParseFailure value) parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddFavoritePokemonLocalFailure value)? server,
    TResult Function(AddFavoritePokemonParseFailure value)? parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddFavoritePokemonLocalFailure value)? server,
    TResult Function(AddFavoritePokemonParseFailure value)? parse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddFavoritePokemonUseCaseFailureCopyWith<AddFavoritePokemonUseCaseFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFavoritePokemonUseCaseFailureCopyWith<$Res> {
  factory $AddFavoritePokemonUseCaseFailureCopyWith(
          AddFavoritePokemonUseCaseFailure value,
          $Res Function(AddFavoritePokemonUseCaseFailure) then) =
      _$AddFavoritePokemonUseCaseFailureCopyWithImpl<$Res>;
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class _$AddFavoritePokemonUseCaseFailureCopyWithImpl<$Res>
    implements $AddFavoritePokemonUseCaseFailureCopyWith<$Res> {
  _$AddFavoritePokemonUseCaseFailureCopyWithImpl(this._value, this._then);

  final AddFavoritePokemonUseCaseFailure _value;
  // ignore: unused_field
  final $Res Function(AddFavoritePokemonUseCaseFailure) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc
abstract class _$$AddFavoritePokemonLocalFailureCopyWith<$Res>
    implements $AddFavoritePokemonUseCaseFailureCopyWith<$Res> {
  factory _$$AddFavoritePokemonLocalFailureCopyWith(
          _$AddFavoritePokemonLocalFailure value,
          $Res Function(_$AddFavoritePokemonLocalFailure) then) =
      __$$AddFavoritePokemonLocalFailureCopyWithImpl<$Res>;
  @override
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class __$$AddFavoritePokemonLocalFailureCopyWithImpl<$Res>
    extends _$AddFavoritePokemonUseCaseFailureCopyWithImpl<$Res>
    implements _$$AddFavoritePokemonLocalFailureCopyWith<$Res> {
  __$$AddFavoritePokemonLocalFailureCopyWithImpl(
      _$AddFavoritePokemonLocalFailure _value,
      $Res Function(_$AddFavoritePokemonLocalFailure) _then)
      : super(_value, (v) => _then(v as _$AddFavoritePokemonLocalFailure));

  @override
  _$AddFavoritePokemonLocalFailure get _value =>
      super._value as _$AddFavoritePokemonLocalFailure;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$AddFavoritePokemonLocalFailure(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$AddFavoritePokemonLocalFailure
    implements AddFavoritePokemonLocalFailure {
  const _$AddFavoritePokemonLocalFailure({this.error, this.stackTrace});

  @override
  final Exception? error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'AddFavoritePokemonUseCaseFailure.server(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFavoritePokemonLocalFailure &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  _$$AddFavoritePokemonLocalFailureCopyWith<_$AddFavoritePokemonLocalFailure>
      get copyWith => __$$AddFavoritePokemonLocalFailureCopyWithImpl<
          _$AddFavoritePokemonLocalFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception? error, StackTrace? stackTrace) server,
    required TResult Function(Exception? error, StackTrace? stackTrace) parse,
  }) {
    return server(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exception? error, StackTrace? stackTrace)? server,
    TResult Function(Exception? error, StackTrace? stackTrace)? parse,
  }) {
    return server?.call(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception? error, StackTrace? stackTrace)? server,
    TResult Function(Exception? error, StackTrace? stackTrace)? parse,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddFavoritePokemonLocalFailure value) server,
    required TResult Function(AddFavoritePokemonParseFailure value) parse,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddFavoritePokemonLocalFailure value)? server,
    TResult Function(AddFavoritePokemonParseFailure value)? parse,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddFavoritePokemonLocalFailure value)? server,
    TResult Function(AddFavoritePokemonParseFailure value)? parse,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class AddFavoritePokemonLocalFailure
    implements AddFavoritePokemonUseCaseFailure {
  const factory AddFavoritePokemonLocalFailure(
      {final Exception? error,
      final StackTrace? stackTrace}) = _$AddFavoritePokemonLocalFailure;

  @override
  Exception? get error => throw _privateConstructorUsedError;
  @override
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$AddFavoritePokemonLocalFailureCopyWith<_$AddFavoritePokemonLocalFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddFavoritePokemonParseFailureCopyWith<$Res>
    implements $AddFavoritePokemonUseCaseFailureCopyWith<$Res> {
  factory _$$AddFavoritePokemonParseFailureCopyWith(
          _$AddFavoritePokemonParseFailure value,
          $Res Function(_$AddFavoritePokemonParseFailure) then) =
      __$$AddFavoritePokemonParseFailureCopyWithImpl<$Res>;
  @override
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class __$$AddFavoritePokemonParseFailureCopyWithImpl<$Res>
    extends _$AddFavoritePokemonUseCaseFailureCopyWithImpl<$Res>
    implements _$$AddFavoritePokemonParseFailureCopyWith<$Res> {
  __$$AddFavoritePokemonParseFailureCopyWithImpl(
      _$AddFavoritePokemonParseFailure _value,
      $Res Function(_$AddFavoritePokemonParseFailure) _then)
      : super(_value, (v) => _then(v as _$AddFavoritePokemonParseFailure));

  @override
  _$AddFavoritePokemonParseFailure get _value =>
      super._value as _$AddFavoritePokemonParseFailure;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$AddFavoritePokemonParseFailure(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$AddFavoritePokemonParseFailure
    implements AddFavoritePokemonParseFailure {
  const _$AddFavoritePokemonParseFailure({this.error, this.stackTrace});

  @override
  final Exception? error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'AddFavoritePokemonUseCaseFailure.parse(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFavoritePokemonParseFailure &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  _$$AddFavoritePokemonParseFailureCopyWith<_$AddFavoritePokemonParseFailure>
      get copyWith => __$$AddFavoritePokemonParseFailureCopyWithImpl<
          _$AddFavoritePokemonParseFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Exception? error, StackTrace? stackTrace) server,
    required TResult Function(Exception? error, StackTrace? stackTrace) parse,
  }) {
    return parse(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Exception? error, StackTrace? stackTrace)? server,
    TResult Function(Exception? error, StackTrace? stackTrace)? parse,
  }) {
    return parse?.call(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Exception? error, StackTrace? stackTrace)? server,
    TResult Function(Exception? error, StackTrace? stackTrace)? parse,
    required TResult orElse(),
  }) {
    if (parse != null) {
      return parse(error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddFavoritePokemonLocalFailure value) server,
    required TResult Function(AddFavoritePokemonParseFailure value) parse,
  }) {
    return parse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddFavoritePokemonLocalFailure value)? server,
    TResult Function(AddFavoritePokemonParseFailure value)? parse,
  }) {
    return parse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddFavoritePokemonLocalFailure value)? server,
    TResult Function(AddFavoritePokemonParseFailure value)? parse,
    required TResult orElse(),
  }) {
    if (parse != null) {
      return parse(this);
    }
    return orElse();
  }
}

abstract class AddFavoritePokemonParseFailure
    implements AddFavoritePokemonUseCaseFailure {
  const factory AddFavoritePokemonParseFailure(
      {final Exception? error,
      final StackTrace? stackTrace}) = _$AddFavoritePokemonParseFailure;

  @override
  Exception? get error => throw _privateConstructorUsedError;
  @override
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$AddFavoritePokemonParseFailureCopyWith<_$AddFavoritePokemonParseFailure>
      get copyWith => throw _privateConstructorUsedError;
}
