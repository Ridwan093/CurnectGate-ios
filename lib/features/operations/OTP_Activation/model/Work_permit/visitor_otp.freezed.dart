// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visitor_otp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VisitorOtp _$VisitorOtpFromJson(Map<String, dynamic> json) {
  return _VisitorOtp.fromJson(json);
}

/// @nodoc
mixin _$VisitorOtp {
  int? get id => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;
  int? get propertyId => throw _privateConstructorUsedError;
  int? get generatedBy => throw _privateConstructorUsedError;
  String? get otpCode => throw _privateConstructorUsedError;
  String? get barcodeData => throw _privateConstructorUsedError;
  String? get qrCodeData => throw _privateConstructorUsedError;
  String? get visitorName => throw _privateConstructorUsedError;
  String? get purpose => throw _privateConstructorUsedError;
  int? get expectedGuest => throw _privateConstructorUsedError;
  String? get validFrom => throw _privateConstructorUsedError;
  String? get validUntil => throw _privateConstructorUsedError;
  int? get validityHours => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get requiresSecurityValidation => throw _privateConstructorUsedError;
  String? get securityClearanceLevel => throw _privateConstructorUsedError;
  dynamic get usedAt => throw _privateConstructorUsedError;
  dynamic get usedBy => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  int? get timeRemaining => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  String? get countdownDisplay => throw _privateConstructorUsedError;
  String? get securityStatus => throw _privateConstructorUsedError;
  DestinationInfo? get destinationInfo => throw _privateConstructorUsedError;
  dynamic get latestSecurityValidation => throw _privateConstructorUsedError;
  Property? get property => throw _privateConstructorUsedError;

  /// Serializes this VisitorOtp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VisitorOtp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitorOtpCopyWith<VisitorOtp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorOtpCopyWith<$Res> {
  factory $VisitorOtpCopyWith(
          VisitorOtp value, $Res Function(VisitorOtp) then) =
      _$VisitorOtpCopyWithImpl<$Res, VisitorOtp>;
  @useResult
  $Res call(
      {int? id,
      int? estateId,
      int? propertyId,
      int? generatedBy,
      String? otpCode,
      String? barcodeData,
      String? qrCodeData,
      String? visitorName,
      String? purpose,
      int? expectedGuest,
      String? validFrom,
      String? validUntil,
      int? validityHours,
      String? status,
      int? requiresSecurityValidation,
      String? securityClearanceLevel,
      dynamic usedAt,
      dynamic usedBy,
      Map<String, dynamic>? metadata,
      String? createdAt,
      String? updatedAt,
      int? timeRemaining,
      bool? isActive,
      String? countdownDisplay,
      String? securityStatus,
      DestinationInfo? destinationInfo,
      dynamic latestSecurityValidation,
      Property? property});

  $DestinationInfoCopyWith<$Res>? get destinationInfo;
  $PropertyCopyWith<$Res>? get property;
}

