// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estate_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstateSettings _$EstateSettingsFromJson(Map<String, dynamic> json) {
  return _EstateSettings.fromJson(json);
}

/// @nodoc
mixin _$EstateSettings {
  @JsonKey(name: 'auto_approve_users')
  bool? get autoApproveUsers => throw _privateConstructorUsedError;
  @JsonKey(name: 'require_deed_signature')
  bool? get requireDeedSignature => throw _privateConstructorUsedError;
  @JsonKey(name: 'visitor_approval_required')
  bool? get visitorApprovalRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'emergency_contacts')
  Map<String, List<dynamic>>? get emergencyContacts =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_key')
  String? get imageKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'operating_hours')
  OperatingHours? get operatingHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_Key')
  String? get imageKeyAlt => throw _privateConstructorUsedError;

  /// Serializes this EstateSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EstateSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstateSettingsCopyWith<EstateSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstateSettingsCopyWith<$Res> {
  factory $EstateSettingsCopyWith(
          EstateSettings value, $Res Function(EstateSettings) then) =
      _$EstateSettingsCopyWithImpl<$Res, EstateSettings>;
  @useResult
  $Res call(
      {@JsonKey(name: 'auto_approve_users') bool? autoApproveUsers,
      @JsonKey(name: 'require_deed_signature') bool? requireDeedSignature,
      @JsonKey(name: 'visitor_approval_required') bool? visitorApprovalRequired,
      @JsonKey(name: 'emergency_contacts')
      Map<String, List<dynamic>>? emergencyContacts,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'image_key') String? imageKey,
      @JsonKey(name: 'operating_hours') OperatingHours? operatingHours,
      @JsonKey(name: 'image_Key') String? imageKeyAlt});

  $OperatingHoursCopyWith<$Res>? get operatingHours;
}

