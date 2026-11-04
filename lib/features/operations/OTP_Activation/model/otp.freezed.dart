// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Otp _$OtpFromJson(Map<String, dynamic> json) {
  return _Otp.fromJson(json);
}

/// @nodoc
mixin _$Otp {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate_id', fromJson: NullSafetyHelper.safeInt)
  int get estateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'property_id', fromJson: NullSafetyHelper.safeInt)
  int get propertyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'generated_by', fromJson: NullSafetyHelper.safeInt)
  int get generatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'otp_code', fromJson: NullSafetyHelper.safeString)
  String get otpCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'barcode_data', fromJson: NullSafetyHelper.safeString)
  String get barcodeData => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_code_data', fromJson: NullSafetyHelper.safeString)
  String get qrCodeData => throw _privateConstructorUsedError;
  @JsonKey(name: 'visitor_name', fromJson: NullSafetyHelper.safeString)
  String get visitorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'purpose', fromJson: NullSafetyHelper.safeString)
  String get purpose => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_from', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get validFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_until', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get validUntil => throw _privateConstructorUsedError;
  @JsonKey(name: 'validity_hours', fromJson: NullSafetyHelper.safeInt)
  int get validityHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', fromJson: NullSafetyHelper.safeString)
  String get status => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'requires_security_validation', fromJson: NullSafetyHelper.safeBool)
  bool get requiresSecurityValidation => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'security_clearance_level', fromJson: NullSafetyHelper.safeString)
  String get securityClearanceLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'used_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime? get usedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'used_by', fromJson: NullSafetyHelper.safeInt)
  int? get usedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'metadata', fromJson: NullSafetyHelper.safeMap)
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_remaining', fromJson: NullSafetyHelper.safeDouble)
  double get timeRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', fromJson: NullSafetyHelper.safeBool)
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'countdown_display', fromJson: NullSafetyHelper.safeString)
  String get countdownDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'security_status', fromJson: NullSafetyHelper.safeString)
  String get securityStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'destination_info')
  DestinationInfo? get destinationInfo => throw _privateConstructorUsedError;
  Estate get estate => throw _privateConstructorUsedError;
  Property? get property => throw _privateConstructorUsedError;

  /// Serializes this Otp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Otp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpCopyWith<Otp> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpCopyWith<$Res> {
  factory $OtpCopyWith(Otp value, $Res Function(Otp) then) =
      _$OtpCopyWithImpl<$Res, Otp>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'estate_id', fromJson: NullSafetyHelper.safeInt)
      int estateId,
      @JsonKey(name: 'property_id', fromJson: NullSafetyHelper.safeInt)
      int propertyId,
      @JsonKey(name: 'generated_by', fromJson: NullSafetyHelper.safeInt)
      int generatedBy,
      @JsonKey(name: 'otp_code', fromJson: NullSafetyHelper.safeString)
      String otpCode,
      @JsonKey(name: 'barcode_data', fromJson: NullSafetyHelper.safeString)
      String barcodeData,
      @JsonKey(name: 'qr_code_data', fromJson: NullSafetyHelper.safeString)
      String qrCodeData,
      @JsonKey(name: 'visitor_name', fromJson: NullSafetyHelper.safeString)
      String visitorName,
      @JsonKey(name: 'purpose', fromJson: NullSafetyHelper.safeString)
      String purpose,
      @JsonKey(name: 'valid_from', fromJson: NullSafetyHelper.safeDateTime)
      DateTime validFrom,
      @JsonKey(name: 'valid_until', fromJson: NullSafetyHelper.safeDateTime)
      DateTime validUntil,
      @JsonKey(name: 'validity_hours', fromJson: NullSafetyHelper.safeInt)
      int validityHours,
      @JsonKey(name: 'status', fromJson: NullSafetyHelper.safeString)
      String status,
      @JsonKey(
          name: 'requires_security_validation',
          fromJson: NullSafetyHelper.safeBool)
      bool requiresSecurityValidation,
      @JsonKey(
          name: 'security_clearance_level',
          fromJson: NullSafetyHelper.safeString)
      String securityClearanceLevel,
      @JsonKey(name: 'used_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime? usedAt,
      @JsonKey(name: 'used_by', fromJson: NullSafetyHelper.safeInt) int? usedBy,
      @JsonKey(name: 'metadata', fromJson: NullSafetyHelper.safeMap)
      Map<String, dynamic> metadata,
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'time_remaining', fromJson: NullSafetyHelper.safeDouble)
      double timeRemaining,
      @JsonKey(name: 'is_active', fromJson: NullSafetyHelper.safeBool)
      bool isActive,
      @JsonKey(name: 'countdown_display', fromJson: NullSafetyHelper.safeString)
      String countdownDisplay,
      @JsonKey(name: 'security_status', fromJson: NullSafetyHelper.safeString)
      String securityStatus,
      @JsonKey(name: 'destination_info') DestinationInfo? destinationInfo,
      Estate estate,
      Property? property});

  $DestinationInfoCopyWith<$Res>? get destinationInfo;
  $EstateCopyWith<$Res> get estate;
  $PropertyCopyWith<$Res>? get property;
}

