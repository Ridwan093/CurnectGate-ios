// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_validation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SecurityValidationModel _$SecurityValidationModelFromJson(
    Map<String, dynamic> json) {
  return _SecurityValidationModel.fromJson(json);
}

/// @nodoc
mixin _$SecurityValidationModel {
  int? get id => throw _privateConstructorUsedError;
  int? get visitorOtpId => throw _privateConstructorUsedError;
  int? get securityPersonnelId => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;
  String? get validationMethod => throw _privateConstructorUsedError;
  String? get validationStatus => throw _privateConstructorUsedError;
  String? get otpStatusAtValidation => throw _privateConstructorUsedError;
  String? get validatedAt => throw _privateConstructorUsedError;
  String? get denialReason => throw _privateConstructorUsedError;
  String? get securityNotes => throw _privateConstructorUsedError;
  List<dynamic>? get validationMetadata => throw _privateConstructorUsedError;
  String? get gateAction => throw _privateConstructorUsedError;
  String? get gateEntryTime => throw _privateConstructorUsedError;
  bool? get requiresEscort => throw _privateConstructorUsedError;
  String? get escortToAddress => throw _privateConstructorUsedError;
  String? get securityInstructions => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get statusBadge => throw _privateConstructorUsedError;
  String? get timeSinceValidation => throw _privateConstructorUsedError;
  Map<String, dynamic>? get validationSummary =>
      throw _privateConstructorUsedError;
  UserModel? get securityPersonnel => throw _privateConstructorUsedError;

  /// Serializes this SecurityValidationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SecurityValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SecurityValidationModelCopyWith<SecurityValidationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityValidationModelCopyWith<$Res> {
  factory $SecurityValidationModelCopyWith(SecurityValidationModel value,
          $Res Function(SecurityValidationModel) then) =
      _$SecurityValidationModelCopyWithImpl<$Res, SecurityValidationModel>;
  @useResult
  $Res call(
      {int? id,
      int? visitorOtpId,
      int? securityPersonnelId,
      int? estateId,
      String? validationMethod,
      String? validationStatus,
      String? otpStatusAtValidation,
      String? validatedAt,
      String? denialReason,
      String? securityNotes,
      List<dynamic>? validationMetadata,
      String? gateAction,
      String? gateEntryTime,
      bool? requiresEscort,
      String? escortToAddress,
      String? securityInstructions,
      String? createdAt,
      String? updatedAt,
      Map<String, dynamic>? statusBadge,
      String? timeSinceValidation,
      Map<String, dynamic>? validationSummary,
      UserModel? securityPersonnel});

  $UserModelCopyWith<$Res>? get securityPersonnel;
}

