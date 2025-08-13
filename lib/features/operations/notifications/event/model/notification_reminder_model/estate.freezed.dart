// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Estate _$EstateFromJson(Map<String, dynamic> json) {
  return _Estate.fromJson(json);
}

/// @nodoc
mixin _$Estate {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'onboarded_by')
  int? get onboardedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate_code')
  String? get estateCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'state_id')
  int? get stateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_email')
  String? get contactEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_phone')
  String? get contactPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'settings')
  EstateSettings? get settings => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_url')
  String? get mediaUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_key')
  String? get mediaKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Estate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstateCopyWith<Estate> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstateCopyWith<$Res> {
  factory $EstateCopyWith(Estate value, $Res Function(Estate) then) =
      _$EstateCopyWithImpl<$Res, Estate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'onboarded_by') int? onboardedBy,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'estate_code') String? estateCode,
      @JsonKey(name: 'state_id') int? stateId,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'postal_code') String? postalCode,
      @JsonKey(name: 'contact_email') String? contactEmail,
      @JsonKey(name: 'contact_phone') String? contactPhone,
      @JsonKey(name: 'settings') EstateSettings? settings,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'media_url') String? mediaUrl,
      @JsonKey(name: 'media_key') String? mediaKey,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});

  $EstateSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class _$EstateCopyWithImpl<$Res, $Val extends Estate>
    implements $EstateCopyWith<$Res> {
  _$EstateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? onboardedBy = freezed,
    Object? address = freezed,
    Object? estateCode = freezed,
    Object? stateId = freezed,
    Object? city = freezed,
    Object? postalCode = freezed,
    Object? contactEmail = freezed,
    Object? contactPhone = freezed,
    Object? settings = freezed,
    Object? status = freezed,
    Object? mediaUrl = freezed,
    Object? mediaKey = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      onboardedBy: freezed == onboardedBy
          ? _value.onboardedBy
          : onboardedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      estateCode: freezed == estateCode
          ? _value.estateCode
          : estateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as EstateSettings?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaKey: freezed == mediaKey
          ? _value.mediaKey
          : mediaKey // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EstateSettingsCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $EstateSettingsCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EstateImplCopyWith<$Res> implements $EstateCopyWith<$Res> {
  factory _$$EstateImplCopyWith(
          _$EstateImpl value, $Res Function(_$EstateImpl) then) =
      __$$EstateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'onboarded_by') int? onboardedBy,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'estate_code') String? estateCode,
      @JsonKey(name: 'state_id') int? stateId,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'postal_code') String? postalCode,
      @JsonKey(name: 'contact_email') String? contactEmail,
      @JsonKey(name: 'contact_phone') String? contactPhone,
      @JsonKey(name: 'settings') EstateSettings? settings,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'media_url') String? mediaUrl,
      @JsonKey(name: 'media_key') String? mediaKey,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});

  @override
  $EstateSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class __$$EstateImplCopyWithImpl<$Res>
    extends _$EstateCopyWithImpl<$Res, _$EstateImpl>
    implements _$$EstateImplCopyWith<$Res> {
  __$$EstateImplCopyWithImpl(
      _$EstateImpl _value, $Res Function(_$EstateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? onboardedBy = freezed,
    Object? address = freezed,
    Object? estateCode = freezed,
    Object? stateId = freezed,
    Object? city = freezed,
    Object? postalCode = freezed,
    Object? contactEmail = freezed,
    Object? contactPhone = freezed,
    Object? settings = freezed,
    Object? status = freezed,
    Object? mediaUrl = freezed,
    Object? mediaKey = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EstateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      onboardedBy: freezed == onboardedBy
          ? _value.onboardedBy
          : onboardedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      estateCode: freezed == estateCode
          ? _value.estateCode
          : estateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as int?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      contactEmail: freezed == contactEmail
          ? _value.contactEmail
          : contactEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as EstateSettings?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaKey: freezed == mediaKey
          ? _value.mediaKey
          : mediaKey // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$EstateImpl implements _Estate {
  const _$EstateImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'onboarded_by') required this.onboardedBy,
      @JsonKey(name: 'address') required this.address,
      @JsonKey(name: 'estate_code') required this.estateCode,
      @JsonKey(name: 'state_id') required this.stateId,
      @JsonKey(name: 'city') required this.city,
      @JsonKey(name: 'postal_code') required this.postalCode,
      @JsonKey(name: 'contact_email') required this.contactEmail,
      @JsonKey(name: 'contact_phone') required this.contactPhone,
      @JsonKey(name: 'settings') required this.settings,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'media_url') required this.mediaUrl,
      @JsonKey(name: 'media_key') required this.mediaKey,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$EstateImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstateImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'onboarded_by')
  final int? onboardedBy;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'estate_code')
  final String? estateCode;
  @override
  @JsonKey(name: 'state_id')
  final int? stateId;
  @override
  @JsonKey(name: 'city')
  final String? city;
  @override
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @override
  @JsonKey(name: 'contact_email')
  final String? contactEmail;
  @override
  @JsonKey(name: 'contact_phone')
  final String? contactPhone;
  @override
  @JsonKey(name: 'settings')
  final EstateSettings? settings;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'media_url')
  final String? mediaUrl;
  @override
  @JsonKey(name: 'media_key')
  final String? mediaKey;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'Estate(id: $id, name: $name, onboardedBy: $onboardedBy, address: $address, estateCode: $estateCode, stateId: $stateId, city: $city, postalCode: $postalCode, contactEmail: $contactEmail, contactPhone: $contactPhone, settings: $settings, status: $status, mediaUrl: $mediaUrl, mediaKey: $mediaKey, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.onboardedBy, onboardedBy) ||
                other.onboardedBy == onboardedBy) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.estateCode, estateCode) ||
                other.estateCode == estateCode) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.mediaKey, mediaKey) ||
                other.mediaKey == mediaKey) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      onboardedBy,
      address,
      estateCode,
      stateId,
      city,
      postalCode,
      contactEmail,
      contactPhone,
      settings,
      status,
      mediaUrl,
      mediaKey,
      createdAt,
      updatedAt);

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstateImplCopyWith<_$EstateImpl> get copyWith =>
      __$$EstateImplCopyWithImpl<_$EstateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstateImplToJson(
      this,
    );
  }
}