/// @nodoc
class _$OtpCopyWithImpl<$Res, $Val extends Otp> implements $OtpCopyWith<$Res> {
  _$OtpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Otp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? estateId = null,
    Object? propertyId = null,
    Object? generatedBy = null,
    Object? otpCode = null,
    Object? barcodeData = null,
    Object? qrCodeData = null,
    Object? visitorName = null,
    Object? purpose = null,
    Object? validFrom = null,
    Object? validUntil = null,
    Object? validityHours = null,
    Object? status = null,
    Object? requiresSecurityValidation = null,
    Object? securityClearanceLevel = null,
    Object? usedAt = freezed,
    Object? usedBy = freezed,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? timeRemaining = null,
    Object? isActive = null,
    Object? countdownDisplay = null,
    Object? securityStatus = null,
    Object? destinationInfo = freezed,
    Object? estate = null,
    Object? property = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      estateId: null == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int,
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as int,
      generatedBy: null == generatedBy
          ? _value.generatedBy
          : generatedBy // ignore: cast_nullable_to_non_nullable
              as int,
      otpCode: null == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeData: null == barcodeData
          ? _value.barcodeData
          : barcodeData // ignore: cast_nullable_to_non_nullable
              as String,
      qrCodeData: null == qrCodeData
          ? _value.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
              as String,
      visitorName: null == visitorName
          ? _value.visitorName
          : visitorName // ignore: cast_nullable_to_non_nullable
              as String,
      purpose: null == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String,
      validFrom: null == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validUntil: null == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validityHours: null == validityHours
          ? _value.validityHours
          : validityHours // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      requiresSecurityValidation: null == requiresSecurityValidation
          ? _value.requiresSecurityValidation
          : requiresSecurityValidation // ignore: cast_nullable_to_non_nullable
              as bool,
      securityClearanceLevel: null == securityClearanceLevel
          ? _value.securityClearanceLevel
          : securityClearanceLevel // ignore: cast_nullable_to_non_nullable
              as String,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      usedBy: freezed == usedBy
          ? _value.usedBy
          : usedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeRemaining: null == timeRemaining
          ? _value.timeRemaining
          : timeRemaining // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      countdownDisplay: null == countdownDisplay
          ? _value.countdownDisplay
          : countdownDisplay // ignore: cast_nullable_to_non_nullable
              as String,
      securityStatus: null == securityStatus
          ? _value.securityStatus
          : securityStatus // ignore: cast_nullable_to_non_nullable
              as String,
      destinationInfo: freezed == destinationInfo
          ? _value.destinationInfo
          : destinationInfo // ignore: cast_nullable_to_non_nullable
              as DestinationInfo?,
      estate: null == estate
          ? _value.estate
          : estate // ignore: cast_nullable_to_non_nullable
              as Estate,
      property: freezed == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as Property?,
    ) as $Val);
  }

  /// Create a copy of Otp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DestinationInfoCopyWith<$Res>? get destinationInfo {
    if (_value.destinationInfo == null) {
      return null;
    }

    return $DestinationInfoCopyWith<$Res>(_value.destinationInfo!, (value) {
      return _then(_value.copyWith(destinationInfo: value) as $Val);
    });
  }

  /// Create a copy of Otp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EstateCopyWith<$Res> get estate {
    return $EstateCopyWith<$Res>(_value.estate, (value) {
      return _then(_value.copyWith(estate: value) as $Val);
    });
  }

  /// Create a copy of Otp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertyCopyWith<$Res>? get property {
    if (_value.property == null) {
      return null;
    }

    return $PropertyCopyWith<$Res>(_value.property!, (value) {
      return _then(_value.copyWith(property: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OtpImplCopyWith<$Res> implements $OtpCopyWith<$Res> {
  factory _$$OtpImplCopyWith(_$OtpImpl value, $Res Function(_$OtpImpl) then) =
      __$$OtpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'estate_id', fromJson: NullSafetyHelper.safeInt)
      int estateId,
      @JsonKey(name: 'property_id', fromJson: NullSafetyHelper.safeInt)
      int propertyId,
      @JsonKey(name: 'generated_by', fromJson: NullSafetyHelper.safeInt)
      int generatedBy,
      @JsonKey(name: 'otp_code', fromJson: NullSafetyHelper.safeString)
      String otpCode,
      @JsonKey(name: 'barcode_data', fromJson: NullSafetyHelper.safeString)
      String barcodeData,
      @JsonKey(name: 'qr_code_data', fromJson: NullSafetyHelper.safeString)
      String qrCodeData,
      @JsonKey(name: 'visitor_name', fromJson: NullSafetyHelper.safeString)
      String visitorName,
      @JsonKey(name: 'purpose', fromJson: NullSafetyHelper.safeString)
      String purpose,
      @JsonKey(name: 'valid_from', fromJson: NullSafetyHelper.safeDateTime)
      DateTime validFrom,
      @JsonKey(name: 'valid_until', fromJson: NullSafetyHelper.safeDateTime)
      DateTime validUntil,
      @JsonKey(name: 'validity_hours', fromJson: NullSafetyHelper.safeInt)
      int validityHours,
      @JsonKey(name: 'status', fromJson: NullSafetyHelper.safeString)
      String status,
      @JsonKey(
          name: 'requires_security_validation',
          fromJson: NullSafetyHelper.safeBool)
      bool requiresSecurityValidation,
      @JsonKey(
          name: 'security_clearance_level',
          fromJson: NullSafetyHelper.safeString)
      String securityClearanceLevel,
      @JsonKey(name: 'used_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime? usedAt,
      @JsonKey(name: 'used_by', fromJson: NullSafetyHelper.safeInt) int? usedBy,
      @JsonKey(name: 'metadata', fromJson: NullSafetyHelper.safeMap)
      Map<String, dynamic> metadata,
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'time_remaining', fromJson: NullSafetyHelper.safeDouble)
      double timeRemaining,
      @JsonKey(name: 'is_active', fromJson: NullSafetyHelper.safeBool)
      bool isActive,
      @JsonKey(name: 'countdown_display', fromJson: NullSafetyHelper.safeString)
      String countdownDisplay,
      @JsonKey(name: 'security_status', fromJson: NullSafetyHelper.safeString)
      String securityStatus,
      @JsonKey(name: 'destination_info') DestinationInfo? destinationInfo,
      Estate estate,
      Property? property});

  @override
  $DestinationInfoCopyWith<$Res>? get destinationInfo;
  @override
  $EstateCopyWith<$Res> get estate;
  @override
  $PropertyCopyWith<$Res>? get property;
}

/// @nodoc
class __$$OtpImplCopyWithImpl<$Res> extends _$OtpCopyWithImpl<$Res, _$OtpImpl>
    implements _$$OtpImplCopyWith<$Res> {
  __$$OtpImplCopyWithImpl(_$OtpImpl _value, $Res Function(_$OtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of Otp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? estateId = null,
    Object? propertyId = null,
    Object? generatedBy = null,
    Object? otpCode = null,
    Object? barcodeData = null,
    Object? qrCodeData = null,
    Object? visitorName = null,
    Object? purpose = null,
    Object? validFrom = null,
    Object? validUntil = null,
    Object? validityHours = null,
    Object? status = null,
    Object? requiresSecurityValidation = null,
    Object? securityClearanceLevel = null,
    Object? usedAt = freezed,
    Object? usedBy = freezed,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? timeRemaining = null,
    Object? isActive = null,
    Object? countdownDisplay = null,
    Object? securityStatus = null,
    Object? destinationInfo = freezed,
    Object? estate = null,
    Object? property = freezed,
  }) {
    return _then(_$OtpImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      estateId: null == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int,
      propertyId: null == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as int,
      generatedBy: null == generatedBy
          ? _value.generatedBy
          : generatedBy // ignore: cast_nullable_to_non_nullable
              as int,
      otpCode: null == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeData: null == barcodeData
          ? _value.barcodeData
          : barcodeData // ignore: cast_nullable_to_non_nullable
              as String,
      qrCodeData: null == qrCodeData
          ? _value.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
              as String,
      visitorName: null == visitorName
          ? _value.visitorName
          : visitorName // ignore: cast_nullable_to_non_nullable
              as String,
      purpose: null == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String,
      validFrom: null == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validUntil: null == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validityHours: null == validityHours
          ? _value.validityHours
          : validityHours // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      requiresSecurityValidation: null == requiresSecurityValidation
          ? _value.requiresSecurityValidation
          : requiresSecurityValidation // ignore: cast_nullable_to_non_nullable
              as bool,
      securityClearanceLevel: null == securityClearanceLevel
          ? _value.securityClearanceLevel
          : securityClearanceLevel // ignore: cast_nullable_to_non_nullable
              as String,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      usedBy: freezed == usedBy
          ? _value.usedBy
          : usedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeRemaining: null == timeRemaining
          ? _value.timeRemaining
          : timeRemaining // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      countdownDisplay: null == countdownDisplay
          ? _value.countdownDisplay
          : countdownDisplay // ignore: cast_nullable_to_non_nullable
              as String,
      securityStatus: null == securityStatus
          ? _value.securityStatus
          : securityStatus // ignore: cast_nullable_to_non_nullable
              as String,
      destinationInfo: freezed == destinationInfo
          ? _value.destinationInfo
          : destinationInfo // ignore: cast_nullable_to_non_nullable
              as DestinationInfo?,
      estate: null == estate
          ? _value.estate
          : estate // ignore: cast_nullable_to_non_nullable
              as Estate,
      property: freezed == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as Property?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OtpImpl implements _Otp {
  const _$OtpImpl(
      {this.id = 0,
      @JsonKey(name: 'estate_id', fromJson: NullSafetyHelper.safeInt)
      this.estateId = 0,
      @JsonKey(name: 'property_id', fromJson: NullSafetyHelper.safeInt)
      this.propertyId = 0,
      @JsonKey(name: 'generated_by', fromJson: NullSafetyHelper.safeInt)
      this.generatedBy = 0,
      @JsonKey(name: 'otp_code', fromJson: NullSafetyHelper.safeString)
      this.otpCode = '',
      @JsonKey(name: 'barcode_data', fromJson: NullSafetyHelper.safeString)
      this.barcodeData = '',
      @JsonKey(name: 'qr_code_data', fromJson: NullSafetyHelper.safeString)
      this.qrCodeData = '',
      @JsonKey(name: 'visitor_name', fromJson: NullSafetyHelper.safeString)
      this.visitorName = '',
      @JsonKey(name: 'purpose', fromJson: NullSafetyHelper.safeString)
      this.purpose = '',
      @JsonKey(name: 'valid_from', fromJson: NullSafetyHelper.safeDateTime)
      required this.validFrom,
      @JsonKey(name: 'valid_until', fromJson: NullSafetyHelper.safeDateTime)
      required this.validUntil,
      @JsonKey(name: 'validity_hours', fromJson: NullSafetyHelper.safeInt)
      this.validityHours = 0,
      @JsonKey(name: 'status', fromJson: NullSafetyHelper.safeString)
      this.status = '',
      @JsonKey(name: 'requires_security_validation', fromJson: NullSafetyHelper.safeBool)
      this.requiresSecurityValidation = false,
      @JsonKey(name: 'security_clearance_level', fromJson: NullSafetyHelper.safeString)
      this.securityClearanceLevel = '',
      @JsonKey(name: 'used_at', fromJson: NullSafetyHelper.safeDateTime)
      this.usedAt,
      @JsonKey(name: 'used_by', fromJson: NullSafetyHelper.safeInt) this.usedBy,
      @JsonKey(name: 'metadata', fromJson: NullSafetyHelper.safeMap)
      final Map<String, dynamic> metadata = const <String, dynamic>{},
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      required this.updatedAt,
      @JsonKey(name: 'time_remaining', fromJson: NullSafetyHelper.safeDouble)
      this.timeRemaining = 0.0,
      @JsonKey(name: 'is_active', fromJson: NullSafetyHelper.safeBool) this.isActive = false,
      @JsonKey(name: 'countdown_display', fromJson: NullSafetyHelper.safeString) this.countdownDisplay = '',
      @JsonKey(name: 'security_status', fromJson: NullSafetyHelper.safeString) this.securityStatus = '',
      @JsonKey(name: 'destination_info') this.destinationInfo,
      required this.estate,
      this.property})
      : _metadata = metadata;

  factory _$OtpImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'estate_id', fromJson: NullSafetyHelper.safeInt)
  final int estateId;
  @override
  @JsonKey(name: 'property_id', fromJson: NullSafetyHelper.safeInt)
  final int propertyId;
  @override
  @JsonKey(name: 'generated_by', fromJson: NullSafetyHelper.safeInt)
  final int generatedBy;
  @override
  @JsonKey(name: 'otp_code', fromJson: NullSafetyHelper.safeString)
  final String otpCode;
  @override
  @JsonKey(name: 'barcode_data', fromJson: NullSafetyHelper.safeString)
  final String barcodeData;
  @override
  @JsonKey(name: 'qr_code_data', fromJson: NullSafetyHelper.safeString)
  final String qrCodeData;
  @override
  @JsonKey(name: 'visitor_name', fromJson: NullSafetyHelper.safeString)
  final String visitorName;
  @override
  @JsonKey(name: 'purpose', fromJson: NullSafetyHelper.safeString)
  final String purpose;
  @override
  @JsonKey(name: 'valid_from', fromJson: NullSafetyHelper.safeDateTime)
  final DateTime validFrom;
  @override
  @JsonKey(name: 'valid_until', fromJson: NullSafetyHelper.safeDateTime)
  final DateTime validUntil;
  @override
  @JsonKey(name: 'validity_hours', fromJson: NullSafetyHelper.safeInt)
  final int validityHours;
  @override
  @JsonKey(name: 'status', fromJson: NullSafetyHelper.safeString)
  final String status;
  @override
  @JsonKey(
      name: 'requires_security_validation', fromJson: NullSafetyHelper.safeBool)
  final bool requiresSecurityValidation;
  @override
  @JsonKey(
      name: 'security_clearance_level', fromJson: NullSafetyHelper.safeString)
  final String securityClearanceLevel;
  @override
  @JsonKey(name: 'used_at', fromJson: NullSafetyHelper.safeDateTime)
  final DateTime? usedAt;
  @override
  @JsonKey(name: 'used_by', fromJson: NullSafetyHelper.safeInt)
  final int? usedBy;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey(name: 'metadata', fromJson: NullSafetyHelper.safeMap)
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'time_remaining', fromJson: NullSafetyHelper.safeDouble)
  final double timeRemaining;
  @override
  @JsonKey(name: 'is_active', fromJson: NullSafetyHelper.safeBool)
  final bool isActive;
  @override
  @JsonKey(name: 'countdown_display', fromJson: NullSafetyHelper.safeString)
  final String countdownDisplay;
  @override
  @JsonKey(name: 'security_status', fromJson: NullSafetyHelper.safeString)
  final String securityStatus;
  @override
  @JsonKey(name: 'destination_info')
  final DestinationInfo? destinationInfo;
  @override
  final Estate estate;
  @override
  final Property? property;

  @override
  String toString() {
    return 'Otp(id: $id, estateId: $estateId, propertyId: $propertyId, generatedBy: $generatedBy, otpCode: $otpCode, barcodeData: $barcodeData, qrCodeData: $qrCodeData, visitorName: $visitorName, purpose: $purpose, validFrom: $validFrom, validUntil: $validUntil, validityHours: $validityHours, status: $status, requiresSecurityValidation: $requiresSecurityValidation, securityClearanceLevel: $securityClearanceLevel, usedAt: $usedAt, usedBy: $usedBy, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt, timeRemaining: $timeRemaining, isActive: $isActive, countdownDisplay: $countdownDisplay, securityStatus: $securityStatus, destinationInfo: $destinationInfo, estate: $estate, property: $property)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.generatedBy, generatedBy) ||
                other.generatedBy == generatedBy) &&
            (identical(other.otpCode, otpCode) || other.otpCode == otpCode) &&
            (identical(other.barcodeData, barcodeData) ||
                other.barcodeData == barcodeData) &&
            (identical(other.qrCodeData, qrCodeData) ||
                other.qrCodeData == qrCodeData) &&
            (identical(other.visitorName, visitorName) ||
                other.visitorName == visitorName) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            (identical(other.validityHours, validityHours) ||
                other.validityHours == validityHours) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.requiresSecurityValidation,
                    requiresSecurityValidation) ||
                other.requiresSecurityValidation ==
                    requiresSecurityValidation) &&
            (identical(other.securityClearanceLevel, securityClearanceLevel) ||
                other.securityClearanceLevel == securityClearanceLevel) &&
            (identical(other.usedAt, usedAt) || other.usedAt == usedAt) &&
            (identical(other.usedBy, usedBy) || other.usedBy == usedBy) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.timeRemaining, timeRemaining) ||
                other.timeRemaining == timeRemaining) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.countdownDisplay, countdownDisplay) ||
                other.countdownDisplay == countdownDisplay) &&
            (identical(other.securityStatus, securityStatus) ||
                other.securityStatus == securityStatus) &&
            (identical(other.destinationInfo, destinationInfo) ||
                other.destinationInfo == destinationInfo) &&
            (identical(other.estate, estate) || other.estate == estate) &&
            (identical(other.property, property) ||
                other.property == property));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        estateId,
        propertyId,
        generatedBy,
        otpCode,
        barcodeData,
        qrCodeData,
        visitorName,
        purpose,
        validFrom,
        validUntil,
        validityHours,
        status,
        requiresSecurityValidation,
        securityClearanceLevel,
        usedAt,
        usedBy,
        const DeepCollectionEquality().hash(_metadata),
        createdAt,
        updatedAt,
        timeRemaining,
        isActive,
        countdownDisplay,
        securityStatus,
        destinationInfo,
        estate,
        property
      ]);

  /// Create a copy of Otp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpImplCopyWith<_$OtpImpl> get copyWith =>
      __$$OtpImplCopyWithImpl<_$OtpImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpImplToJson(
      this,
    );
  }
}