/// @nodoc
class _$SecurityValidationModelCopyWithImpl<$Res,
        $Val extends SecurityValidationModel>
    implements $SecurityValidationModelCopyWith<$Res> {
  _$SecurityValidationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SecurityValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? visitorOtpId = freezed,
    Object? securityPersonnelId = freezed,
    Object? estateId = freezed,
    Object? validationMethod = freezed,
    Object? validationStatus = freezed,
    Object? otpStatusAtValidation = freezed,
    Object? validatedAt = freezed,
    Object? denialReason = freezed,
    Object? securityNotes = freezed,
    Object? validationMetadata = freezed,
    Object? gateAction = freezed,
    Object? gateEntryTime = freezed,
    Object? requiresEscort = freezed,
    Object? escortToAddress = freezed,
    Object? securityInstructions = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? statusBadge = freezed,
    Object? timeSinceValidation = freezed,
    Object? validationSummary = freezed,
    Object? securityPersonnel = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      visitorOtpId: freezed == visitorOtpId
          ? _value.visitorOtpId
          : visitorOtpId // ignore: cast_nullable_to_non_nullable
              as int?,
      securityPersonnelId: freezed == securityPersonnelId
          ? _value.securityPersonnelId
          : securityPersonnelId // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      validationMethod: freezed == validationMethod
          ? _value.validationMethod
          : validationMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      validationStatus: freezed == validationStatus
          ? _value.validationStatus
          : validationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      otpStatusAtValidation: freezed == otpStatusAtValidation
          ? _value.otpStatusAtValidation
          : otpStatusAtValidation // ignore: cast_nullable_to_non_nullable
              as String?,
      validatedAt: freezed == validatedAt
          ? _value.validatedAt
          : validatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      denialReason: freezed == denialReason
          ? _value.denialReason
          : denialReason // ignore: cast_nullable_to_non_nullable
              as String?,
      securityNotes: freezed == securityNotes
          ? _value.securityNotes
          : securityNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      validationMetadata: freezed == validationMetadata
          ? _value.validationMetadata
          : validationMetadata // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      gateAction: freezed == gateAction
          ? _value.gateAction
          : gateAction // ignore: cast_nullable_to_non_nullable
              as String?,
      gateEntryTime: freezed == gateEntryTime
          ? _value.gateEntryTime
          : gateEntryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresEscort: freezed == requiresEscort
          ? _value.requiresEscort
          : requiresEscort // ignore: cast_nullable_to_non_nullable
              as bool?,
      escortToAddress: freezed == escortToAddress
          ? _value.escortToAddress
          : escortToAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      securityInstructions: freezed == securityInstructions
          ? _value.securityInstructions
          : securityInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      statusBadge: freezed == statusBadge
          ? _value.statusBadge
          : statusBadge // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      timeSinceValidation: freezed == timeSinceValidation
          ? _value.timeSinceValidation
          : timeSinceValidation // ignore: cast_nullable_to_non_nullable
              as String?,
      validationSummary: freezed == validationSummary
          ? _value.validationSummary
          : validationSummary // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      securityPersonnel: freezed == securityPersonnel
          ? _value.securityPersonnel
          : securityPersonnel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  /// Create a copy of SecurityValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get securityPersonnel {
    if (_value.securityPersonnel == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.securityPersonnel!, (value) {
      return _then(_value.copyWith(securityPersonnel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SecurityValidationModelImplCopyWith<$Res>
    implements $SecurityValidationModelCopyWith<$Res> {
  factory _$$SecurityValidationModelImplCopyWith(
          _$SecurityValidationModelImpl value,
          $Res Function(_$SecurityValidationModelImpl) then) =
      __$$SecurityValidationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? visitorOtpId,
      int? securityPersonnelId,
      int? estateId,
      String? validationMethod,
      String? validationStatus,
      String? otpStatusAtValidation,
      String? validatedAt,
      String? denialReason,
      String? securityNotes,
      List<dynamic>? validationMetadata,
      String? gateAction,
      String? gateEntryTime,
      bool? requiresEscort,
      String? escortToAddress,
      String? securityInstructions,
      String? createdAt,
      String? updatedAt,
      Map<String, dynamic>? statusBadge,
      String? timeSinceValidation,
      Map<String, dynamic>? validationSummary,
      UserModel? securityPersonnel});

  @override
  $UserModelCopyWith<$Res>? get securityPersonnel;
}

/// @nodoc
class __$$SecurityValidationModelImplCopyWithImpl<$Res>
    extends _$SecurityValidationModelCopyWithImpl<$Res,
        _$SecurityValidationModelImpl>
    implements _$$SecurityValidationModelImplCopyWith<$Res> {
  __$$SecurityValidationModelImplCopyWithImpl(
      _$SecurityValidationModelImpl _value,
      $Res Function(_$SecurityValidationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SecurityValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? visitorOtpId = freezed,
    Object? securityPersonnelId = freezed,
    Object? estateId = freezed,
    Object? validationMethod = freezed,
    Object? validationStatus = freezed,
    Object? otpStatusAtValidation = freezed,
    Object? validatedAt = freezed,
    Object? denialReason = freezed,
    Object? securityNotes = freezed,
    Object? validationMetadata = freezed,
    Object? gateAction = freezed,
    Object? gateEntryTime = freezed,
    Object? requiresEscort = freezed,
    Object? escortToAddress = freezed,
    Object? securityInstructions = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? statusBadge = freezed,
    Object? timeSinceValidation = freezed,
    Object? validationSummary = freezed,
    Object? securityPersonnel = freezed,
  }) {
    return _then(_$SecurityValidationModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      visitorOtpId: freezed == visitorOtpId
          ? _value.visitorOtpId
          : visitorOtpId // ignore: cast_nullable_to_non_nullable
              as int?,
      securityPersonnelId: freezed == securityPersonnelId
          ? _value.securityPersonnelId
          : securityPersonnelId // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      validationMethod: freezed == validationMethod
          ? _value.validationMethod
          : validationMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      validationStatus: freezed == validationStatus
          ? _value.validationStatus
          : validationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      otpStatusAtValidation: freezed == otpStatusAtValidation
          ? _value.otpStatusAtValidation
          : otpStatusAtValidation // ignore: cast_nullable_to_non_nullable
              as String?,
      validatedAt: freezed == validatedAt
          ? _value.validatedAt
          : validatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      denialReason: freezed == denialReason
          ? _value.denialReason
          : denialReason // ignore: cast_nullable_to_non_nullable
              as String?,
      securityNotes: freezed == securityNotes
          ? _value.securityNotes
          : securityNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      validationMetadata: freezed == validationMetadata
          ? _value._validationMetadata
          : validationMetadata // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      gateAction: freezed == gateAction
          ? _value.gateAction
          : gateAction // ignore: cast_nullable_to_non_nullable
              as String?,
      gateEntryTime: freezed == gateEntryTime
          ? _value.gateEntryTime
          : gateEntryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresEscort: freezed == requiresEscort
          ? _value.requiresEscort
          : requiresEscort // ignore: cast_nullable_to_non_nullable
              as bool?,
      escortToAddress: freezed == escortToAddress
          ? _value.escortToAddress
          : escortToAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      securityInstructions: freezed == securityInstructions
          ? _value.securityInstructions
          : securityInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      statusBadge: freezed == statusBadge
          ? _value._statusBadge
          : statusBadge // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      timeSinceValidation: freezed == timeSinceValidation
          ? _value.timeSinceValidation
          : timeSinceValidation // ignore: cast_nullable_to_non_nullable
              as String?,
      validationSummary: freezed == validationSummary
          ? _value._validationSummary
          : validationSummary // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      securityPersonnel: freezed == securityPersonnel
          ? _value.securityPersonnel
          : securityPersonnel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$SecurityValidationModelImpl implements _SecurityValidationModel {
  const _$SecurityValidationModelImpl(
      {this.id,
      this.visitorOtpId,
      this.securityPersonnelId,
      this.estateId,
      this.validationMethod,
      this.validationStatus,
      this.otpStatusAtValidation,
      this.validatedAt,
      this.denialReason,
      this.securityNotes,
      final List<dynamic>? validationMetadata,
      this.gateAction,
      this.gateEntryTime,
      this.requiresEscort,
      this.escortToAddress,
      this.securityInstructions,
      this.createdAt,
      this.updatedAt,
      final Map<String, dynamic>? statusBadge,
      this.timeSinceValidation,
      final Map<String, dynamic>? validationSummary,
      this.securityPersonnel})
      : _validationMetadata = validationMetadata,
        _statusBadge = statusBadge,
        _validationSummary = validationSummary;

  factory _$SecurityValidationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SecurityValidationModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? visitorOtpId;
  @override
  final int? securityPersonnelId;
  @override
  final int? estateId;
  @override
  final String? validationMethod;
  @override
  final String? validationStatus;
  @override
  final String? otpStatusAtValidation;
  @override
  final String? validatedAt;
  @override
  final String? denialReason;
  @override
  final String? securityNotes;
  final List<dynamic>? _validationMetadata;
  @override
  List<dynamic>? get validationMetadata {
    final value = _validationMetadata;
    if (value == null) return null;
    if (_validationMetadata is EqualUnmodifiableListView)
      return _validationMetadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? gateAction;
  @override
  final String? gateEntryTime;
  @override
  final bool? requiresEscort;
  @override
  final String? escortToAddress;
  @override
  final String? securityInstructions;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  final Map<String, dynamic>? _statusBadge;
  @override
  Map<String, dynamic>? get statusBadge {
    final value = _statusBadge;
    if (value == null) return null;
    if (_statusBadge is EqualUnmodifiableMapView) return _statusBadge;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? timeSinceValidation;
  final Map<String, dynamic>? _validationSummary;
  @override
  Map<String, dynamic>? get validationSummary {
    final value = _validationSummary;
    if (value == null) return null;
    if (_validationSummary is EqualUnmodifiableMapView)
      return _validationSummary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final UserModel? securityPersonnel;

  @override
  String toString() {
    return 'SecurityValidationModel(id: $id, visitorOtpId: $visitorOtpId, securityPersonnelId: $securityPersonnelId, estateId: $estateId, validationMethod: $validationMethod, validationStatus: $validationStatus, otpStatusAtValidation: $otpStatusAtValidation, validatedAt: $validatedAt, denialReason: $denialReason, securityNotes: $securityNotes, validationMetadata: $validationMetadata, gateAction: $gateAction, gateEntryTime: $gateEntryTime, requiresEscort: $requiresEscort, escortToAddress: $escortToAddress, securityInstructions: $securityInstructions, createdAt: $createdAt, updatedAt: $updatedAt, statusBadge: $statusBadge, timeSinceValidation: $timeSinceValidation, validationSummary: $validationSummary, securityPersonnel: $securityPersonnel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecurityValidationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.visitorOtpId, visitorOtpId) ||
                other.visitorOtpId == visitorOtpId) &&
            (identical(other.securityPersonnelId, securityPersonnelId) ||
                other.securityPersonnelId == securityPersonnelId) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.validationMethod, validationMethod) ||
                other.validationMethod == validationMethod) &&
            (identical(other.validationStatus, validationStatus) ||
                other.validationStatus == validationStatus) &&
            (identical(other.otpStatusAtValidation, otpStatusAtValidation) ||
                other.otpStatusAtValidation == otpStatusAtValidation) &&
            (identical(other.validatedAt, validatedAt) ||
                other.validatedAt == validatedAt) &&
            (identical(other.denialReason, denialReason) ||
                other.denialReason == denialReason) &&
            (identical(other.securityNotes, securityNotes) ||
                other.securityNotes == securityNotes) &&
            const DeepCollectionEquality()
                .equals(other._validationMetadata, _validationMetadata) &&
            (identical(other.gateAction, gateAction) ||
                other.gateAction == gateAction) &&
            (identical(other.gateEntryTime, gateEntryTime) ||
                other.gateEntryTime == gateEntryTime) &&
            (identical(other.requiresEscort, requiresEscort) ||
                other.requiresEscort == requiresEscort) &&
            (identical(other.escortToAddress, escortToAddress) ||
                other.escortToAddress == escortToAddress) &&
            (identical(other.securityInstructions, securityInstructions) ||
                other.securityInstructions == securityInstructions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._statusBadge, _statusBadge) &&
            (identical(other.timeSinceValidation, timeSinceValidation) ||
                other.timeSinceValidation == timeSinceValidation) &&
            const DeepCollectionEquality()
                .equals(other._validationSummary, _validationSummary) &&
            (identical(other.securityPersonnel, securityPersonnel) ||
                other.securityPersonnel == securityPersonnel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        visitorOtpId,
        securityPersonnelId,
        estateId,
        validationMethod,
        validationStatus,
        otpStatusAtValidation,
        validatedAt,
        denialReason,
        securityNotes,
        const DeepCollectionEquality().hash(_validationMetadata),
        gateAction,
        gateEntryTime,
        requiresEscort,
        escortToAddress,
        securityInstructions,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_statusBadge),
        timeSinceValidation,
        const DeepCollectionEquality().hash(_validationSummary),
        securityPersonnel
      ]);

  /// Create a copy of SecurityValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SecurityValidationModelImplCopyWith<_$SecurityValidationModelImpl>
      get copyWith => __$$SecurityValidationModelImplCopyWithImpl<
          _$SecurityValidationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SecurityValidationModelImplToJson(
      this,
    );
  }
}

abstract class _SecurityValidationModel implements SecurityValidationModel {
  const factory _SecurityValidationModel(
      {final int? id,
      final int? visitorOtpId,
      final int? securityPersonnelId,
      final int? estateId,
      final String? validationMethod,
      final String? validationStatus,
      final String? otpStatusAtValidation,
      final String? validatedAt,
      final String? denialReason,
      final String? securityNotes,
      final List<dynamic>? validationMetadata,
      final String? gateAction,
      final String? gateEntryTime,
      final bool? requiresEscort,
      final String? escortToAddress,
      final String? securityInstructions,
      final String? createdAt,
      final String? updatedAt,
      final Map<String, dynamic>? statusBadge,
      final String? timeSinceValidation,
      final Map<String, dynamic>? validationSummary,
      final UserModel? securityPersonnel}) = _$SecurityValidationModelImpl;

  factory _SecurityValidationModel.fromJson(Map<String, dynamic> json) =
      _$SecurityValidationModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get visitorOtpId;
  @override
  int? get securityPersonnelId;
  @override
  int? get estateId;
  @override
  String? get validationMethod;
  @override
  String? get validationStatus;
  @override
  String? get otpStatusAtValidation;
  @override
  String? get validatedAt;
  @override
  String? get denialReason;
  @override
  String? get securityNotes;
  @override
  List<dynamic>? get validationMetadata;
  @override
  String? get gateAction;
  @override
  String? get gateEntryTime;
  @override
  bool? get requiresEscort;
  @override
  String? get escortToAddress;
  @override
  String? get securityInstructions;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  Map<String, dynamic>? get statusBadge;
  @override
  String? get timeSinceValidation;
  @override
  Map<String, dynamic>? get validationSummary;
  @override
  UserModel? get securityPersonnel;

  /// Create a copy of SecurityValidationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SecurityValidationModelImplCopyWith<_$SecurityValidationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
