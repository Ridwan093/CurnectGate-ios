// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voting_settings_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VotingSettingsData _$VotingSettingsDataFromJson(Map<String, dynamic> json) {
  return _VotingSettingsData.fromJson(json);
}

/// @nodoc
mixin _$VotingSettingsData {
  VotingSettingsItem? get settings => throw _privateConstructorUsedError;

  /// Serializes this VotingSettingsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VotingSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VotingSettingsDataCopyWith<VotingSettingsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VotingSettingsDataCopyWith<$Res> {
  factory $VotingSettingsDataCopyWith(
          VotingSettingsData value, $Res Function(VotingSettingsData) then) =
      _$VotingSettingsDataCopyWithImpl<$Res, VotingSettingsData>;
  @useResult
  $Res call({VotingSettingsItem? settings});

  $VotingSettingsItemCopyWith<$Res>? get settings;
}

/// @nodoc
class _$VotingSettingsDataCopyWithImpl<$Res, $Val extends VotingSettingsData>
    implements $VotingSettingsDataCopyWith<$Res> {
  _$VotingSettingsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VotingSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = freezed,
  }) {
    return _then(_value.copyWith(
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as VotingSettingsItem?,
    ) as $Val);
  }

  /// Create a copy of VotingSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VotingSettingsItemCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $VotingSettingsItemCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VotingSettingsDataImplCopyWith<$Res>
    implements $VotingSettingsDataCopyWith<$Res> {
  factory _$$VotingSettingsDataImplCopyWith(_$VotingSettingsDataImpl value,
          $Res Function(_$VotingSettingsDataImpl) then) =
      __$$VotingSettingsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VotingSettingsItem? settings});

  @override
  $VotingSettingsItemCopyWith<$Res>? get settings;
}

/// @nodoc
class __$$VotingSettingsDataImplCopyWithImpl<$Res>
    extends _$VotingSettingsDataCopyWithImpl<$Res, _$VotingSettingsDataImpl>
    implements _$$VotingSettingsDataImplCopyWith<$Res> {
  __$$VotingSettingsDataImplCopyWithImpl(_$VotingSettingsDataImpl _value,
      $Res Function(_$VotingSettingsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of VotingSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = freezed,
  }) {
    return _then(_$VotingSettingsDataImpl(
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as VotingSettingsItem?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$VotingSettingsDataImpl implements _VotingSettingsData {
  const _$VotingSettingsDataImpl({this.settings});

  factory _$VotingSettingsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$VotingSettingsDataImplFromJson(json);

  @override
  final VotingSettingsItem? settings;

  @override
  String toString() {
    return 'VotingSettingsData(settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VotingSettingsDataImpl &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, settings);

  /// Create a copy of VotingSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VotingSettingsDataImplCopyWith<_$VotingSettingsDataImpl> get copyWith =>
      __$$VotingSettingsDataImplCopyWithImpl<_$VotingSettingsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VotingSettingsDataImplToJson(
      this,
    );
  }
}

abstract class _VotingSettingsData implements VotingSettingsData {
  const factory _VotingSettingsData({final VotingSettingsItem? settings}) =
      _$VotingSettingsDataImpl;

  factory _VotingSettingsData.fromJson(Map<String, dynamic> json) =
      _$VotingSettingsDataImpl.fromJson;

  @override
  VotingSettingsItem? get settings;

  /// Create a copy of VotingSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VotingSettingsDataImplCopyWith<_$VotingSettingsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