abstract class _Otp implements Otp {
  const factory _Otp(
      {final int id,
      @JsonKey(name: 'estate_id', fromJson: NullSafetyHelper.safeInt)
      final int estateId,
      @JsonKey(name: 'property_id', fromJson: NullSafetyHelper.safeInt)
      final int propertyId,
      @JsonKey(name: 'generated_by', fromJson: NullSafetyHelper.safeInt)
      final int generatedBy,
      @JsonKey(name: 'otp_code', fromJson: NullSafetyHelper.safeString)
      final String otpCode,
      @JsonKey(name: 'barcode_data', fromJson: NullSafetyHelper.safeString)
      final String barcodeData,
      @JsonKey(name: 'qr_code_data', fromJson: NullSafetyHelper.safeString)
      final String qrCodeData,
      @JsonKey(name: 'visitor_name', fromJson: NullSafetyHelper.safeString)
      final String visitorName,
      @JsonKey(name: 'purpose', fromJson: NullSafetyHelper.safeString)
      final String purpose,
      @JsonKey(name: 'valid_from', fromJson: NullSafetyHelper.safeDateTime)
      required final DateTime validFrom,
      @JsonKey(name: 'valid_until', fromJson: NullSafetyHelper.safeDateTime)
      required final DateTime validUntil,
      @JsonKey(name: 'validity_hours', fromJson: NullSafetyHelper.safeInt)
      final int validityHours,
      @JsonKey(name: 'status', fromJson: NullSafetyHelper.safeString)
      final String status,
      @JsonKey(
          name: 'requires_security_validation',
          fromJson: NullSafetyHelper.safeBool)
      final bool requiresSecurityValidation,
      @JsonKey(
          name: 'security_clearance_level',
          fromJson: NullSafetyHelper.safeString)
      final String securityClearanceLevel,
      @JsonKey(name: 'used_at', fromJson: NullSafetyHelper.safeDateTime)
      final DateTime? usedAt,
      @JsonKey(name: 'used_by', fromJson: NullSafetyHelper.safeInt)
      final int? usedBy,
      @JsonKey(name: 'metadata', fromJson: NullSafetyHelper.safeMap)
      final Map<String, dynamic> metadata,
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'time_remaining', fromJson: NullSafetyHelper.safeDouble)
      final double timeRemaining,
      @JsonKey(name: 'is_active', fromJson: NullSafetyHelper.safeBool)
      final bool isActive,
      @JsonKey(name: 'countdown_display', fromJson: NullSafetyHelper.safeString)
      final String countdownDisplay,
      @JsonKey(name: 'security_status', fromJson: NullSafetyHelper.safeString)
      final String securityStatus,
      @JsonKey(name: 'destination_info') final DestinationInfo? destinationInfo,
      required final Estate estate,
      final Property? property}) = _$OtpImpl;

  factory _Otp.fromJson(Map<String, dynamic> json) = _$OtpImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'estate_id', fromJson: NullSafetyHelper.safeInt)
  int get estateId;
  @override
  @JsonKey(name: 'property_id', fromJson: NullSafetyHelper.safeInt)
  int get propertyId;
  @override
  @JsonKey(name: 'generated_by', fromJson: NullSafetyHelper.safeInt)
  int get generatedBy;
  @override
  @JsonKey(name: 'otp_code', fromJson: NullSafetyHelper.safeString)
  String get otpCode;
  @override
  @JsonKey(name: 'barcode_data', fromJson: NullSafetyHelper.safeString)
  String get barcodeData;
  @override
  @JsonKey(name: 'qr_code_data', fromJson: NullSafetyHelper.safeString)
  String get qrCodeData;
  @override
  @JsonKey(name: 'visitor_name', fromJson: NullSafetyHelper.safeString)
  String get visitorName;
  @override
  @JsonKey(name: 'purpose', fromJson: NullSafetyHelper.safeString)
  String get purpose;
  @override
  @JsonKey(name: 'valid_from', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get validFrom;
  @override
  @JsonKey(name: 'valid_until', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get validUntil;
  @override
  @JsonKey(name: 'validity_hours', fromJson: NullSafetyHelper.safeInt)
  int get validityHours;
  @override
  @JsonKey(name: 'status', fromJson: NullSafetyHelper.safeString)
  String get status;
  @override
  @JsonKey(
      name: 'requires_security_validation', fromJson: NullSafetyHelper.safeBool)
  bool get requiresSecurityValidation;
  @override
  @JsonKey(
      name: 'security_clearance_level', fromJson: NullSafetyHelper.safeString)
  String get securityClearanceLevel;
  @override
  @JsonKey(name: 'used_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime? get usedAt;
  @override
  @JsonKey(name: 'used_by', fromJson: NullSafetyHelper.safeInt)
  int? get usedBy;
  @override
  @JsonKey(name: 'metadata', fromJson: NullSafetyHelper.safeMap)
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'time_remaining', fromJson: NullSafetyHelper.safeDouble)
  double get timeRemaining;
  @override
  @JsonKey(name: 'is_active', fromJson: NullSafetyHelper.safeBool)
  bool get isActive;
  @override
  @JsonKey(name: 'countdown_display', fromJson: NullSafetyHelper.safeString)
  String get countdownDisplay;
  @override
  @JsonKey(name: 'security_status', fromJson: NullSafetyHelper.safeString)
  String get securityStatus;
  @override
  @JsonKey(name: 'destination_info')
  DestinationInfo? get destinationInfo;
  @override
  Estate get estate;
  @override
  Property? get property;

  /// Create a copy of Otp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpImplCopyWith<_$OtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
