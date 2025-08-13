// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preference_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PreferenceData _$PreferenceDataFromJson(Map<String, dynamic> json) {
  return _PreferenceData.fromJson(json);
}

/// @nodoc
mixin _$PreferenceData {
  Preferences? get preferences => throw _privateConstructorUsedError;

  /// Serializes this PreferenceData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreferenceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreferenceDataCopyWith<PreferenceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceDataCopyWith<$Res> {
  factory $PreferenceDataCopyWith(
          PreferenceData value, $Res Function(PreferenceData) then) =
      _$PreferenceDataCopyWithImpl<$Res, PreferenceData>;
  @useResult
  $Res call({Preferences? preferences});

  $PreferencesCopyWith<$Res>? get preferences;
}

/// @nodoc
class _$PreferenceDataCopyWithImpl<$Res, $Val extends PreferenceData>
    implements $PreferenceDataCopyWith<$Res> {
  _$PreferenceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreferenceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferences = freezed,
  }) {
    return _then(_value.copyWith(
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Preferences?,
    ) as $Val);
  }

  /// Create a copy of PreferenceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreferencesCopyWith<$Res>? get preferences {
    if (_value.preferences == null) {
      return null;
    }

    return $PreferencesCopyWith<$Res>(_value.preferences!, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PreferenceDataImplCopyWith<$Res>
    implements $PreferenceDataCopyWith<$Res> {
  factory _$$PreferenceDataImplCopyWith(_$PreferenceDataImpl value,
          $Res Function(_$PreferenceDataImpl) then) =
      __$$PreferenceDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Preferences? preferences});

  @override
  $PreferencesCopyWith<$Res>? get preferences;
}

/// @nodoc
class __$$PreferenceDataImplCopyWithImpl<$Res>
    extends _$PreferenceDataCopyWithImpl<$Res, _$PreferenceDataImpl>
    implements _$$PreferenceDataImplCopyWith<$Res> {
  __$$PreferenceDataImplCopyWithImpl(
      _$PreferenceDataImpl _value, $Res Function(_$PreferenceDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PreferenceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferences = freezed,
  }) {
    return _then(_$PreferenceDataImpl(
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as Preferences?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferenceDataImpl implements _PreferenceData {
  const _$PreferenceDataImpl({this.preferences});

  factory _$PreferenceDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferenceDataImplFromJson(json);

  @override
  final Preferences? preferences;

  @override
  String toString() {
    return 'PreferenceData(preferences: $preferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferenceDataImpl &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, preferences);

  /// Create a copy of PreferenceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferenceDataImplCopyWith<_$PreferenceDataImpl> get copyWith =>
      __$$PreferenceDataImplCopyWithImpl<_$PreferenceDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferenceDataImplToJson(
      this,
    );
  }
}

abstract class _PreferenceData implements PreferenceData {
  const factory _PreferenceData({final Preferences? preferences}) =
      _$PreferenceDataImpl;

  factory _PreferenceData.fromJson(Map<String, dynamic> json) =
      _$PreferenceDataImpl.fromJson;

  @override
  Preferences? get preferences;

  /// Create a copy of PreferenceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreferenceDataImplCopyWith<_$PreferenceDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