/// @nodoc
class _$VisitorOtpCopyWithImpl<$Res, $Val extends VisitorOtp>
    implements $VisitorOtpCopyWith<$Res> {
  _$VisitorOtpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitorOtp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? propertyId = freezed,
    Object? generatedBy = freezed,
    Object? otpCode = freezed,
    Object? barcodeData = freezed,
    Object? qrCodeData = freezed,
    Object? visitorName = freezed,
    Object? purpose = freezed,
    Object? expectedGuest = freezed,
    Object? validFrom = freezed,
    Object? validUntil = freezed,
    Object? validityHours = freezed,
    Object? status = freezed,
    Object? requiresSecurityValidation = freezed,
    Object? securityClearanceLevel = freezed,
    Object? usedAt = freezed,
    Object? usedBy = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? timeRemaining = freezed,
    Object? isActive = freezed,
    Object? countdownDisplay = freezed,
    Object? securityStatus = freezed,
    Object? destinationInfo = freezed,
    Object? latestSecurityValidation = freezed,
    Object? property = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyId: freezed == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as int?,
      generatedBy: freezed == generatedBy
          ? _value.generatedBy
          : generatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      otpCode: freezed == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
      barcodeData: freezed == barcodeData
          ? _value.barcodeData
          : barcodeData // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeData: freezed == qrCodeData
          ? _value.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorName: freezed == visitorName
          ? _value.visitorName
          : visitorName // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedGuest: freezed == expectedGuest
          ? _value.expectedGuest
          : expectedGuest // ignore: cast_nullable_to_non_nullable
              as int?,
      validFrom: freezed == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as String?,
      validityHours: freezed == validityHours
          ? _value.validityHours
          : validityHours // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresSecurityValidation: freezed == requiresSecurityValidation
          ? _value.requiresSecurityValidation
          : requiresSecurityValidation // ignore: cast_nullable_to_non_nullable
              as int?,
      securityClearanceLevel: freezed == securityClearanceLevel
          ? _value.securityClearanceLevel
          : securityClearanceLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      usedBy: freezed == usedBy
          ? _value.usedBy
          : usedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      timeRemaining: freezed == timeRemaining
          ? _value.timeRemaining
          : timeRemaining // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      countdownDisplay: freezed == countdownDisplay
          ? _value.countdownDisplay
          : countdownDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      securityStatus: freezed == securityStatus
          ? _value.securityStatus
          : securityStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationInfo: freezed == destinationInfo
          ? _value.destinationInfo
          : destinationInfo // ignore: cast_nullable_to_non_nullable
              as DestinationInfo?,
      latestSecurityValidation: freezed == latestSecurityValidation
          ? _value.latestSecurityValidation
          : latestSecurityValidation // ignore: cast_nullable_to_non_nullable
              as dynamic,
      property: freezed == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as Property?,
    ) as $Val);
  }

  /// Create a copy of VisitorOtp
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

  /// Create a copy of VisitorOtp
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
abstract class _$$VisitorOtpImplCopyWith<$Res>
    implements $VisitorOtpCopyWith<$Res> {
  factory _$$VisitorOtpImplCopyWith(
          _$VisitorOtpImpl value, $Res Function(_$VisitorOtpImpl) then) =
      __$$VisitorOtpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? estateId,
      int? propertyId,
      int? generatedBy,
      String? otpCode,
      String? barcodeData,
      String? qrCodeData,
      String? visitorName,
      String? purpose,
      int? expectedGuest,
      String? validFrom,
      String? validUntil,
      int? validityHours,
      String? status,
      int? requiresSecurityValidation,
      String? securityClearanceLevel,
      dynamic usedAt,
      dynamic usedBy,
      Map<String, dynamic>? metadata,
      String? createdAt,
      String? updatedAt,
      int? timeRemaining,
      bool? isActive,
      String? countdownDisplay,
      String? securityStatus,
      DestinationInfo? destinationInfo,
      dynamic latestSecurityValidation,
      Property? property});

  @override
  $DestinationInfoCopyWith<$Res>? get destinationInfo;
  @override
  $PropertyCopyWith<$Res>? get property;
}