/// @nodoc
class _$EstateSettingsCopyWithImpl<$Res, $Val extends EstateSettings>
    implements $EstateSettingsCopyWith<$Res> {
  _$EstateSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstateSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoApproveUsers = freezed,
    Object? requireDeedSignature = freezed,
    Object? visitorApprovalRequired = freezed,
    Object? emergencyContacts = freezed,
    Object? imageUrl = freezed,
    Object? imageKey = freezed,
    Object? operatingHours = freezed,
    Object? imageKeyAlt = freezed,
  }) {
    return _then(_value.copyWith(
      autoApproveUsers: freezed == autoApproveUsers
          ? _value.autoApproveUsers
          : autoApproveUsers // ignore: cast_nullable_to_non_nullable
              as bool?,
      requireDeedSignature: freezed == requireDeedSignature
          ? _value.requireDeedSignature
          : requireDeedSignature // ignore: cast_nullable_to_non_nullable
              as bool?,
      visitorApprovalRequired: freezed == visitorApprovalRequired
          ? _value.visitorApprovalRequired
          : visitorApprovalRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      emergencyContacts: freezed == emergencyContacts
          ? _value.emergencyContacts
          : emergencyContacts // ignore: cast_nullable_to_non_nullable
              as Map<String, List<dynamic>>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageKey: freezed == imageKey
          ? _value.imageKey
          : imageKey // ignore: cast_nullable_to_non_nullable
              as String?,
      operatingHours: freezed == operatingHours
          ? _value.operatingHours
          : operatingHours // ignore: cast_nullable_to_non_nullable
              as OperatingHours?,
      imageKeyAlt: freezed == imageKeyAlt
          ? _value.imageKeyAlt
          : imageKeyAlt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of EstateSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperatingHoursCopyWith<$Res>? get operatingHours {
    if (_value.operatingHours == null) {
      return null;
    }

    return $OperatingHoursCopyWith<$Res>(_value.operatingHours!, (value) {
      return _then(_value.copyWith(operatingHours: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EstateSettingsImplCopyWith<$Res>
    implements $EstateSettingsCopyWith<$Res> {
  factory _$$EstateSettingsImplCopyWith(_$EstateSettingsImpl value,
          $Res Function(_$EstateSettingsImpl) then) =
      __$$EstateSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'auto_approve_users') bool? autoApproveUsers,
      @JsonKey(name: 'require_deed_signature') bool? requireDeedSignature,
      @JsonKey(name: 'visitor_approval_required') bool? visitorApprovalRequired,
      @JsonKey(name: 'emergency_contacts')
      Map<String, List<dynamic>>? emergencyContacts,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'image_key') String? imageKey,
      @JsonKey(name: 'operating_hours') OperatingHours? operatingHours,
      @JsonKey(name: 'image_Key') String? imageKeyAlt});

  @override
  $OperatingHoursCopyWith<$Res>? get operatingHours;
}

/// @nodoc
class __$$EstateSettingsImplCopyWithImpl<$Res>
    extends _$EstateSettingsCopyWithImpl<$Res, _$EstateSettingsImpl>
    implements _$$EstateSettingsImplCopyWith<$Res> {
  __$$EstateSettingsImplCopyWithImpl(
      _$EstateSettingsImpl _value, $Res Function(_$EstateSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstateSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoApproveUsers = freezed,
    Object? requireDeedSignature = freezed,
    Object? visitorApprovalRequired = freezed,
    Object? emergencyContacts = freezed,
    Object? imageUrl = freezed,
    Object? imageKey = freezed,
    Object? operatingHours = freezed,
    Object? imageKeyAlt = freezed,
  }) {
    return _then(_$EstateSettingsImpl(
      autoApproveUsers: freezed == autoApproveUsers
          ? _value.autoApproveUsers
          : autoApproveUsers // ignore: cast_nullable_to_non_nullable
              as bool?,
      requireDeedSignature: freezed == requireDeedSignature
          ? _value.requireDeedSignature
          : requireDeedSignature // ignore: cast_nullable_to_non_nullable
              as bool?,
      visitorApprovalRequired: freezed == visitorApprovalRequired
          ? _value.visitorApprovalRequired
          : visitorApprovalRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      emergencyContacts: freezed == emergencyContacts
          ? _value._emergencyContacts
          : emergencyContacts // ignore: cast_nullable_to_non_nullable
              as Map<String, List<dynamic>>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageKey: freezed == imageKey
          ? _value.imageKey
          : imageKey // ignore: cast_nullable_to_non_nullable
              as String?,
      operatingHours: freezed == operatingHours
          ? _value.operatingHours
          : operatingHours // ignore: cast_nullable_to_non_nullable
              as OperatingHours?,
      imageKeyAlt: freezed == imageKeyAlt
          ? _value.imageKeyAlt
          : imageKeyAlt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$EstateSettingsImpl implements _EstateSettings {
  const _$EstateSettingsImpl(
      {@JsonKey(name: 'auto_approve_users') required this.autoApproveUsers,
      @JsonKey(name: 'require_deed_signature')
      required this.requireDeedSignature,
      @JsonKey(name: 'visitor_approval_required')
      required this.visitorApprovalRequired,
      @JsonKey(name: 'emergency_contacts')
      final Map<String, List<dynamic>>? emergencyContacts,
      @JsonKey(name: 'image_url') required this.imageUrl,
      @JsonKey(name: 'image_key') required this.imageKey,
      @JsonKey(name: 'operating_hours') required this.operatingHours,
      @JsonKey(name: 'image_Key') required this.imageKeyAlt})
      : _emergencyContacts = emergencyContacts;

  factory _$EstateSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstateSettingsImplFromJson(json);

  @override
  @JsonKey(name: 'auto_approve_users')
  final bool? autoApproveUsers;
  @override
  @JsonKey(name: 'require_deed_signature')
  final bool? requireDeedSignature;
  @override
  @JsonKey(name: 'visitor_approval_required')
  final bool? visitorApprovalRequired;
  final Map<String, List<dynamic>>? _emergencyContacts;
  @override
  @JsonKey(name: 'emergency_contacts')
  Map<String, List<dynamic>>? get emergencyContacts {
    final value = _emergencyContacts;
    if (value == null) return null;
    if (_emergencyContacts is EqualUnmodifiableMapView)
      return _emergencyContacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'image_key')
  final String? imageKey;
  @override
  @JsonKey(name: 'operating_hours')
  final OperatingHours? operatingHours;
  @override
  @JsonKey(name: 'image_Key')
  final String? imageKeyAlt;

  @override
  String toString() {
    return 'EstateSettings(autoApproveUsers: $autoApproveUsers, requireDeedSignature: $requireDeedSignature, visitorApprovalRequired: $visitorApprovalRequired, emergencyContacts: $emergencyContacts, imageUrl: $imageUrl, imageKey: $imageKey, operatingHours: $operatingHours, imageKeyAlt: $imageKeyAlt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstateSettingsImpl &&
            (identical(other.autoApproveUsers, autoApproveUsers) ||
                other.autoApproveUsers == autoApproveUsers) &&
            (identical(other.requireDeedSignature, requireDeedSignature) ||
                other.requireDeedSignature == requireDeedSignature) &&
            (identical(
                    other.visitorApprovalRequired, visitorApprovalRequired) ||
                other.visitorApprovalRequired == visitorApprovalRequired) &&
            const DeepCollectionEquality()
                .equals(other._emergencyContacts, _emergencyContacts) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageKey, imageKey) ||
                other.imageKey == imageKey) &&
            (identical(other.operatingHours, operatingHours) ||
                other.operatingHours == operatingHours) &&
            (identical(other.imageKeyAlt, imageKeyAlt) ||
                other.imageKeyAlt == imageKeyAlt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      autoApproveUsers,
      requireDeedSignature,
      visitorApprovalRequired,
      const DeepCollectionEquality().hash(_emergencyContacts),
      imageUrl,
      imageKey,
      operatingHours,
      imageKeyAlt);

  /// Create a copy of EstateSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstateSettingsImplCopyWith<_$EstateSettingsImpl> get copyWith =>
      __$$EstateSettingsImplCopyWithImpl<_$EstateSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstateSettingsImplToJson(
      this,
    );
  }
}

abstract class _EstateSettings implements EstateSettings {
  const factory _EstateSettings(
          {@JsonKey(name: 'auto_approve_users')
          required final bool? autoApproveUsers,
          @JsonKey(name: 'require_deed_signature')
          required final bool? requireDeedSignature,
          @JsonKey(name: 'visitor_approval_required')
          required final bool? visitorApprovalRequired,
          @JsonKey(name: 'emergency_contacts')
          final Map<String, List<dynamic>>? emergencyContacts,
          @JsonKey(name: 'image_url') required final String? imageUrl,
          @JsonKey(name: 'image_key') required final String? imageKey,
          @JsonKey(name: 'operating_hours')
          required final OperatingHours? operatingHours,
          @JsonKey(name: 'image_Key') required final String? imageKeyAlt}) =
      _$EstateSettingsImpl;

  factory _EstateSettings.fromJson(Map<String, dynamic> json) =
      _$EstateSettingsImpl.fromJson;

  @override
  @JsonKey(name: 'auto_approve_users')
  bool? get autoApproveUsers;
  @override
  @JsonKey(name: 'require_deed_signature')
  bool? get requireDeedSignature;
  @override
  @JsonKey(name: 'visitor_approval_required')
  bool? get visitorApprovalRequired;
  @override
  @JsonKey(name: 'emergency_contacts')
  Map<String, List<dynamic>>? get emergencyContacts;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'image_key')
  String? get imageKey;
  @override
  @JsonKey(name: 'operating_hours')
  OperatingHours? get operatingHours;
  @override
  @JsonKey(name: 'image_Key')
  String? get imageKeyAlt;

  /// Create a copy of EstateSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstateSettingsImplCopyWith<_$EstateSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
