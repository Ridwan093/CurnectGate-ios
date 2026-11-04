// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int? get id => throw _privateConstructorUsedError;
  String? get firstname => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_code')
  String? get memberCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_url')
  String? get mediaUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_key')
  String? get mediaKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate_code')
  String? get estateCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate_name')
  String? get estateName => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate_id')
  int? get estateId => throw _privateConstructorUsedError;
  dynamic get dob => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  dynamic get address => throw _privateConstructorUsedError;
  dynamic get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'digital_id_code')
  String? get digitalIdCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'digital_qr_code')
  dynamic get digitalQrCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'digital_id_status')
  bool? get digitalIdStatus => throw _privateConstructorUsedError;
  dynamic get signature => throw _privateConstructorUsedError;
  @JsonKey(name: 'deed_of_agreement_sign')
  bool? get deedOfAgreementSign => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  dynamic get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_code_expires_at')
  dynamic get verificationCodeExpiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_service_provider')
  bool? get isServiceProvider => throw _privateConstructorUsedError;
  @JsonKey(name: 'password_change_required')
  bool? get passwordChangeRequired => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_notification')
  String? get preferredNotification => throw _privateConstructorUsedError;
  @JsonKey(name: 'agree_to_terms')
  bool? get agreeToTerms => throw _privateConstructorUsedError;
  UserSettings? get settings => throw _privateConstructorUsedError;
  @JsonKey(name: 'curfew_settings')
  dynamic get curfewSettings => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_login_at')
  dynamic get lastLoginAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image_url')
  dynamic get profileImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image_key')
  dynamic get profileImageKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int? id,
      String? firstname,
      String? lastname,
      String? email,
      String? phone,
      @JsonKey(name: 'member_code') String? memberCode,
      @JsonKey(name: 'media_url') String? mediaUrl,
      @JsonKey(name: 'media_key') String? mediaKey,
      @JsonKey(name: 'estate_code') String? estateCode,
      @JsonKey(name: 'estate_name') String? estateName,
      @JsonKey(name: 'estate_id') int? estateId,
      dynamic dob,
      String? status,
      dynamic address,
      dynamic gender,
      @JsonKey(name: 'digital_id_code') String? digitalIdCode,
      @JsonKey(name: 'digital_qr_code') dynamic digitalQrCode,
      @JsonKey(name: 'digital_id_status') bool? digitalIdStatus,
      dynamic signature,
      @JsonKey(name: 'deed_of_agreement_sign') bool? deedOfAgreementSign,
      @JsonKey(name: 'email_verified_at') dynamic emailVerifiedAt,
      @JsonKey(name: 'verification_code_expires_at')
      dynamic verificationCodeExpiresAt,
      @JsonKey(name: 'is_service_provider') bool? isServiceProvider,
      @JsonKey(name: 'password_change_required') bool? passwordChangeRequired,
      String? role,
      @JsonKey(name: 'preferred_notification') String? preferredNotification,
      @JsonKey(name: 'agree_to_terms') bool? agreeToTerms,
      UserSettings? settings,
      @JsonKey(name: 'curfew_settings') dynamic curfewSettings,
      @JsonKey(name: 'last_login_at') dynamic lastLoginAt,
      @JsonKey(name: 'profile_image_url') dynamic profileImageUrl,
      @JsonKey(name: 'profile_image_key') dynamic profileImageKey,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});

  $UserSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? memberCode = freezed,
    Object? mediaUrl = freezed,
    Object? mediaKey = freezed,
    Object? estateCode = freezed,
    Object? estateName = freezed,
    Object? estateId = freezed,
    Object? dob = freezed,
    Object? status = freezed,
    Object? address = freezed,
    Object? gender = freezed,
    Object? digitalIdCode = freezed,
    Object? digitalQrCode = freezed,
    Object? digitalIdStatus = freezed,
    Object? signature = freezed,
    Object? deedOfAgreementSign = freezed,
    Object? emailVerifiedAt = freezed,
    Object? verificationCodeExpiresAt = freezed,
    Object? isServiceProvider = freezed,
    Object? passwordChangeRequired = freezed,
    Object? role = freezed,
    Object? preferredNotification = freezed,
    Object? agreeToTerms = freezed,
    Object? settings = freezed,
    Object? curfewSettings = freezed,
    Object? lastLoginAt = freezed,
    Object? profileImageUrl = freezed,
    Object? profileImageKey = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCode: freezed == memberCode
          ? _value.memberCode
          : memberCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaKey: freezed == mediaKey
          ? _value.mediaKey
          : mediaKey // ignore: cast_nullable_to_non_nullable
              as String?,
      estateCode: freezed == estateCode
          ? _value.estateCode
          : estateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      estateName: freezed == estateName
          ? _value.estateName
          : estateName // ignore: cast_nullable_to_non_nullable
              as String?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      digitalIdCode: freezed == digitalIdCode
          ? _value.digitalIdCode
          : digitalIdCode // ignore: cast_nullable_to_non_nullable
              as String?,
      digitalQrCode: freezed == digitalQrCode
          ? _value.digitalQrCode
          : digitalQrCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      digitalIdStatus: freezed == digitalIdStatus
          ? _value.digitalIdStatus
          : digitalIdStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deedOfAgreementSign: freezed == deedOfAgreementSign
          ? _value.deedOfAgreementSign
          : deedOfAgreementSign // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      verificationCodeExpiresAt: freezed == verificationCodeExpiresAt
          ? _value.verificationCodeExpiresAt
          : verificationCodeExpiresAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isServiceProvider: freezed == isServiceProvider
          ? _value.isServiceProvider
          : isServiceProvider // ignore: cast_nullable_to_non_nullable
              as bool?,
      passwordChangeRequired: freezed == passwordChangeRequired
          ? _value.passwordChangeRequired
          : passwordChangeRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredNotification: freezed == preferredNotification
          ? _value.preferredNotification
          : preferredNotification // ignore: cast_nullable_to_non_nullable
              as String?,
      agreeToTerms: freezed == agreeToTerms
          ? _value.agreeToTerms
          : agreeToTerms // ignore: cast_nullable_to_non_nullable
              as bool?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as UserSettings?,
      curfewSettings: freezed == curfewSettings
          ? _value.curfewSettings
          : curfewSettings // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profileImageKey: freezed == profileImageKey
          ? _value.profileImageKey
          : profileImageKey // ignore: cast_nullable_to_non_nullable
              as dynamic,
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

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSettingsCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $UserSettingsCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? firstname,
      String? lastname,
      String? email,
      String? phone,
      @JsonKey(name: 'member_code') String? memberCode,
      @JsonKey(name: 'media_url') String? mediaUrl,
      @JsonKey(name: 'media_key') String? mediaKey,
      @JsonKey(name: 'estate_code') String? estateCode,
      @JsonKey(name: 'estate_name') String? estateName,
      @JsonKey(name: 'estate_id') int? estateId,
      dynamic dob,
      String? status,
      dynamic address,
      dynamic gender,
      @JsonKey(name: 'digital_id_code') String? digitalIdCode,
      @JsonKey(name: 'digital_qr_code') dynamic digitalQrCode,
      @JsonKey(name: 'digital_id_status') bool? digitalIdStatus,
      dynamic signature,
      @JsonKey(name: 'deed_of_agreement_sign') bool? deedOfAgreementSign,
      @JsonKey(name: 'email_verified_at') dynamic emailVerifiedAt,
      @JsonKey(name: 'verification_code_expires_at')
      dynamic verificationCodeExpiresAt,
      @JsonKey(name: 'is_service_provider') bool? isServiceProvider,
      @JsonKey(name: 'password_change_required') bool? passwordChangeRequired,
      String? role,
      @JsonKey(name: 'preferred_notification') String? preferredNotification,
      @JsonKey(name: 'agree_to_terms') bool? agreeToTerms,
      UserSettings? settings,
      @JsonKey(name: 'curfew_settings') dynamic curfewSettings,
      @JsonKey(name: 'last_login_at') dynamic lastLoginAt,
      @JsonKey(name: 'profile_image_url') dynamic profileImageUrl,
      @JsonKey(name: 'profile_image_key') dynamic profileImageKey,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});

  @override
  $UserSettingsCopyWith<$Res>? get settings;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? memberCode = freezed,
    Object? mediaUrl = freezed,
    Object? mediaKey = freezed,
    Object? estateCode = freezed,
    Object? estateName = freezed,
    Object? estateId = freezed,
    Object? dob = freezed,
    Object? status = freezed,
    Object? address = freezed,
    Object? gender = freezed,
    Object? digitalIdCode = freezed,
    Object? digitalQrCode = freezed,
    Object? digitalIdStatus = freezed,
    Object? signature = freezed,
    Object? deedOfAgreementSign = freezed,
    Object? emailVerifiedAt = freezed,
    Object? verificationCodeExpiresAt = freezed,
    Object? isServiceProvider = freezed,
    Object? passwordChangeRequired = freezed,
    Object? role = freezed,
    Object? preferredNotification = freezed,
    Object? agreeToTerms = freezed,
    Object? settings = freezed,
    Object? curfewSettings = freezed,
    Object? lastLoginAt = freezed,
    Object? profileImageUrl = freezed,
    Object? profileImageKey = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCode: freezed == memberCode
          ? _value.memberCode
          : memberCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaKey: freezed == mediaKey
          ? _value.mediaKey
          : mediaKey // ignore: cast_nullable_to_non_nullable
              as String?,
      estateCode: freezed == estateCode
          ? _value.estateCode
          : estateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      estateName: freezed == estateName
          ? _value.estateName
          : estateName // ignore: cast_nullable_to_non_nullable
              as String?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      digitalIdCode: freezed == digitalIdCode
          ? _value.digitalIdCode
          : digitalIdCode // ignore: cast_nullable_to_non_nullable
              as String?,
      digitalQrCode: freezed == digitalQrCode
          ? _value.digitalQrCode
          : digitalQrCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      digitalIdStatus: freezed == digitalIdStatus
          ? _value.digitalIdStatus
          : digitalIdStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deedOfAgreementSign: freezed == deedOfAgreementSign
          ? _value.deedOfAgreementSign
          : deedOfAgreementSign // ignore: cast_nullable_to_non_nullable
              as bool?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      verificationCodeExpiresAt: freezed == verificationCodeExpiresAt
          ? _value.verificationCodeExpiresAt
          : verificationCodeExpiresAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isServiceProvider: freezed == isServiceProvider
          ? _value.isServiceProvider
          : isServiceProvider // ignore: cast_nullable_to_non_nullable
              as bool?,
      passwordChangeRequired: freezed == passwordChangeRequired
          ? _value.passwordChangeRequired
          : passwordChangeRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredNotification: freezed == preferredNotification
          ? _value.preferredNotification
          : preferredNotification // ignore: cast_nullable_to_non_nullable
              as String?,
      agreeToTerms: freezed == agreeToTerms
          ? _value.agreeToTerms
          : agreeToTerms // ignore: cast_nullable_to_non_nullable
              as bool?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as UserSettings?,
      curfewSettings: freezed == curfewSettings
          ? _value.curfewSettings
          : curfewSettings // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profileImageKey: freezed == profileImageKey
          ? _value.profileImageKey
          : profileImageKey // ignore: cast_nullable_to_non_nullable
              as dynamic,
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

