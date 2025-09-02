// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visitor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VisitorModel _$VisitorModelFromJson(Map<String, dynamic> json) {
  return _VisitorModel.fromJson(json);
}

/// @nodoc
mixin _$VisitorModel {
  int? get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;
  int? get propertyId => throw _privateConstructorUsedError;
  int? get visitorOtpId => throw _privateConstructorUsedError;
  UserModel? get loggedBy => throw _privateConstructorUsedError;
  UserModel? get checkedOutBy => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get numberOfGuest => throw _privateConstructorUsedError;
  String? get vehicleNumber => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get expectedArrival => throw _privateConstructorUsedError;
  int? get expectedDurationMinutes => throw _privateConstructorUsedError;
  String? get purpose => throw _privateConstructorUsedError;
  String? get destinationAddress => throw _privateConstructorUsedError;
  String? get securityInstructions => throw _privateConstructorUsedError;
  bool? get escortRequired => throw _privateConstructorUsedError;
  String? get expectedTime => throw _privateConstructorUsedError;
  String? get checkin => throw _privateConstructorUsedError;
  String? get checkout => throw _privateConstructorUsedError;
  String? get checkoutNotes => throw _privateConstructorUsedError;
  String? get checkoutMethod => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  int? get visitDuration => throw _privateConstructorUsedError;
  String? get visitDurationFormatted => throw _privateConstructorUsedError;
  bool? get isCurrentlyVisiting => throw _privateConstructorUsedError;
  String? get checkoutStatus => throw _privateConstructorUsedError;
  VisitorOtpModel? get visitorOtp => throw _privateConstructorUsedError;
  PropertyModel? get property => throw _privateConstructorUsedError;

  /// Serializes this VisitorModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VisitorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitorModelCopyWith<VisitorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorModelCopyWith<$Res> {
  factory $VisitorModelCopyWith(
          VisitorModel value, $Res Function(VisitorModel) then) =
      _$VisitorModelCopyWithImpl<$Res, VisitorModel>;
  @useResult
  $Res call(
      {int? id,
      int? userId,
      int? estateId,
      int? propertyId,
      int? visitorOtpId,
      UserModel? loggedBy,
      UserModel? checkedOutBy,
      String? name,
      String? code,
      String? numberOfGuest,
      String? vehicleNumber,
      String? phoneNumber,
      String? expectedArrival,
      int? expectedDurationMinutes,
      String? purpose,
      String? destinationAddress,
      String? securityInstructions,
      bool? escortRequired,
      String? expectedTime,
      String? checkin,
      String? checkout,
      String? checkoutNotes,
      String? checkoutMethod,
      String? status,
      String? createdAt,
      String? updatedAt,
      int? visitDuration,
      String? visitDurationFormatted,
      bool? isCurrentlyVisiting,
      String? checkoutStatus,
      VisitorOtpModel? visitorOtp,
      PropertyModel? property});

  $UserModelCopyWith<$Res>? get loggedBy;
  $UserModelCopyWith<$Res>? get checkedOutBy;
  $VisitorOtpModelCopyWith<$Res>? get visitorOtp;
  $PropertyModelCopyWith<$Res>? get property;
}

