// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_settings_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConversationSettingsData _$ConversationSettingsDataFromJson(
    Map<String, dynamic> json) {
  return _ConversationSettingsData.fromJson(json);
}

/// @nodoc
mixin _$ConversationSettingsData {
  ConversationSettings? get settings => throw _privateConstructorUsedError;

  /// Serializes this ConversationSettingsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversationSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversationSettingsDataCopyWith<ConversationSettingsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationSettingsDataCopyWith<$Res> {
  factory $ConversationSettingsDataCopyWith(ConversationSettingsData value,
          $Res Function(ConversationSettingsData) then) =
      _$ConversationSettingsDataCopyWithImpl<$Res, ConversationSettingsData>;
  @useResult
  $Res call({ConversationSettings? settings});

  $ConversationSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class _$ConversationSettingsDataCopyWithImpl<$Res,
        $Val extends ConversationSettingsData>
    implements $ConversationSettingsDataCopyWith<$Res> {
  _$ConversationSettingsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversationSettingsData
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
              as ConversationSettings?,
    ) as $Val);
  }

  /// Create a copy of ConversationSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversationSettingsCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $ConversationSettingsCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConversationSettingsDataImplCopyWith<$Res>
    implements $ConversationSettingsDataCopyWith<$Res> {
  factory _$$ConversationSettingsDataImplCopyWith(
          _$ConversationSettingsDataImpl value,
          $Res Function(_$ConversationSettingsDataImpl) then) =
      __$$ConversationSettingsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConversationSettings? settings});

  @override
  $ConversationSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class __$$ConversationSettingsDataImplCopyWithImpl<$Res>
    extends _$ConversationSettingsDataCopyWithImpl<$Res,
        _$ConversationSettingsDataImpl>
    implements _$$ConversationSettingsDataImplCopyWith<$Res> {
  __$$ConversationSettingsDataImplCopyWithImpl(
      _$ConversationSettingsDataImpl _value,
      $Res Function(_$ConversationSettingsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConversationSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = freezed,
  }) {
    return _then(_$ConversationSettingsDataImpl(
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as ConversationSettings?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ConversationSettingsDataImpl implements _ConversationSettingsData {
  const _$ConversationSettingsDataImpl({this.settings});

  factory _$ConversationSettingsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationSettingsDataImplFromJson(json);

  @override
  final ConversationSettings? settings;

  @override
  String toString() {
    return 'ConversationSettingsData(settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationSettingsDataImpl &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, settings);

  /// Create a copy of ConversationSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationSettingsDataImplCopyWith<_$ConversationSettingsDataImpl>
      get copyWith => __$$ConversationSettingsDataImplCopyWithImpl<
          _$ConversationSettingsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationSettingsDataImplToJson(
      this,
    );
  }
}

abstract class _ConversationSettingsData implements ConversationSettingsData {
  const factory _ConversationSettingsData(
      {final ConversationSettings? settings}) = _$ConversationSettingsDataImpl;

  factory _ConversationSettingsData.fromJson(Map<String, dynamic> json) =
      _$ConversationSettingsDataImpl.fromJson;

  @override
  ConversationSettings? get settings;

  /// Create a copy of ConversationSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversationSettingsDataImplCopyWith<_$ConversationSettingsDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
