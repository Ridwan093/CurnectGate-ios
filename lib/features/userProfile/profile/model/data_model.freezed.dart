// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  int get id => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_code')
  String get memberCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate_code')
  String get estateCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate_name')
  String get estateName => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_url')
  String get mediaUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_notification')
  String get preferredNotification => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_login_at')
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {int id,
      String firstname,
      String lastname,
      @JsonKey(name: 'full_name') String fullName,
      String email,
      String phone,
      @JsonKey(name: 'member_code') String memberCode,
      @JsonKey(name: 'estate_code') String estateCode,
      @JsonKey(name: 'estate_name') String estateName,
      String? gender,
      String role,
      bool status,
      @JsonKey(name: 'media_url') String mediaUrl,
      @JsonKey(name: 'preferred_notification') String preferredNotification,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'last_login_at') DateTime? lastLoginAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? fullName = null,
    Object? email = null,
    Object? phone = null,
    Object? memberCode = null,
    Object? estateCode = null,
    Object? estateName = null,
    Object? gender = freezed,
    Object? role = null,
    Object? status = null,
    Object? mediaUrl = null,
    Object? preferredNotification = null,
    Object? emailVerifiedAt = freezed,
    Object? lastLoginAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      memberCode: null == memberCode
          ? _value.memberCode
          : memberCode // ignore: cast_nullable_to_non_nullable
              as String,
      estateCode: null == estateCode
          ? _value.estateCode
          : estateCode // ignore: cast_nullable_to_non_nullable
              as String,
      estateName: null == estateName
          ? _value.estateName
          : estateName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      preferredNotification: null == preferredNotification
          ? _value.preferredNotification
          : preferredNotification // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String firstname,
      String lastname,
      @JsonKey(name: 'full_name') String fullName,
      String email,
      String phone,
      @JsonKey(name: 'member_code') String memberCode,
      @JsonKey(name: 'estate_code') String estateCode,
      @JsonKey(name: 'estate_name') String estateName,
      String? gender,
      String role,
      bool status,
      @JsonKey(name: 'media_url') String mediaUrl,
      @JsonKey(name: 'preferred_notification') String preferredNotification,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'last_login_at') DateTime? lastLoginAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? fullName = null,
    Object? email = null,
    Object? phone = null,
    Object? memberCode = null,
    Object? estateCode = null,
    Object? estateName = null,
    Object? gender = freezed,
    Object? role = null,
    Object? status = null,
    Object? mediaUrl = null,
    Object? preferredNotification = null,
    Object? emailVerifiedAt = freezed,
    Object? lastLoginAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      memberCode: null == memberCode
          ? _value.memberCode
          : memberCode // ignore: cast_nullable_to_non_nullable
              as String,
      estateCode: null == estateCode
          ? _value.estateCode
          : estateCode // ignore: cast_nullable_to_non_nullable
              as String,
      estateName: null == estateName
          ? _value.estateName
          : estateName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      preferredNotification: null == preferredNotification
          ? _value.preferredNotification
          : preferredNotification // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {this.id = 0,
      this.firstname = '',
      this.lastname = '',
      @JsonKey(name: 'full_name') this.fullName = '',
      this.email = '',
      this.phone = '',
      @JsonKey(name: 'member_code') this.memberCode = '',
      @JsonKey(name: 'estate_code') this.estateCode = '',
      @JsonKey(name: 'estate_name') this.estateName = '',
      this.gender,
      this.role = '',
      this.status = false,
      @JsonKey(name: 'media_url') this.mediaUrl = '',
      @JsonKey(name: 'preferred_notification') this.preferredNotification = '',
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'last_login_at') this.lastLoginAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String firstname;
  @override
  @JsonKey()
  final String lastname;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey(name: 'member_code')
  final String memberCode;
  @override
  @JsonKey(name: 'estate_code')
  final String estateCode;
  @override
  @JsonKey(name: 'estate_name')
  final String estateName;
  @override
  final String? gender;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final bool status;
  @override
  @JsonKey(name: 'media_url')
  final String mediaUrl;
  @override
  @JsonKey(name: 'preferred_notification')
  final String preferredNotification;
  @override
  @JsonKey(name: 'email_verified_at')
  final DateTime? emailVerifiedAt;
  @override
  @JsonKey(name: 'last_login_at')
  final DateTime? lastLoginAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Data(id: $id, firstname: $firstname, lastname: $lastname, fullName: $fullName, email: $email, phone: $phone, memberCode: $memberCode, estateCode: $estateCode, estateName: $estateName, gender: $gender, role: $role, status: $status, mediaUrl: $mediaUrl, preferredNotification: $preferredNotification, emailVerifiedAt: $emailVerifiedAt, lastLoginAt: $lastLoginAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.memberCode, memberCode) ||
                other.memberCode == memberCode) &&
            (identical(other.estateCode, estateCode) ||
                other.estateCode == estateCode) &&
            (identical(other.estateName, estateName) ||
                other.estateName == estateName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.preferredNotification, preferredNotification) ||
                other.preferredNotification == preferredNotification) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
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
      firstname,
      lastname,
      fullName,
      email,
      phone,
      memberCode,
      estateCode,
      estateName,
      gender,
      role,
      status,
      mediaUrl,
      preferredNotification,
      emailVerifiedAt,
      lastLoginAt,
      createdAt,
      updatedAt);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {final int id,
      final String firstname,
      final String lastname,
      @JsonKey(name: 'full_name') final String fullName,
      final String email,
      final String phone,
      @JsonKey(name: 'member_code') final String memberCode,
      @JsonKey(name: 'estate_code') final String estateCode,
      @JsonKey(name: 'estate_name') final String estateName,
      final String? gender,
      final String role,
      final bool status,
      @JsonKey(name: 'media_url') final String mediaUrl,
      @JsonKey(name: 'preferred_notification')
      final String preferredNotification,
      @JsonKey(name: 'email_verified_at') final DateTime? emailVerifiedAt,
      @JsonKey(name: 'last_login_at') final DateTime? lastLoginAt,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  int get id;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  String get email;
  @override
  String get phone;
  @override
  @JsonKey(name: 'member_code')
  String get memberCode;
  @override
  @JsonKey(name: 'estate_code')
  String get estateCode;
  @override
  @JsonKey(name: 'estate_name')
  String get estateName;
  @override
  String? get gender;
  @override
  String get role;
  @override
  bool get status;
  @override
  @JsonKey(name: 'media_url')
  String get mediaUrl;
  @override
  @JsonKey(name: 'preferred_notification')
  String get preferredNotification;
  @override
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt;
  @override
  @JsonKey(name: 'last_login_at')
  DateTime? get lastLoginAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
