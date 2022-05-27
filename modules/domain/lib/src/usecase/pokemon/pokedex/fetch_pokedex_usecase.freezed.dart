// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_pokedex_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FetchPokedexUseCaseFailure {
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
    required TResult Function(FetchPokedexServerFailure value) server,
    required TResult Function(FetchPokedexParseFailure value) parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchPokedexServerFailure value)? server,
    TResult Function(FetchPokedexParseFailure value)? parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchPokedexServerFailure value)? server,
    TResult Function(FetchPokedexParseFailure value)? parse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchPokedexUseCaseFailureCopyWith<FetchPokedexUseCaseFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchPokedexUseCaseFailureCopyWith<$Res> {
  factory $FetchPokedexUseCaseFailureCopyWith(FetchPokedexUseCaseFailure value,
          $Res Function(FetchPokedexUseCaseFailure) then) =
      _$FetchPokedexUseCaseFailureCopyWithImpl<$Res>;
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class _$FetchPokedexUseCaseFailureCopyWithImpl<$Res>
    implements $FetchPokedexUseCaseFailureCopyWith<$Res> {
  _$FetchPokedexUseCaseFailureCopyWithImpl(this._value, this._then);

  final FetchPokedexUseCaseFailure _value;
  // ignore: unused_field
  final $Res Function(FetchPokedexUseCaseFailure) _then;

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
abstract class _$$FetchPokedexServerFailureCopyWith<$Res>
    implements $FetchPokedexUseCaseFailureCopyWith<$Res> {
  factory _$$FetchPokedexServerFailureCopyWith(
          _$FetchPokedexServerFailure value,
          $Res Function(_$FetchPokedexServerFailure) then) =
      __$$FetchPokedexServerFailureCopyWithImpl<$Res>;
  @override
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class __$$FetchPokedexServerFailureCopyWithImpl<$Res>
    extends _$FetchPokedexUseCaseFailureCopyWithImpl<$Res>
    implements _$$FetchPokedexServerFailureCopyWith<$Res> {
  __$$FetchPokedexServerFailureCopyWithImpl(_$FetchPokedexServerFailure _value,
      $Res Function(_$FetchPokedexServerFailure) _then)
      : super(_value, (v) => _then(v as _$FetchPokedexServerFailure));

  @override
  _$FetchPokedexServerFailure get _value =>
      super._value as _$FetchPokedexServerFailure;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$FetchPokedexServerFailure(
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

class _$FetchPokedexServerFailure implements FetchPokedexServerFailure {
  const _$FetchPokedexServerFailure({this.error, this.stackTrace});

  @override
  final Exception? error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'FetchPokedexUseCaseFailure.server(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPokedexServerFailure &&
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
  _$$FetchPokedexServerFailureCopyWith<_$FetchPokedexServerFailure>
      get copyWith => __$$FetchPokedexServerFailureCopyWithImpl<
          _$FetchPokedexServerFailure>(this, _$identity);

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
    required TResult Function(FetchPokedexServerFailure value) server,
    required TResult Function(FetchPokedexParseFailure value) parse,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchPokedexServerFailure value)? server,
    TResult Function(FetchPokedexParseFailure value)? parse,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchPokedexServerFailure value)? server,
    TResult Function(FetchPokedexParseFailure value)? parse,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class FetchPokedexServerFailure implements FetchPokedexUseCaseFailure {
  const factory FetchPokedexServerFailure(
      {final Exception? error,
      final StackTrace? stackTrace}) = _$FetchPokedexServerFailure;

  @override
  Exception? get error => throw _privateConstructorUsedError;
  @override
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$FetchPokedexServerFailureCopyWith<_$FetchPokedexServerFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchPokedexParseFailureCopyWith<$Res>
    implements $FetchPokedexUseCaseFailureCopyWith<$Res> {
  factory _$$FetchPokedexParseFailureCopyWith(_$FetchPokedexParseFailure value,
          $Res Function(_$FetchPokedexParseFailure) then) =
      __$$FetchPokedexParseFailureCopyWithImpl<$Res>;
  @override
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class __$$FetchPokedexParseFailureCopyWithImpl<$Res>
    extends _$FetchPokedexUseCaseFailureCopyWithImpl<$Res>
    implements _$$FetchPokedexParseFailureCopyWith<$Res> {
  __$$FetchPokedexParseFailureCopyWithImpl(_$FetchPokedexParseFailure _value,
      $Res Function(_$FetchPokedexParseFailure) _then)
      : super(_value, (v) => _then(v as _$FetchPokedexParseFailure));

  @override
  _$FetchPokedexParseFailure get _value =>
      super._value as _$FetchPokedexParseFailure;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$FetchPokedexParseFailure(
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

class _$FetchPokedexParseFailure implements FetchPokedexParseFailure {
  const _$FetchPokedexParseFailure({this.error, this.stackTrace});

  @override
  final Exception? error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'FetchPokedexUseCaseFailure.parse(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPokedexParseFailure &&
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
  _$$FetchPokedexParseFailureCopyWith<_$FetchPokedexParseFailure>
      get copyWith =>
          __$$FetchPokedexParseFailureCopyWithImpl<_$FetchPokedexParseFailure>(
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
    required TResult Function(FetchPokedexServerFailure value) server,
    required TResult Function(FetchPokedexParseFailure value) parse,
  }) {
    return parse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchPokedexServerFailure value)? server,
    TResult Function(FetchPokedexParseFailure value)? parse,
  }) {
    return parse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchPokedexServerFailure value)? server,
    TResult Function(FetchPokedexParseFailure value)? parse,
    required TResult orElse(),
  }) {
    if (parse != null) {
      return parse(this);
    }
    return orElse();
  }
}

abstract class FetchPokedexParseFailure implements FetchPokedexUseCaseFailure {
  const factory FetchPokedexParseFailure(
      {final Exception? error,
      final StackTrace? stackTrace}) = _$FetchPokedexParseFailure;

  @override
  Exception? get error => throw _privateConstructorUsedError;
  @override
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$FetchPokedexParseFailureCopyWith<_$FetchPokedexParseFailure>
      get copyWith => throw _privateConstructorUsedError;
}