/// @nodoc
class __$$VisitorOtpImplCopyWithImpl<$Res>
    extends _$VisitorOtpCopyWithImpl<$Res, _$VisitorOtpImpl>
    implements _$$VisitorOtpImplCopyWith<$Res> {
  __$$VisitorOtpImplCopyWithImpl(
      _$VisitorOtpImpl _value, $Res Function(_$VisitorOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of VisitorOtp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? propertyId = freezed,
    Object? generatedBy = freezed,
    Object? otpCode = freezed,
    Object? barcodeData = freezed,
    Object? qrCodeData = freezed,
    Object? visitorName = freezed,
    Object? purpose = freezed,
    Object? expectedGuest = freezed,
    Object? validFrom = freezed,
    Object? validUntil = freezed,
    Object? validityHours = freezed,
    Object? status = freezed,
    Object? requiresSecurityValidation = freezed,
    Object? securityClearanceLevel = freezed,
    Object? usedAt = freezed,
    Object? usedBy = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? timeRemaining = freezed,
    Object? isActive = freezed,
    Object? countdownDisplay = freezed,
    Object? securityStatus = freezed,
    Object? destinationInfo = freezed,
    Object? latestSecurityValidation = freezed,
    Object? property = freezed,
  }) {
    return _then(_$VisitorOtpImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyId: freezed == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as int?,
      generatedBy: freezed == generatedBy
          ? _value.generatedBy
          : generatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      otpCode: freezed == otpCode
          ? _value.otpCode
          : otpCode // ignore: cast_nullable_to_non_nullable
              as String?,
      barcodeData: freezed == barcodeData
          ? _value.barcodeData
          : barcodeData // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeData: freezed == qrCodeData
          ? _value.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorName: freezed == visitorName
          ? _value.visitorName
          : visitorName // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedGuest: freezed == expectedGuest
          ? _value.expectedGuest
          : expectedGuest // ignore: cast_nullable_to_non_nullable
              as int?,
      validFrom: freezed == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      validUntil: freezed == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as String?,
      validityHours: freezed == validityHours
          ? _value.validityHours
          : validityHours // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresSecurityValidation: freezed == requiresSecurityValidation
          ? _value.requiresSecurityValidation
          : requiresSecurityValidation // ignore: cast_nullable_to_non_nullable
              as int?,
      securityClearanceLevel: freezed == securityClearanceLevel
          ? _value.securityClearanceLevel
          : securityClearanceLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      usedBy: freezed == usedBy
          ? _value.usedBy
          : usedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      timeRemaining: freezed == timeRemaining
          ? _value.timeRemaining
          : timeRemaining // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      countdownDisplay: freezed == countdownDisplay
          ? _value.countdownDisplay
          : countdownDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      securityStatus: freezed == securityStatus
          ? _value.securityStatus
          : securityStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationInfo: freezed == destinationInfo
          ? _value.destinationInfo
          : destinationInfo // ignore: cast_nullable_to_non_nullable
              as DestinationInfo?,
      latestSecurityValidation: freezed == latestSecurityValidation
          ? _value.latestSecurityValidation
          : latestSecurityValidation // ignore: cast_nullable_to_non_nullable
              as dynamic,
      property: freezed == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as Property?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$VisitorOtpImpl implements _VisitorOtp {
  const _$VisitorOtpImpl(
      {this.id,
      this.estateId,
      this.propertyId,
      this.generatedBy,
      this.otpCode,
      this.barcodeData,
      this.qrCodeData,
      this.visitorName,
      this.purpose,
      this.expectedGuest,
      this.validFrom,
      this.validUntil,
      this.validityHours,
      this.status,
      this.requiresSecurityValidation,
      this.securityClearanceLevel,
      this.usedAt,
      this.usedBy,
      final Map<String, dynamic>? metadata,
      this.createdAt,
      this.updatedAt,
      this.timeRemaining,
      this.isActive,
      this.countdownDisplay,
      this.securityStatus,
      this.destinationInfo,
      this.latestSecurityValidation,
      this.property})
      : _metadata = metadata;

  factory _$VisitorOtpImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitorOtpImplFromJson(json);

  @override
  final int? id;
  @override
  final int? estateId;
  @override
  final int? propertyId;
  @override
  final int? generatedBy;
  @override
  final String? otpCode;
  @override
  final String? barcodeData;
  @override
  final String? qrCodeData;
  @override
  final String? visitorName;
  @override
  final String? purpose;
  @override
  final int? expectedGuest;
  @override
  final String? validFrom;
  @override
  final String? validUntil;
  @override
  final int? validityHours;
  @override
  final String? status;
  @override
  final int? requiresSecurityValidation;
  @override
  final String? securityClearanceLevel;
  @override
  final dynamic usedAt;
  @override
  final dynamic usedBy;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final int? timeRemaining;
  @override
  final bool? isActive;
  @override
  final String? countdownDisplay;
  @override
  final String? securityStatus;
  @override
  final DestinationInfo? destinationInfo;
  @override
  final dynamic latestSecurityValidation;
  @override
  final Property? property;

  @override
  String toString() {
    return 'VisitorOtp(id: $id, estateId: $estateId, propertyId: $propertyId, generatedBy: $generatedBy, otpCode: $otpCode, barcodeData: $barcodeData, qrCodeData: $qrCodeData, visitorName: $visitorName, purpose: $purpose, expectedGuest: $expectedGuest, validFrom: $validFrom, validUntil: $validUntil, validityHours: $validityHours, status: $status, requiresSecurityValidation: $requiresSecurityValidation, securityClearanceLevel: $securityClearanceLevel, usedAt: $usedAt, usedBy: $usedBy, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt, timeRemaining: $timeRemaining, isActive: $isActive, countdownDisplay: $countdownDisplay, securityStatus: $securityStatus, destinationInfo: $destinationInfo, latestSecurityValidation: $latestSecurityValidation, property: $property)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitorOtpImpl &&
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
            (identical(other.expectedGuest, expectedGuest) ||
                other.expectedGuest == expectedGuest) &&
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
            const DeepCollectionEquality().equals(other.usedAt, usedAt) &&
            const DeepCollectionEquality().equals(other.usedBy, usedBy) &&
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
            const DeepCollectionEquality().equals(
                other.latestSecurityValidation, latestSecurityValidation) &&
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
        expectedGuest,
        validFrom,
        validUntil,
        validityHours,
        status,
        requiresSecurityValidation,
        securityClearanceLevel,
        const DeepCollectionEquality().hash(usedAt),
        const DeepCollectionEquality().hash(usedBy),
        const DeepCollectionEquality().hash(_metadata),
        createdAt,
        updatedAt,
        timeRemaining,
        isActive,
        countdownDisplay,
        securityStatus,
        destinationInfo,
        const DeepCollectionEquality().hash(latestSecurityValidation),
        property
      ]);

  /// Create a copy of VisitorOtp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitorOtpImplCopyWith<_$VisitorOtpImpl> get copyWith =>
      __$$VisitorOtpImplCopyWithImpl<_$VisitorOtpImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitorOtpImplToJson(
      this,
    );
  }
}

abstract class _VisitorOtp implements VisitorOtp {
  const factory _VisitorOtp(
      {final int? id,
      final int? estateId,
      final int? propertyId,
      final int? generatedBy,
      final String? otpCode,
      final String? barcodeData,
      final String? qrCodeData,
      final String? visitorName,
      final String? purpose,
      final int? expectedGuest,
      final String? validFrom,
      final String? validUntil,
      final int? validityHours,
      final String? status,
      final int? requiresSecurityValidation,
      final String? securityClearanceLevel,
      final dynamic usedAt,
      final dynamic usedBy,
      final Map<String, dynamic>? metadata,
      final String? createdAt,
      final String? updatedAt,
      final int? timeRemaining,
      final bool? isActive,
      final String? countdownDisplay,
      final String? securityStatus,
      final DestinationInfo? destinationInfo,
      final dynamic latestSecurityValidation,
      final Property? property}) = _$VisitorOtpImpl;

  factory _VisitorOtp.fromJson(Map<String, dynamic> json) =
      _$VisitorOtpImpl.fromJson;

  @override
  int? get id;
  @override
  int? get estateId;
  @override
  int? get propertyId;
  @override
  int? get generatedBy;
  @override
  String? get otpCode;
  @override
  String? get barcodeData;
  @override
  String? get qrCodeData;
  @override
  String? get visitorName;
  @override
  String? get purpose;
  @override
  int? get expectedGuest;
  @override
  String? get validFrom;
  @override
  String? get validUntil;
  @override
  int? get validityHours;
  @override
  String? get status;
  @override
  int? get requiresSecurityValidation;
  @override
  String? get securityClearanceLevel;
  @override
  dynamic get usedAt;
  @override
  dynamic get usedBy;
  @override
  Map<String, dynamic>? get metadata;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  int? get timeRemaining;
  @override
  bool? get isActive;
  @override
  String? get countdownDisplay;
  @override
  String? get securityStatus;
  @override
  DestinationInfo? get destinationInfo;
  @override
  dynamic get latestSecurityValidation;
  @override
  Property? get property;

  /// Create a copy of VisitorOtp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitorOtpImplCopyWith<_$VisitorOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
