// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_pokemon_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchPokemonUseCaseFailure {
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
    required TResult Function(FetchPokemonServerFailure value) server,
    required TResult Function(FetchPokemonParseFailure value) parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchPokemonServerFailure value)? server,
    TResult Function(FetchPokemonParseFailure value)? parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchPokemonServerFailure value)? server,
    TResult Function(FetchPokemonParseFailure value)? parse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchPokemonUseCaseFailureCopyWith<FetchPokemonUseCaseFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchPokemonUseCaseFailureCopyWith<$Res> {
  factory $FetchPokemonUseCaseFailureCopyWith(FetchPokemonUseCaseFailure value,
          $Res Function(FetchPokemonUseCaseFailure) then) =
      _$FetchPokemonUseCaseFailureCopyWithImpl<$Res>;
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class _$FetchPokemonUseCaseFailureCopyWithImpl<$Res>
    implements $FetchPokemonUseCaseFailureCopyWith<$Res> {
  _$FetchPokemonUseCaseFailureCopyWithImpl(this._value, this._then);

  final FetchPokemonUseCaseFailure _value;
  // ignore: unused_field
  final $Res Function(FetchPokemonUseCaseFailure) _then;

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
abstract class _$$FetchPokemonServerFailureCopyWith<$Res>
    implements $FetchPokemonUseCaseFailureCopyWith<$Res> {
  factory _$$FetchPokemonServerFailureCopyWith(
          _$FetchPokemonServerFailure value,
          $Res Function(_$FetchPokemonServerFailure) then) =
      __$$FetchPokemonServerFailureCopyWithImpl<$Res>;
  @override
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class __$$FetchPokemonServerFailureCopyWithImpl<$Res>
    extends _$FetchPokemonUseCaseFailureCopyWithImpl<$Res>
    implements _$$FetchPokemonServerFailureCopyWith<$Res> {
  __$$FetchPokemonServerFailureCopyWithImpl(_$FetchPokemonServerFailure _value,
      $Res Function(_$FetchPokemonServerFailure) _then)
      : super(_value, (v) => _then(v as _$FetchPokemonServerFailure));

  @override
  _$FetchPokemonServerFailure get _value =>
      super._value as _$FetchPokemonServerFailure;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$FetchPokemonServerFailure(
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

class _$FetchPokemonServerFailure implements FetchPokemonServerFailure {
  const _$FetchPokemonServerFailure({this.error, this.stackTrace});

  @override
  final Exception? error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'FetchPokemonUseCaseFailure.server(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPokemonServerFailure &&
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
  _$$FetchPokemonServerFailureCopyWith<_$FetchPokemonServerFailure>
      get copyWith => __$$FetchPokemonServerFailureCopyWithImpl<
          _$FetchPokemonServerFailure>(this, _$identity);

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
    required TResult Function(FetchPokemonServerFailure value) server,
    required TResult Function(FetchPokemonParseFailure value) parse,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchPokemonServerFailure value)? server,
    TResult Function(FetchPokemonParseFailure value)? parse,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchPokemonServerFailure value)? server,
    TResult Function(FetchPokemonParseFailure value)? parse,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class FetchPokemonServerFailure implements FetchPokemonUseCaseFailure {
  const factory FetchPokemonServerFailure(
      {final Exception? error,
      final StackTrace? stackTrace}) = _$FetchPokemonServerFailure;

  @override
  Exception? get error => throw _privateConstructorUsedError;
  @override
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$FetchPokemonServerFailureCopyWith<_$FetchPokemonServerFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchPokemonParseFailureCopyWith<$Res>
    implements $FetchPokemonUseCaseFailureCopyWith<$Res> {
  factory _$$FetchPokemonParseFailureCopyWith(_$FetchPokemonParseFailure value,
          $Res Function(_$FetchPokemonParseFailure) then) =
      __$$FetchPokemonParseFailureCopyWithImpl<$Res>;
  @override
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class __$$FetchPokemonParseFailureCopyWithImpl<$Res>
    extends _$FetchPokemonUseCaseFailureCopyWithImpl<$Res>
    implements _$$FetchPokemonParseFailureCopyWith<$Res> {
  __$$FetchPokemonParseFailureCopyWithImpl(_$FetchPokemonParseFailure _value,
      $Res Function(_$FetchPokemonParseFailure) _then)
      : super(_value, (v) => _then(v as _$FetchPokemonParseFailure));

  @override
  _$FetchPokemonParseFailure get _value =>
      super._value as _$FetchPokemonParseFailure;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$FetchPokemonParseFailure(
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

class _$FetchPokemonParseFailure implements FetchPokemonParseFailure {
  const _$FetchPokemonParseFailure({this.error, this.stackTrace});

  @override
  final Exception? error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'FetchPokemonUseCaseFailure.parse(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPokemonParseFailure &&
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
  _$$FetchPokemonParseFailureCopyWith<_$FetchPokemonParseFailure>
      get copyWith =>
          __$$FetchPokemonParseFailureCopyWithImpl<_$FetchPokemonParseFailure>(
              this, _$identity);

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
    required TResult Function(FetchPokemonServerFailure value) server,
    required TResult Function(FetchPokemonParseFailure value) parse,
  }) {
    return parse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchPokemonServerFailure value)? server,
    TResult Function(FetchPokemonParseFailure value)? parse,
  }) {
    return parse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchPokemonServerFailure value)? server,
    TResult Function(FetchPokemonParseFailure value)? parse,
    required TResult orElse(),
  }) {
    if (parse != null) {
      return parse(this);
    }
    return orElse();
  }
}

abstract class FetchPokemonParseFailure implements FetchPokemonUseCaseFailure {
  const factory FetchPokemonParseFailure(
      {final Exception? error,
      final StackTrace? stackTrace}) = _$FetchPokemonParseFailure;

  @override
  Exception? get error => throw _privateConstructorUsedError;
  @override
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$FetchPokemonParseFailureCopyWith<_$FetchPokemonParseFailure>
      get copyWith => throw _privateConstructorUsedError;
}