@JsonSerializable(explicitToJson: true, nullable: true)
class _$UserImpl implements _User {
  const _$UserImpl(
      {this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.phone,
      @JsonKey(name: 'member_code') this.memberCode,
      @JsonKey(name: 'media_url') this.mediaUrl,
      @JsonKey(name: 'media_key') this.mediaKey,
      @JsonKey(name: 'estate_code') this.estateCode,
      @JsonKey(name: 'estate_name') this.estateName,
      @JsonKey(name: 'estate_id') this.estateId,
      this.dob,
      this.status,
      this.address,
      this.gender,
      @JsonKey(name: 'digital_id_code') this.digitalIdCode,
      @JsonKey(name: 'digital_qr_code') this.digitalQrCode,
      @JsonKey(name: 'digital_id_status') this.digitalIdStatus,
      this.signature,
      @JsonKey(name: 'deed_of_agreement_sign') this.deedOfAgreementSign,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'verification_code_expires_at')
      this.verificationCodeExpiresAt,
      @JsonKey(name: 'is_service_provider') this.isServiceProvider,
      @JsonKey(name: 'password_change_required') this.passwordChangeRequired,
      this.role,
      @JsonKey(name: 'preferred_notification') this.preferredNotification,
      @JsonKey(name: 'agree_to_terms') this.agreeToTerms,
      this.settings,
      @JsonKey(name: 'curfew_settings') this.curfewSettings,
      @JsonKey(name: 'last_login_at') this.lastLoginAt,
      @JsonKey(name: 'profile_image_url') this.profileImageUrl,
      @JsonKey(name: 'profile_image_key') this.profileImageKey,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int? id;
  @override
  final String? firstname;
  @override
  final String? lastname;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'member_code')
  final String? memberCode;
  @override
  @JsonKey(name: 'media_url')
  final String? mediaUrl;
  @override
  @JsonKey(name: 'media_key')
  final String? mediaKey;
  @override
  @JsonKey(name: 'estate_code')
  final String? estateCode;
  @override
  @JsonKey(name: 'estate_name')
  final String? estateName;
  @override
  @JsonKey(name: 'estate_id')
  final int? estateId;
  @override
  final dynamic dob;
  @override
  final String? status;
  @override
  final dynamic address;
  @override
  final dynamic gender;
  @override
  @JsonKey(name: 'digital_id_code')
  final String? digitalIdCode;
  @override
  @JsonKey(name: 'digital_qr_code')
  final dynamic digitalQrCode;
  @override
  @JsonKey(name: 'digital_id_status')
  final bool? digitalIdStatus;
  @override
  final dynamic signature;
  @override
  @JsonKey(name: 'deed_of_agreement_sign')
  final bool? deedOfAgreementSign;
  @override
  @JsonKey(name: 'email_verified_at')
  final dynamic emailVerifiedAt;
  @override
  @JsonKey(name: 'verification_code_expires_at')
  final dynamic verificationCodeExpiresAt;
  @override
  @JsonKey(name: 'is_service_provider')
  final bool? isServiceProvider;
  @override
  @JsonKey(name: 'password_change_required')
  final bool? passwordChangeRequired;
  @override
  final String? role;
  @override
  @JsonKey(name: 'preferred_notification')
  final String? preferredNotification;
  @override
  @JsonKey(name: 'agree_to_terms')
  final bool? agreeToTerms;
  @override
  final UserSettings? settings;
  @override
  @JsonKey(name: 'curfew_settings')
  final dynamic curfewSettings;
  @override
  @JsonKey(name: 'last_login_at')
  final dynamic lastLoginAt;
  @override
  @JsonKey(name: 'profile_image_url')
  final dynamic profileImageUrl;
  @override
  @JsonKey(name: 'profile_image_key')
  final dynamic profileImageKey;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'User(id: $id, firstname: $firstname, lastname: $lastname, email: $email, phone: $phone, memberCode: $memberCode, mediaUrl: $mediaUrl, mediaKey: $mediaKey, estateCode: $estateCode, estateName: $estateName, estateId: $estateId, dob: $dob, status: $status, address: $address, gender: $gender, digitalIdCode: $digitalIdCode, digitalQrCode: $digitalQrCode, digitalIdStatus: $digitalIdStatus, signature: $signature, deedOfAgreementSign: $deedOfAgreementSign, emailVerifiedAt: $emailVerifiedAt, verificationCodeExpiresAt: $verificationCodeExpiresAt, isServiceProvider: $isServiceProvider, passwordChangeRequired: $passwordChangeRequired, role: $role, preferredNotification: $preferredNotification, agreeToTerms: $agreeToTerms, settings: $settings, curfewSettings: $curfewSettings, lastLoginAt: $lastLoginAt, profileImageUrl: $profileImageUrl, profileImageKey: $profileImageKey, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.memberCode, memberCode) ||
                other.memberCode == memberCode) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.mediaKey, mediaKey) ||
                other.mediaKey == mediaKey) &&
            (identical(other.estateCode, estateCode) ||
                other.estateCode == estateCode) &&
            (identical(other.estateName, estateName) ||
                other.estateName == estateName) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            const DeepCollectionEquality().equals(other.dob, dob) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            (identical(other.digitalIdCode, digitalIdCode) ||
                other.digitalIdCode == digitalIdCode) &&
            const DeepCollectionEquality()
                .equals(other.digitalQrCode, digitalQrCode) &&
            (identical(other.digitalIdStatus, digitalIdStatus) ||
                other.digitalIdStatus == digitalIdStatus) &&
            const DeepCollectionEquality().equals(other.signature, signature) &&
            (identical(other.deedOfAgreementSign, deedOfAgreementSign) ||
                other.deedOfAgreementSign == deedOfAgreementSign) &&
            const DeepCollectionEquality()
                .equals(other.emailVerifiedAt, emailVerifiedAt) &&
            const DeepCollectionEquality().equals(
                other.verificationCodeExpiresAt, verificationCodeExpiresAt) &&
            (identical(other.isServiceProvider, isServiceProvider) ||
                other.isServiceProvider == isServiceProvider) &&
            (identical(other.passwordChangeRequired, passwordChangeRequired) ||
                other.passwordChangeRequired == passwordChangeRequired) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.preferredNotification, preferredNotification) ||
                other.preferredNotification == preferredNotification) &&
            (identical(other.agreeToTerms, agreeToTerms) ||
                other.agreeToTerms == agreeToTerms) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            const DeepCollectionEquality()
                .equals(other.curfewSettings, curfewSettings) &&
            const DeepCollectionEquality()
                .equals(other.lastLoginAt, lastLoginAt) &&
            const DeepCollectionEquality()
                .equals(other.profileImageUrl, profileImageUrl) &&
            const DeepCollectionEquality()
                .equals(other.profileImageKey, profileImageKey) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        firstname,
        lastname,
        email,
        phone,
        memberCode,
        mediaUrl,
        mediaKey,
        estateCode,
        estateName,
        estateId,
        const DeepCollectionEquality().hash(dob),
        status,
        const DeepCollectionEquality().hash(address),
        const DeepCollectionEquality().hash(gender),
        digitalIdCode,
        const DeepCollectionEquality().hash(digitalQrCode),
        digitalIdStatus,
        const DeepCollectionEquality().hash(signature),
        deedOfAgreementSign,
        const DeepCollectionEquality().hash(emailVerifiedAt),
        const DeepCollectionEquality().hash(verificationCodeExpiresAt),
        isServiceProvider,
        passwordChangeRequired,
        role,
        preferredNotification,
        agreeToTerms,
        settings,
        const DeepCollectionEquality().hash(curfewSettings),
        const DeepCollectionEquality().hash(lastLoginAt),
        const DeepCollectionEquality().hash(profileImageUrl),
        const DeepCollectionEquality().hash(profileImageKey),
        createdAt,
        updatedAt
      ]);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final int? id,
      final String? firstname,
      final String? lastname,
      final String? email,
      final String? phone,
      @JsonKey(name: 'member_code') final String? memberCode,
      @JsonKey(name: 'media_url') final String? mediaUrl,
      @JsonKey(name: 'media_key') final String? mediaKey,
      @JsonKey(name: 'estate_code') final String? estateCode,
      @JsonKey(name: 'estate_name') final String? estateName,
      @JsonKey(name: 'estate_id') final int? estateId,
      final dynamic dob,
      final String? status,
      final dynamic address,
      final dynamic gender,
      @JsonKey(name: 'digital_id_code') final String? digitalIdCode,
      @JsonKey(name: 'digital_qr_code') final dynamic digitalQrCode,
      @JsonKey(name: 'digital_id_status') final bool? digitalIdStatus,
      final dynamic signature,
      @JsonKey(name: 'deed_of_agreement_sign') final bool? deedOfAgreementSign,
      @JsonKey(name: 'email_verified_at') final dynamic emailVerifiedAt,
      @JsonKey(name: 'verification_code_expires_at')
      final dynamic verificationCodeExpiresAt,
      @JsonKey(name: 'is_service_provider') final bool? isServiceProvider,
      @JsonKey(name: 'password_change_required')
      final bool? passwordChangeRequired,
      final String? role,
      @JsonKey(name: 'preferred_notification')
      final String? preferredNotification,
      @JsonKey(name: 'agree_to_terms') final bool? agreeToTerms,
      final UserSettings? settings,
      @JsonKey(name: 'curfew_settings') final dynamic curfewSettings,
      @JsonKey(name: 'last_login_at') final dynamic lastLoginAt,
      @JsonKey(name: 'profile_image_url') final dynamic profileImageUrl,
      @JsonKey(name: 'profile_image_key') final dynamic profileImageKey,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int? get id;
  @override
  String? get firstname;
  @override
  String? get lastname;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'member_code')
  String? get memberCode;
  @override
  @JsonKey(name: 'media_url')
  String? get mediaUrl;
  @override
  @JsonKey(name: 'media_key')
  String? get mediaKey;
  @override
  @JsonKey(name: 'estate_code')
  String? get estateCode;
  @override
  @JsonKey(name: 'estate_name')
  String? get estateName;
  @override
  @JsonKey(name: 'estate_id')
  int? get estateId;
  @override
  dynamic get dob;
  @override
  String? get status;
  @override
  dynamic get address;
  @override
  dynamic get gender;
  @override
  @JsonKey(name: 'digital_id_code')
  String? get digitalIdCode;
  @override
  @JsonKey(name: 'digital_qr_code')
  dynamic get digitalQrCode;
  @override
  @JsonKey(name: 'digital_id_status')
  bool? get digitalIdStatus;
  @override
  dynamic get signature;
  @override
  @JsonKey(name: 'deed_of_agreement_sign')
  bool? get deedOfAgreementSign;
  @override
  @JsonKey(name: 'email_verified_at')
  dynamic get emailVerifiedAt;
  @override
  @JsonKey(name: 'verification_code_expires_at')
  dynamic get verificationCodeExpiresAt;
  @override
  @JsonKey(name: 'is_service_provider')
  bool? get isServiceProvider;
  @override
  @JsonKey(name: 'password_change_required')
  bool? get passwordChangeRequired;
  @override
  String? get role;
  @override
  @JsonKey(name: 'preferred_notification')
  String? get preferredNotification;
  @override
  @JsonKey(name: 'agree_to_terms')
  bool? get agreeToTerms;
  @override
  UserSettings? get settings;
  @override
  @JsonKey(name: 'curfew_settings')
  dynamic get curfewSettings;
  @override
  @JsonKey(name: 'last_login_at')
  dynamic get lastLoginAt;
  @override
  @JsonKey(name: 'profile_image_url')
  dynamic get profileImageUrl;
  @override
  @JsonKey(name: 'profile_image_key')
  dynamic get profileImageKey;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
