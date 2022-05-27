// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'remove_favorite_pokemon_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RemoveFavoritePokemonUseCaseFailure {
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
    required TResult Function(RemoveFavoritePokemonLocalFailure value) server,
    required TResult Function(RemoveFavoritePokemonParseFailure value) parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoveFavoritePokemonLocalFailure value)? server,
    TResult Function(RemoveFavoritePokemonParseFailure value)? parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFavoritePokemonLocalFailure value)? server,
    TResult Function(RemoveFavoritePokemonParseFailure value)? parse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RemoveFavoritePokemonUseCaseFailureCopyWith<
          RemoveFavoritePokemonUseCaseFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveFavoritePokemonUseCaseFailureCopyWith<$Res> {
  factory $RemoveFavoritePokemonUseCaseFailureCopyWith(
          RemoveFavoritePokemonUseCaseFailure value,
          $Res Function(RemoveFavoritePokemonUseCaseFailure) then) =
      _$RemoveFavoritePokemonUseCaseFailureCopyWithImpl<$Res>;
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class _$RemoveFavoritePokemonUseCaseFailureCopyWithImpl<$Res>
    implements $RemoveFavoritePokemonUseCaseFailureCopyWith<$Res> {
  _$RemoveFavoritePokemonUseCaseFailureCopyWithImpl(this._value, this._then);

  final RemoveFavoritePokemonUseCaseFailure _value;
  // ignore: unused_field
  final $Res Function(RemoveFavoritePokemonUseCaseFailure) _then;

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
abstract class _$$RemoveFavoritePokemonLocalFailureCopyWith<$Res>
    implements $RemoveFavoritePokemonUseCaseFailureCopyWith<$Res> {
  factory _$$RemoveFavoritePokemonLocalFailureCopyWith(
          _$RemoveFavoritePokemonLocalFailure value,
          $Res Function(_$RemoveFavoritePokemonLocalFailure) then) =
      __$$RemoveFavoritePokemonLocalFailureCopyWithImpl<$Res>;
  @override
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class __$$RemoveFavoritePokemonLocalFailureCopyWithImpl<$Res>
    extends _$RemoveFavoritePokemonUseCaseFailureCopyWithImpl<$Res>
    implements _$$RemoveFavoritePokemonLocalFailureCopyWith<$Res> {
  __$$RemoveFavoritePokemonLocalFailureCopyWithImpl(
      _$RemoveFavoritePokemonLocalFailure _value,
      $Res Function(_$RemoveFavoritePokemonLocalFailure) _then)
      : super(_value, (v) => _then(v as _$RemoveFavoritePokemonLocalFailure));

  @override
  _$RemoveFavoritePokemonLocalFailure get _value =>
      super._value as _$RemoveFavoritePokemonLocalFailure;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$RemoveFavoritePokemonLocalFailure(
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

class _$RemoveFavoritePokemonLocalFailure
    implements RemoveFavoritePokemonLocalFailure {
  const _$RemoveFavoritePokemonLocalFailure({this.error, this.stackTrace});

  @override
  final Exception? error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'RemoveFavoritePokemonUseCaseFailure.server(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFavoritePokemonLocalFailure &&
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
  _$$RemoveFavoritePokemonLocalFailureCopyWith<
          _$RemoveFavoritePokemonLocalFailure>
      get copyWith => __$$RemoveFavoritePokemonLocalFailureCopyWithImpl<
          _$RemoveFavoritePokemonLocalFailure>(this, _$identity);

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
    required TResult Function(RemoveFavoritePokemonLocalFailure value) server,
    required TResult Function(RemoveFavoritePokemonParseFailure value) parse,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoveFavoritePokemonLocalFailure value)? server,
    TResult Function(RemoveFavoritePokemonParseFailure value)? parse,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFavoritePokemonLocalFailure value)? server,
    TResult Function(RemoveFavoritePokemonParseFailure value)? parse,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class RemoveFavoritePokemonLocalFailure
    implements RemoveFavoritePokemonUseCaseFailure {
  const factory RemoveFavoritePokemonLocalFailure(
      {final Exception? error,
      final StackTrace? stackTrace}) = _$RemoveFavoritePokemonLocalFailure;

  @override
  Exception? get error => throw _privateConstructorUsedError;
  @override
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$RemoveFavoritePokemonLocalFailureCopyWith<
          _$RemoveFavoritePokemonLocalFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveFavoritePokemonParseFailureCopyWith<$Res>
    implements $RemoveFavoritePokemonUseCaseFailureCopyWith<$Res> {
  factory _$$RemoveFavoritePokemonParseFailureCopyWith(
          _$RemoveFavoritePokemonParseFailure value,
          $Res Function(_$RemoveFavoritePokemonParseFailure) then) =
      __$$RemoveFavoritePokemonParseFailureCopyWithImpl<$Res>;
  @override
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class __$$RemoveFavoritePokemonParseFailureCopyWithImpl<$Res>
    extends _$RemoveFavoritePokemonUseCaseFailureCopyWithImpl<$Res>
    implements _$$RemoveFavoritePokemonParseFailureCopyWith<$Res> {
  __$$RemoveFavoritePokemonParseFailureCopyWithImpl(
      _$RemoveFavoritePokemonParseFailure _value,
      $Res Function(_$RemoveFavoritePokemonParseFailure) _then)
      : super(_value, (v) => _then(v as _$RemoveFavoritePokemonParseFailure));

  @override
  _$RemoveFavoritePokemonParseFailure get _value =>
      super._value as _$RemoveFavoritePokemonParseFailure;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$RemoveFavoritePokemonParseFailure(
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

class _$RemoveFavoritePokemonParseFailure
    implements RemoveFavoritePokemonParseFailure {
  const _$RemoveFavoritePokemonParseFailure({this.error, this.stackTrace});

  @override
  final Exception? error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'RemoveFavoritePokemonUseCaseFailure.parse(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFavoritePokemonParseFailure &&
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
  _$$RemoveFavoritePokemonParseFailureCopyWith<
          _$RemoveFavoritePokemonParseFailure>
      get copyWith => __$$RemoveFavoritePokemonParseFailureCopyWithImpl<
          _$RemoveFavoritePokemonParseFailure>(this, _$identity);

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
    required TResult Function(RemoveFavoritePokemonLocalFailure value) server,
    required TResult Function(RemoveFavoritePokemonParseFailure value) parse,
  }) {
    return parse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RemoveFavoritePokemonLocalFailure value)? server,
    TResult Function(RemoveFavoritePokemonParseFailure value)? parse,
  }) {
    return parse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFavoritePokemonLocalFailure value)? server,
    TResult Function(RemoveFavoritePokemonParseFailure value)? parse,
    required TResult orElse(),
  }) {
    if (parse != null) {
      return parse(this);
    }
    return orElse();
  }
}

abstract class RemoveFavoritePokemonParseFailure
    implements RemoveFavoritePokemonUseCaseFailure {
  const factory RemoveFavoritePokemonParseFailure(
      {final Exception? error,
      final StackTrace? stackTrace}) = _$RemoveFavoritePokemonParseFailure;

  @override
  Exception? get error => throw _privateConstructorUsedError;
  @override
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$RemoveFavoritePokemonParseFailureCopyWith<
          _$RemoveFavoritePokemonParseFailure>
      get copyWith => throw _privateConstructorUsedError;
}
