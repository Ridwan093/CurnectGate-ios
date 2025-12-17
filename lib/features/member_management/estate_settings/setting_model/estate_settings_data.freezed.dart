// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estate_settings_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstateSettingsData _$EstateSettingsDataFromJson(Map<String, dynamic> json) {
  return _EstateSettingsData.fromJson(json);
}

/// @nodoc
mixin _$EstateSettingsData {
  Map<String, EmergencyContacts>? get settings =>
      throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  EstateInfo? get estate => throw _privateConstructorUsedError;

  /// Serializes this EstateSettingsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EstateSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstateSettingsDataCopyWith<EstateSettingsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstateSettingsDataCopyWith<$Res> {
  factory $EstateSettingsDataCopyWith(
          EstateSettingsData value, $Res Function(EstateSettingsData) then) =
      _$EstateSettingsDataCopyWithImpl<$Res, EstateSettingsData>;
  @useResult
  $Res call(
      {Map<String, EmergencyContacts>? settings,
      String? type,
      EstateInfo? estate});

  $EstateInfoCopyWith<$Res>? get estate;
}

/// @nodoc
class _$EstateSettingsDataCopyWithImpl<$Res, $Val extends EstateSettingsData>
    implements $EstateSettingsDataCopyWith<$Res> {
  _$EstateSettingsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstateSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = freezed,
    Object? type = freezed,
    Object? estate = freezed,
  }) {
    return _then(_value.copyWith(
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, EmergencyContacts>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      estate: freezed == estate
          ? _value.estate
          : estate // ignore: cast_nullable_to_non_nullable
              as EstateInfo?,
    ) as $Val);
  }

  /// Create a copy of EstateSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EstateInfoCopyWith<$Res>? get estate {
    if (_value.estate == null) {
      return null;
    }

    return $EstateInfoCopyWith<$Res>(_value.estate!, (value) {
      return _then(_value.copyWith(estate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EstateSettingsDataImplCopyWith<$Res>
    implements $EstateSettingsDataCopyWith<$Res> {
  factory _$$EstateSettingsDataImplCopyWith(_$EstateSettingsDataImpl value,
          $Res Function(_$EstateSettingsDataImpl) then) =
      __$$EstateSettingsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, EmergencyContacts>? settings,
      String? type,
      EstateInfo? estate});

  @override
  $EstateInfoCopyWith<$Res>? get estate;
}

/// @nodoc
class __$$EstateSettingsDataImplCopyWithImpl<$Res>
    extends _$EstateSettingsDataCopyWithImpl<$Res, _$EstateSettingsDataImpl>
    implements _$$EstateSettingsDataImplCopyWith<$Res> {
  __$$EstateSettingsDataImplCopyWithImpl(_$EstateSettingsDataImpl _value,
      $Res Function(_$EstateSettingsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstateSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = freezed,
    Object? type = freezed,
    Object? estate = freezed,
  }) {
    return _then(_$EstateSettingsDataImpl(
      settings: freezed == settings
          ? _value._settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, EmergencyContacts>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      estate: freezed == estate
          ? _value.estate
          : estate // ignore: cast_nullable_to_non_nullable
              as EstateInfo?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$EstateSettingsDataImpl implements _EstateSettingsData {
  const _$EstateSettingsDataImpl(
      {final Map<String, EmergencyContacts>? settings, this.type, this.estate})
      : _settings = settings;

  factory _$EstateSettingsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstateSettingsDataImplFromJson(json);

  final Map<String, EmergencyContacts>? _settings;
  @override
  Map<String, EmergencyContacts>? get settings {
    final value = _settings;
    if (value == null) return null;
    if (_settings is EqualUnmodifiableMapView) return _settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? type;
  @override
  final EstateInfo? estate;

  @override
  String toString() {
    return 'EstateSettingsData(settings: $settings, type: $type, estate: $estate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstateSettingsDataImpl &&
            const DeepCollectionEquality().equals(other._settings, _settings) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.estate, estate) || other.estate == estate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_settings), type, estate);

  /// Create a copy of EstateSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstateSettingsDataImplCopyWith<_$EstateSettingsDataImpl> get copyWith =>
      __$$EstateSettingsDataImplCopyWithImpl<_$EstateSettingsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstateSettingsDataImplToJson(
      this,
    );
  }
}

abstract class _EstateSettingsData implements EstateSettingsData {
  const factory _EstateSettingsData(
      {final Map<String, EmergencyContacts>? settings,
      final String? type,
      final EstateInfo? estate}) = _$EstateSettingsDataImpl;

  factory _EstateSettingsData.fromJson(Map<String, dynamic> json) =
      _$EstateSettingsDataImpl.fromJson;

  @override
  Map<String, EmergencyContacts>? get settings;
  @override
  String? get type;
  @override
  EstateInfo? get estate;

  /// Create a copy of EstateSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstateSettingsDataImplCopyWith<_$EstateSettingsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
