// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'capture_pokemon_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CapturePokemonUseCaseFailure {
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
    required TResult Function(CapturePokemonServerFailure value) server,
    required TResult Function(CapturePokemonParseFailure value) parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CapturePokemonServerFailure value)? server,
    TResult Function(CapturePokemonParseFailure value)? parse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CapturePokemonServerFailure value)? server,
    TResult Function(CapturePokemonParseFailure value)? parse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CapturePokemonUseCaseFailureCopyWith<CapturePokemonUseCaseFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CapturePokemonUseCaseFailureCopyWith<$Res> {
  factory $CapturePokemonUseCaseFailureCopyWith(
          CapturePokemonUseCaseFailure value,
          $Res Function(CapturePokemonUseCaseFailure) then) =
      _$CapturePokemonUseCaseFailureCopyWithImpl<$Res>;
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class _$CapturePokemonUseCaseFailureCopyWithImpl<$Res>
    implements $CapturePokemonUseCaseFailureCopyWith<$Res> {
  _$CapturePokemonUseCaseFailureCopyWithImpl(this._value, this._then);

  final CapturePokemonUseCaseFailure _value;
  // ignore: unused_field
  final $Res Function(CapturePokemonUseCaseFailure) _then;

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
abstract class _$$CapturePokemonServerFailureCopyWith<$Res>
    implements $CapturePokemonUseCaseFailureCopyWith<$Res> {
  factory _$$CapturePokemonServerFailureCopyWith(
          _$CapturePokemonServerFailure value,
          $Res Function(_$CapturePokemonServerFailure) then) =
      __$$CapturePokemonServerFailureCopyWithImpl<$Res>;
  @override
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class __$$CapturePokemonServerFailureCopyWithImpl<$Res>
    extends _$CapturePokemonUseCaseFailureCopyWithImpl<$Res>
    implements _$$CapturePokemonServerFailureCopyWith<$Res> {
  __$$CapturePokemonServerFailureCopyWithImpl(
      _$CapturePokemonServerFailure _value,
      $Res Function(_$CapturePokemonServerFailure) _then)
      : super(_value, (v) => _then(v as _$CapturePokemonServerFailure));

  @override
  _$CapturePokemonServerFailure get _value =>
      super._value as _$CapturePokemonServerFailure;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$CapturePokemonServerFailure(
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

class _$CapturePokemonServerFailure implements CapturePokemonServerFailure {
  const _$CapturePokemonServerFailure({this.error, this.stackTrace});

  @override
  final Exception? error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'CapturePokemonUseCaseFailure.server(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CapturePokemonServerFailure &&
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
  _$$CapturePokemonServerFailureCopyWith<_$CapturePokemonServerFailure>
      get copyWith => __$$CapturePokemonServerFailureCopyWithImpl<
          _$CapturePokemonServerFailure>(this, _$identity);

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
    required TResult Function(CapturePokemonServerFailure value) server,
    required TResult Function(CapturePokemonParseFailure value) parse,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CapturePokemonServerFailure value)? server,
    TResult Function(CapturePokemonParseFailure value)? parse,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CapturePokemonServerFailure value)? server,
    TResult Function(CapturePokemonParseFailure value)? parse,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class CapturePokemonServerFailure
    implements CapturePokemonUseCaseFailure {
  const factory CapturePokemonServerFailure(
      {final Exception? error,
      final StackTrace? stackTrace}) = _$CapturePokemonServerFailure;

  @override
  Exception? get error => throw _privateConstructorUsedError;
  @override
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$CapturePokemonServerFailureCopyWith<_$CapturePokemonServerFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CapturePokemonParseFailureCopyWith<$Res>
    implements $CapturePokemonUseCaseFailureCopyWith<$Res> {
  factory _$$CapturePokemonParseFailureCopyWith(
          _$CapturePokemonParseFailure value,
          $Res Function(_$CapturePokemonParseFailure) then) =
      __$$CapturePokemonParseFailureCopyWithImpl<$Res>;
  @override
  $Res call({Exception? error, StackTrace? stackTrace});
}

/// @nodoc
class __$$CapturePokemonParseFailureCopyWithImpl<$Res>
    extends _$CapturePokemonUseCaseFailureCopyWithImpl<$Res>
    implements _$$CapturePokemonParseFailureCopyWith<$Res> {
  __$$CapturePokemonParseFailureCopyWithImpl(
      _$CapturePokemonParseFailure _value,
      $Res Function(_$CapturePokemonParseFailure) _then)
      : super(_value, (v) => _then(v as _$CapturePokemonParseFailure));

  @override
  _$CapturePokemonParseFailure get _value =>
      super._value as _$CapturePokemonParseFailure;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$CapturePokemonParseFailure(
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

class _$CapturePokemonParseFailure implements CapturePokemonParseFailure {
  const _$CapturePokemonParseFailure({this.error, this.stackTrace});

  @override
  final Exception? error;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'CapturePokemonUseCaseFailure.parse(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CapturePokemonParseFailure &&
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
  _$$CapturePokemonParseFailureCopyWith<_$CapturePokemonParseFailure>
      get copyWith => __$$CapturePokemonParseFailureCopyWithImpl<
          _$CapturePokemonParseFailure>(this, _$identity);

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
    required TResult Function(CapturePokemonServerFailure value) server,
    required TResult Function(CapturePokemonParseFailure value) parse,
  }) {
    return parse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CapturePokemonServerFailure value)? server,
    TResult Function(CapturePokemonParseFailure value)? parse,
  }) {
    return parse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CapturePokemonServerFailure value)? server,
    TResult Function(CapturePokemonParseFailure value)? parse,
    required TResult orElse(),
  }) {
    if (parse != null) {
      return parse(this);
    }
    return orElse();
  }
}

abstract class CapturePokemonParseFailure
    implements CapturePokemonUseCaseFailure {
  const factory CapturePokemonParseFailure(
      {final Exception? error,
      final StackTrace? stackTrace}) = _$CapturePokemonParseFailure;

  @override
  Exception? get error => throw _privateConstructorUsedError;
  @override
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$CapturePokemonParseFailureCopyWith<_$CapturePokemonParseFailure>
      get copyWith => throw _privateConstructorUsedError;
}