/// @nodoc
class _$VisitorModelCopyWithImpl<$Res, $Val extends VisitorModel>
    implements $VisitorModelCopyWith<$Res> {
  _$VisitorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? estateId = freezed,
    Object? propertyId = freezed,
    Object? visitorOtpId = freezed,
    Object? loggedBy = freezed,
    Object? checkedOutBy = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? numberOfGuest = freezed,
    Object? vehicleNumber = freezed,
    Object? phoneNumber = freezed,
    Object? expectedArrival = freezed,
    Object? expectedDurationMinutes = freezed,
    Object? purpose = freezed,
    Object? destinationAddress = freezed,
    Object? securityInstructions = freezed,
    Object? escortRequired = freezed,
    Object? expectedTime = freezed,
    Object? checkin = freezed,
    Object? checkout = freezed,
    Object? checkoutNotes = freezed,
    Object? checkoutMethod = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? visitDuration = freezed,
    Object? visitDurationFormatted = freezed,
    Object? isCurrentlyVisiting = freezed,
    Object? checkoutStatus = freezed,
    Object? visitorOtp = freezed,
    Object? property = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyId: freezed == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as int?,
      visitorOtpId: freezed == visitorOtpId
          ? _value.visitorOtpId
          : visitorOtpId // ignore: cast_nullable_to_non_nullable
              as int?,
      loggedBy: freezed == loggedBy
          ? _value.loggedBy
          : loggedBy // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      checkedOutBy: freezed == checkedOutBy
          ? _value.checkedOutBy
          : checkedOutBy // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfGuest: freezed == numberOfGuest
          ? _value.numberOfGuest
          : numberOfGuest // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleNumber: freezed == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedArrival: freezed == expectedArrival
          ? _value.expectedArrival
          : expectedArrival // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedDurationMinutes: freezed == expectedDurationMinutes
          ? _value.expectedDurationMinutes
          : expectedDurationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationAddress: freezed == destinationAddress
          ? _value.destinationAddress
          : destinationAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      securityInstructions: freezed == securityInstructions
          ? _value.securityInstructions
          : securityInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      escortRequired: freezed == escortRequired
          ? _value.escortRequired
          : escortRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      expectedTime: freezed == expectedTime
          ? _value.expectedTime
          : expectedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      checkin: freezed == checkin
          ? _value.checkin
          : checkin // ignore: cast_nullable_to_non_nullable
              as String?,
      checkout: freezed == checkout
          ? _value.checkout
          : checkout // ignore: cast_nullable_to_non_nullable
              as String?,
      checkoutNotes: freezed == checkoutNotes
          ? _value.checkoutNotes
          : checkoutNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      checkoutMethod: freezed == checkoutMethod
          ? _value.checkoutMethod
          : checkoutMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      visitDuration: freezed == visitDuration
          ? _value.visitDuration
          : visitDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      visitDurationFormatted: freezed == visitDurationFormatted
          ? _value.visitDurationFormatted
          : visitDurationFormatted // ignore: cast_nullable_to_non_nullable
              as String?,
      isCurrentlyVisiting: freezed == isCurrentlyVisiting
          ? _value.isCurrentlyVisiting
          : isCurrentlyVisiting // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkoutStatus: freezed == checkoutStatus
          ? _value.checkoutStatus
          : checkoutStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorOtp: freezed == visitorOtp
          ? _value.visitorOtp
          : visitorOtp // ignore: cast_nullable_to_non_nullable
              as VisitorOtpModel?,
      property: freezed == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as PropertyModel?,
    ) as $Val);
  }

  /// Create a copy of VisitorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get loggedBy {
    if (_value.loggedBy == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.loggedBy!, (value) {
      return _then(_value.copyWith(loggedBy: value) as $Val);
    });
  }

  /// Create a copy of VisitorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get checkedOutBy {
    if (_value.checkedOutBy == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.checkedOutBy!, (value) {
      return _then(_value.copyWith(checkedOutBy: value) as $Val);
    });
  }

  /// Create a copy of VisitorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VisitorOtpModelCopyWith<$Res>? get visitorOtp {
    if (_value.visitorOtp == null) {
      return null;
    }

    return $VisitorOtpModelCopyWith<$Res>(_value.visitorOtp!, (value) {
      return _then(_value.copyWith(visitorOtp: value) as $Val);
    });
  }

  /// Create a copy of VisitorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertyModelCopyWith<$Res>? get property {
    if (_value.property == null) {
      return null;
    }

    return $PropertyModelCopyWith<$Res>(_value.property!, (value) {
      return _then(_value.copyWith(property: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VisitorModelImplCopyWith<$Res>
    implements $VisitorModelCopyWith<$Res> {
  factory _$$VisitorModelImplCopyWith(
          _$VisitorModelImpl value, $Res Function(_$VisitorModelImpl) then) =
      __$$VisitorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? userId,
      int? estateId,
      int? propertyId,
      int? visitorOtpId,
      UserModel? loggedBy,
      UserModel? checkedOutBy,
      String? name,
      String? code,
      String? numberOfGuest,
      String? vehicleNumber,
      String? phoneNumber,
      String? expectedArrival,
      int? expectedDurationMinutes,
      String? purpose,
      String? destinationAddress,
      String? securityInstructions,
      bool? escortRequired,
      String? expectedTime,
      String? checkin,
      String? checkout,
      String? checkoutNotes,
      String? checkoutMethod,
      String? status,
      String? createdAt,
      String? updatedAt,
      int? visitDuration,
      String? visitDurationFormatted,
      bool? isCurrentlyVisiting,
      String? checkoutStatus,
      VisitorOtpModel? visitorOtp,
      PropertyModel? property});

  @override
  $UserModelCopyWith<$Res>? get loggedBy;
  @override
  $UserModelCopyWith<$Res>? get checkedOutBy;
  @override
  $VisitorOtpModelCopyWith<$Res>? get visitorOtp;
  @override
  $PropertyModelCopyWith<$Res>? get property;
}

/// @nodoc
class __$$VisitorModelImplCopyWithImpl<$Res>
    extends _$VisitorModelCopyWithImpl<$Res, _$VisitorModelImpl>
    implements _$$VisitorModelImplCopyWith<$Res> {
  __$$VisitorModelImplCopyWithImpl(
      _$VisitorModelImpl _value, $Res Function(_$VisitorModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VisitorModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? estateId = freezed,
    Object? propertyId = freezed,
    Object? visitorOtpId = freezed,
    Object? loggedBy = freezed,
    Object? checkedOutBy = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? numberOfGuest = freezed,
    Object? vehicleNumber = freezed,
    Object? phoneNumber = freezed,
    Object? expectedArrival = freezed,
    Object? expectedDurationMinutes = freezed,
    Object? purpose = freezed,
    Object? destinationAddress = freezed,
    Object? securityInstructions = freezed,
    Object? escortRequired = freezed,
    Object? expectedTime = freezed,
    Object? checkin = freezed,
    Object? checkout = freezed,
    Object? checkoutNotes = freezed,
    Object? checkoutMethod = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? visitDuration = freezed,
    Object? visitDurationFormatted = freezed,
    Object? isCurrentlyVisiting = freezed,
    Object? checkoutStatus = freezed,
    Object? visitorOtp = freezed,
    Object? property = freezed,
  }) {
    return _then(_$VisitorModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyId: freezed == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as int?,
      visitorOtpId: freezed == visitorOtpId
          ? _value.visitorOtpId
          : visitorOtpId // ignore: cast_nullable_to_non_nullable
              as int?,
      loggedBy: freezed == loggedBy
          ? _value.loggedBy
          : loggedBy // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      checkedOutBy: freezed == checkedOutBy
          ? _value.checkedOutBy
          : checkedOutBy // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfGuest: freezed == numberOfGuest
          ? _value.numberOfGuest
          : numberOfGuest // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleNumber: freezed == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedArrival: freezed == expectedArrival
          ? _value.expectedArrival
          : expectedArrival // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedDurationMinutes: freezed == expectedDurationMinutes
          ? _value.expectedDurationMinutes
          : expectedDurationMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      purpose: freezed == purpose
          ? _value.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationAddress: freezed == destinationAddress
          ? _value.destinationAddress
          : destinationAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      securityInstructions: freezed == securityInstructions
          ? _value.securityInstructions
          : securityInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      escortRequired: freezed == escortRequired
          ? _value.escortRequired
          : escortRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      expectedTime: freezed == expectedTime
          ? _value.expectedTime
          : expectedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      checkin: freezed == checkin
          ? _value.checkin
          : checkin // ignore: cast_nullable_to_non_nullable
              as String?,
      checkout: freezed == checkout
          ? _value.checkout
          : checkout // ignore: cast_nullable_to_non_nullable
              as String?,
      checkoutNotes: freezed == checkoutNotes
          ? _value.checkoutNotes
          : checkoutNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      checkoutMethod: freezed == checkoutMethod
          ? _value.checkoutMethod
          : checkoutMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      visitDuration: freezed == visitDuration
          ? _value.visitDuration
          : visitDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      visitDurationFormatted: freezed == visitDurationFormatted
          ? _value.visitDurationFormatted
          : visitDurationFormatted // ignore: cast_nullable_to_non_nullable
              as String?,
      isCurrentlyVisiting: freezed == isCurrentlyVisiting
          ? _value.isCurrentlyVisiting
          : isCurrentlyVisiting // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkoutStatus: freezed == checkoutStatus
          ? _value.checkoutStatus
          : checkoutStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorOtp: freezed == visitorOtp
          ? _value.visitorOtp
          : visitorOtp // ignore: cast_nullable_to_non_nullable
              as VisitorOtpModel?,
      property: freezed == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as PropertyModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$VisitorModelImpl implements _VisitorModel {
  const _$VisitorModelImpl(
      {this.id,
      this.userId,
      this.estateId,
      this.propertyId,
      this.visitorOtpId,
      this.loggedBy,
      this.checkedOutBy,
      this.name,
      this.code,
      this.numberOfGuest,
      this.vehicleNumber,
      this.phoneNumber,
      this.expectedArrival,
      this.expectedDurationMinutes,
      this.purpose,
      this.destinationAddress,
      this.securityInstructions,
      this.escortRequired,
      this.expectedTime,
      this.checkin,
      this.checkout,
      this.checkoutNotes,
      this.checkoutMethod,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.visitDuration,
      this.visitDurationFormatted,
      this.isCurrentlyVisiting,
      this.checkoutStatus,
      this.visitorOtp,
      this.property});

  factory _$VisitorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitorModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? userId;
  @override
  final int? estateId;
  @override
  final int? propertyId;
  @override
  final int? visitorOtpId;
  @override
  final UserModel? loggedBy;
  @override
  final UserModel? checkedOutBy;
  @override
  final String? name;
  @override
  final String? code;
  @override
  final String? numberOfGuest;
  @override
  final String? vehicleNumber;
  @override
  final String? phoneNumber;
  @override
  final String? expectedArrival;
  @override
  final int? expectedDurationMinutes;
  @override
  final String? purpose;
  @override
  final String? destinationAddress;
  @override
  final String? securityInstructions;
  @override
  final bool? escortRequired;
  @override
  final String? expectedTime;
  @override
  final String? checkin;
  @override
  final String? checkout;
  @override
  final String? checkoutNotes;
  @override
  final String? checkoutMethod;
  @override
  final String? status;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final int? visitDuration;
  @override
  final String? visitDurationFormatted;
  @override
  final bool? isCurrentlyVisiting;
  @override
  final String? checkoutStatus;
  @override
  final VisitorOtpModel? visitorOtp;
  @override
  final PropertyModel? property;

  @override
  String toString() {
    return 'VisitorModel(id: $id, userId: $userId, estateId: $estateId, propertyId: $propertyId, visitorOtpId: $visitorOtpId, loggedBy: $loggedBy, checkedOutBy: $checkedOutBy, name: $name, code: $code, numberOfGuest: $numberOfGuest, vehicleNumber: $vehicleNumber, phoneNumber: $phoneNumber, expectedArrival: $expectedArrival, expectedDurationMinutes: $expectedDurationMinutes, purpose: $purpose, destinationAddress: $destinationAddress, securityInstructions: $securityInstructions, escortRequired: $escortRequired, expectedTime: $expectedTime, checkin: $checkin, checkout: $checkout, checkoutNotes: $checkoutNotes, checkoutMethod: $checkoutMethod, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, visitDuration: $visitDuration, visitDurationFormatted: $visitDurationFormatted, isCurrentlyVisiting: $isCurrentlyVisiting, checkoutStatus: $checkoutStatus, visitorOtp: $visitorOtp, property: $property)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.visitorOtpId, visitorOtpId) ||
                other.visitorOtpId == visitorOtpId) &&
            (identical(other.loggedBy, loggedBy) ||
                other.loggedBy == loggedBy) &&
            (identical(other.checkedOutBy, checkedOutBy) ||
                other.checkedOutBy == checkedOutBy) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.numberOfGuest, numberOfGuest) ||
                other.numberOfGuest == numberOfGuest) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.expectedArrival, expectedArrival) ||
                other.expectedArrival == expectedArrival) &&
            (identical(
                    other.expectedDurationMinutes, expectedDurationMinutes) ||
                other.expectedDurationMinutes == expectedDurationMinutes) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.destinationAddress, destinationAddress) ||
                other.destinationAddress == destinationAddress) &&
            (identical(other.securityInstructions, securityInstructions) ||
                other.securityInstructions == securityInstructions) &&
            (identical(other.escortRequired, escortRequired) ||
                other.escortRequired == escortRequired) &&
            (identical(other.expectedTime, expectedTime) ||
                other.expectedTime == expectedTime) &&
            (identical(other.checkin, checkin) || other.checkin == checkin) &&
            (identical(other.checkout, checkout) ||
                other.checkout == checkout) &&
            (identical(other.checkoutNotes, checkoutNotes) ||
                other.checkoutNotes == checkoutNotes) &&
            (identical(other.checkoutMethod, checkoutMethod) ||
                other.checkoutMethod == checkoutMethod) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.visitDuration, visitDuration) ||
                other.visitDuration == visitDuration) &&
            (identical(other.visitDurationFormatted, visitDurationFormatted) ||
                other.visitDurationFormatted == visitDurationFormatted) &&
            (identical(other.isCurrentlyVisiting, isCurrentlyVisiting) ||
                other.isCurrentlyVisiting == isCurrentlyVisiting) &&
            (identical(other.checkoutStatus, checkoutStatus) ||
                other.checkoutStatus == checkoutStatus) &&
            (identical(other.visitorOtp, visitorOtp) ||
                other.visitorOtp == visitorOtp) &&
            (identical(other.property, property) ||
                other.property == property));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        estateId,
        propertyId,
        visitorOtpId,
        loggedBy,
        checkedOutBy,
        name,
        code,
        numberOfGuest,
        vehicleNumber,
        phoneNumber,
        expectedArrival,
        expectedDurationMinutes,
        purpose,
        destinationAddress,
        securityInstructions,
        escortRequired,
        expectedTime,
        checkin,
        checkout,
        checkoutNotes,
        checkoutMethod,
        status,
        createdAt,
        updatedAt,
        visitDuration,
        visitDurationFormatted,
        isCurrentlyVisiting,
        checkoutStatus,
        visitorOtp,
        property
      ]);

  /// Create a copy of VisitorModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitorModelImplCopyWith<_$VisitorModelImpl> get copyWith =>
      __$$VisitorModelImplCopyWithImpl<_$VisitorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitorModelImplToJson(
      this,
    );
  }
}

