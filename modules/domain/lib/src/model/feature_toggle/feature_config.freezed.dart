// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feature_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeatureConfig {
  bool get isEnabled => throw _privateConstructorUsedError;
  Feature get feature => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeatureConfigCopyWith<FeatureConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureConfigCopyWith<$Res> {
  factory $FeatureConfigCopyWith(
          FeatureConfig value, $Res Function(FeatureConfig) then) =
      _$FeatureConfigCopyWithImpl<$Res>;
  $Res call({bool isEnabled, Feature feature});
}

/// @nodoc
class _$FeatureConfigCopyWithImpl<$Res>
    implements $FeatureConfigCopyWith<$Res> {
  _$FeatureConfigCopyWithImpl(this._value, this._then);

  final FeatureConfig _value;
  // ignore: unused_field
  final $Res Function(FeatureConfig) _then;

  @override
  $Res call({
    Object? isEnabled = freezed,
    Object? feature = freezed,
  }) {
    return _then(_value.copyWith(
      isEnabled: isEnabled == freezed
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      feature: feature == freezed
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as Feature,
    ));
  }
}

/// @nodoc
abstract class _$$_FeatureConfigCopyWith<$Res>
    implements $FeatureConfigCopyWith<$Res> {
  factory _$$_FeatureConfigCopyWith(
          _$_FeatureConfig value, $Res Function(_$_FeatureConfig) then) =
      __$$_FeatureConfigCopyWithImpl<$Res>;
  @override
  $Res call({bool isEnabled, Feature feature});
}

/// @nodoc
class __$$_FeatureConfigCopyWithImpl<$Res>
    extends _$FeatureConfigCopyWithImpl<$Res>
    implements _$$_FeatureConfigCopyWith<$Res> {
  __$$_FeatureConfigCopyWithImpl(
      _$_FeatureConfig _value, $Res Function(_$_FeatureConfig) _then)
      : super(_value, (v) => _then(v as _$_FeatureConfig));

  @override
  _$_FeatureConfig get _value => super._value as _$_FeatureConfig;

  @override
  $Res call({
    Object? isEnabled = freezed,
    Object? feature = freezed,
  }) {
    return _then(_$_FeatureConfig(
      isEnabled: isEnabled == freezed
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      feature: feature == freezed
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as Feature,
    ));
  }
}

/// @nodoc

class _$_FeatureConfig implements _FeatureConfig {
  const _$_FeatureConfig({required this.isEnabled, required this.feature});

  @override
  final bool isEnabled;
  @override
  final Feature feature;

  @override
  String toString() {
    return 'FeatureConfig(isEnabled: $isEnabled, feature: $feature)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeatureConfig &&
            const DeepCollectionEquality().equals(other.isEnabled, isEnabled) &&
            const DeepCollectionEquality().equals(other.feature, feature));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isEnabled),
      const DeepCollectionEquality().hash(feature));

  @JsonKey(ignore: true)
  @override
  _$$_FeatureConfigCopyWith<_$_FeatureConfig> get copyWith =>
      __$$_FeatureConfigCopyWithImpl<_$_FeatureConfig>(this, _$identity);
}

abstract class _FeatureConfig implements FeatureConfig {
  const factory _FeatureConfig(
      {required final bool isEnabled,
      required final Feature feature}) = _$_FeatureConfig;

  @override
  bool get isEnabled => throw _privateConstructorUsedError;
  @override
  Feature get feature => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FeatureConfigCopyWith<_$_FeatureConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