abstract class _Estate implements Estate {
  const factory _Estate(
          {@JsonKey(name: 'id') required final int? id,
          @JsonKey(name: 'name') required final String? name,
          @JsonKey(name: 'onboarded_by') required final int? onboardedBy,
          @JsonKey(name: 'address') required final String? address,
          @JsonKey(name: 'estate_code') required final String? estateCode,
          @JsonKey(name: 'state_id') required final int? stateId,
          @JsonKey(name: 'city') required final String? city,
          @JsonKey(name: 'postal_code') required final String? postalCode,
          @JsonKey(name: 'contact_email') required final String? contactEmail,
          @JsonKey(name: 'contact_phone') required final String? contactPhone,
          @JsonKey(name: 'settings') required final EstateSettings? settings,
          @JsonKey(name: 'status') required final String? status,
          @JsonKey(name: 'media_url') required final String? mediaUrl,
          @JsonKey(name: 'media_key') required final String? mediaKey,
          @JsonKey(name: 'created_at') required final String? createdAt,
          @JsonKey(name: 'updated_at') required final String? updatedAt}) =
      _$EstateImpl;

  factory _Estate.fromJson(Map<String, dynamic> json) = _$EstateImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'onboarded_by')
  int? get onboardedBy;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'estate_code')
  String? get estateCode;
  @override
  @JsonKey(name: 'state_id')
  int? get stateId;
  @override
  @JsonKey(name: 'city')
  String? get city;
  @override
  @JsonKey(name: 'postal_code')
  String? get postalCode;
  @override
  @JsonKey(name: 'contact_email')
  String? get contactEmail;
  @override
  @JsonKey(name: 'contact_phone')
  String? get contactPhone;
  @override
  @JsonKey(name: 'settings')
  EstateSettings? get settings;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'media_url')
  String? get mediaUrl;
  @override
  @JsonKey(name: 'media_key')
  String? get mediaKey;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of Estate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstateImplCopyWith<_$EstateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