abstract class _VisitorModel implements VisitorModel {
  const factory _VisitorModel(
      {final int? id,
      final int? userId,
      final int? estateId,
      final int? propertyId,
      final int? visitorOtpId,
      final UserModel? loggedBy,
      final UserModel? checkedOutBy,
      final String? name,
      final String? code,
      final String? numberOfGuest,
      final String? vehicleNumber,
      final String? phoneNumber,
      final String? expectedArrival,
      final int? expectedDurationMinutes,
      final String? purpose,
      final String? destinationAddress,
      final String? securityInstructions,
      final bool? escortRequired,
      final String? expectedTime,
      final String? checkin,
      final String? checkout,
      final String? checkoutNotes,
      final String? checkoutMethod,
      final String? status,
      final String? createdAt,
      final String? updatedAt,
      final int? visitDuration,
      final String? visitDurationFormatted,
      final bool? isCurrentlyVisiting,
      final String? checkoutStatus,
      final VisitorOtpModel? visitorOtp,
      final PropertyModel? property}) = _$VisitorModelImpl;

  factory _VisitorModel.fromJson(Map<String, dynamic> json) =
      _$VisitorModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get userId;
  @override
  int? get estateId;
  @override
  int? get propertyId;
  @override
  int? get visitorOtpId;
  @override
  UserModel? get loggedBy;
  @override
  UserModel? get checkedOutBy;
  @override
  String? get name;
  @override
  String? get code;
  @override
  String? get numberOfGuest;
  @override
  String? get vehicleNumber;
  @override
  String? get phoneNumber;
  @override
  String? get expectedArrival;
  @override
  int? get expectedDurationMinutes;
  @override
  String? get purpose;
  @override
  String? get destinationAddress;
  @override
  String? get securityInstructions;
  @override
  bool? get escortRequired;
  @override
  String? get expectedTime;
  @override
  String? get checkin;
  @override
  String? get checkout;
  @override
  String? get checkoutNotes;
  @override
  String? get checkoutMethod;
  @override
  String? get status;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  int? get visitDuration;
  @override
  String? get visitDurationFormatted;
  @override
  bool? get isCurrentlyVisiting;
  @override
  String? get checkoutStatus;
  @override
  VisitorOtpModel? get visitorOtp;
  @override
  PropertyModel? get property;

  /// Create a copy of VisitorModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitorModelImplCopyWith<_$VisitorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
