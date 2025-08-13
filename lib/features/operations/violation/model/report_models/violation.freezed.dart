// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'violation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Violation _$ViolationFromJson(Map<String, dynamic> json) {
  return _Violation.fromJson(json);
}

/// @nodoc
mixin _$Violation {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference_code')
  String get referenceCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'violation_code')
  String get violationCode => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  Estate get estate => throw _privateConstructorUsedError;
  User get reporter => throw _privateConstructorUsedError;
  @JsonKey(name: 'reported_user')
  User? get reportedUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'assigned_to')
  User? get assignedTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'property_owner')
  User get propertyOwner => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_details')
  LocationDetails get locationDetails => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Evidence get evidence => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_badge')
  String get statusBadge => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'priority_badge')
  String get priorityBadge => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_anonymous')
  bool get isAnonymous => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_open')
  bool get isOpen => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_closed')
  bool get isClosed => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments_summary')
  CommentSummary get commentsSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Violation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViolationCopyWith<Violation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolationCopyWith<$Res> {
  factory $ViolationCopyWith(Violation value, $Res Function(Violation) then) =
      _$ViolationCopyWithImpl<$Res, Violation>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'reference_code') String referenceCode,
      @JsonKey(name: 'violation_code') String violationCode,
      Category category,
      Estate estate,
      User reporter,
      @JsonKey(name: 'reported_user') User? reportedUser,
      @JsonKey(name: 'assigned_to') User? assignedTo,
      @JsonKey(name: 'property_owner') User propertyOwner,
      @JsonKey(name: 'location_details') LocationDetails locationDetails,
      String description,
      Evidence evidence,
      String status,
      @JsonKey(name: 'status_badge') String statusBadge,
      String priority,
      @JsonKey(name: 'priority_badge') String priorityBadge,
      @JsonKey(name: 'is_anonymous') bool isAnonymous,
      @JsonKey(name: 'is_open') bool isOpen,
      @JsonKey(name: 'is_closed') bool isClosed,
      @JsonKey(name: 'comments_summary') CommentSummary commentsSummary,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});

  $CategoryCopyWith<$Res> get category;
  $EstateCopyWith<$Res> get estate;
  $UserCopyWith<$Res> get reporter;
  $UserCopyWith<$Res>? get reportedUser;
  $UserCopyWith<$Res>? get assignedTo;
  $UserCopyWith<$Res> get propertyOwner;
  $LocationDetailsCopyWith<$Res> get locationDetails;
  $EvidenceCopyWith<$Res> get evidence;
  $CommentSummaryCopyWith<$Res> get commentsSummary;
}

/// @nodoc
class _$ViolationCopyWithImpl<$Res, $Val extends Violation>
    implements $ViolationCopyWith<$Res> {
  _$ViolationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? referenceCode = null,
    Object? violationCode = null,
    Object? category = null,
    Object? estate = null,
    Object? reporter = null,
    Object? reportedUser = freezed,
    Object? assignedTo = freezed,
    Object? propertyOwner = null,
    Object? locationDetails = null,
    Object? description = null,
    Object? evidence = null,
    Object? status = null,
    Object? statusBadge = null,
    Object? priority = null,
    Object? priorityBadge = null,
    Object? isAnonymous = null,
    Object? isOpen = null,
    Object? isClosed = null,
    Object? commentsSummary = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      referenceCode: null == referenceCode
          ? _value.referenceCode
          : referenceCode // ignore: cast_nullable_to_non_nullable
              as String,
      violationCode: null == violationCode
          ? _value.violationCode
          : violationCode // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      estate: null == estate
          ? _value.estate
          : estate // ignore: cast_nullable_to_non_nullable
              as Estate,
      reporter: null == reporter
          ? _value.reporter
          : reporter // ignore: cast_nullable_to_non_nullable
              as User,
      reportedUser: freezed == reportedUser
          ? _value.reportedUser
          : reportedUser // ignore: cast_nullable_to_non_nullable
              as User?,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as User?,
      propertyOwner: null == propertyOwner
          ? _value.propertyOwner
          : propertyOwner // ignore: cast_nullable_to_non_nullable
              as User,
      locationDetails: null == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationDetails,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      evidence: null == evidence
          ? _value.evidence
          : evidence // ignore: cast_nullable_to_non_nullable
              as Evidence,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusBadge: null == statusBadge
          ? _value.statusBadge
          : statusBadge // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      priorityBadge: null == priorityBadge
          ? _value.priorityBadge
          : priorityBadge // ignore: cast_nullable_to_non_nullable
              as String,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      commentsSummary: null == commentsSummary
          ? _value.commentsSummary
          : commentsSummary // ignore: cast_nullable_to_non_nullable
              as CommentSummary,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EstateCopyWith<$Res> get estate {
    return $EstateCopyWith<$Res>(_value.estate, (value) {
      return _then(_value.copyWith(estate: value) as $Val);
    });
  }

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get reporter {
    return $UserCopyWith<$Res>(_value.reporter, (value) {
      return _then(_value.copyWith(reporter: value) as $Val);
    });
  }

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get reportedUser {
    if (_value.reportedUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.reportedUser!, (value) {
      return _then(_value.copyWith(reportedUser: value) as $Val);
    });
  }

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get assignedTo {
    if (_value.assignedTo == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.assignedTo!, (value) {
      return _then(_value.copyWith(assignedTo: value) as $Val);
    });
  }

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get propertyOwner {
    return $UserCopyWith<$Res>(_value.propertyOwner, (value) {
      return _then(_value.copyWith(propertyOwner: value) as $Val);
    });
  }

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationDetailsCopyWith<$Res> get locationDetails {
    return $LocationDetailsCopyWith<$Res>(_value.locationDetails, (value) {
      return _then(_value.copyWith(locationDetails: value) as $Val);
    });
  }

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EvidenceCopyWith<$Res> get evidence {
    return $EvidenceCopyWith<$Res>(_value.evidence, (value) {
      return _then(_value.copyWith(evidence: value) as $Val);
    });
  }

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommentSummaryCopyWith<$Res> get commentsSummary {
    return $CommentSummaryCopyWith<$Res>(_value.commentsSummary, (value) {
      return _then(_value.copyWith(commentsSummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViolationImplCopyWith<$Res>
    implements $ViolationCopyWith<$Res> {
  factory _$$ViolationImplCopyWith(
          _$ViolationImpl value, $Res Function(_$ViolationImpl) then) =
      __$$ViolationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'reference_code') String referenceCode,
      @JsonKey(name: 'violation_code') String violationCode,
      Category category,
      Estate estate,
      User reporter,
      @JsonKey(name: 'reported_user') User? reportedUser,
      @JsonKey(name: 'assigned_to') User? assignedTo,
      @JsonKey(name: 'property_owner') User propertyOwner,
      @JsonKey(name: 'location_details') LocationDetails locationDetails,
      String description,
      Evidence evidence,
      String status,
      @JsonKey(name: 'status_badge') String statusBadge,
      String priority,
      @JsonKey(name: 'priority_badge') String priorityBadge,
      @JsonKey(name: 'is_anonymous') bool isAnonymous,
      @JsonKey(name: 'is_open') bool isOpen,
      @JsonKey(name: 'is_closed') bool isClosed,
      @JsonKey(name: 'comments_summary') CommentSummary commentsSummary,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});

  @override
  $CategoryCopyWith<$Res> get category;
  @override
  $EstateCopyWith<$Res> get estate;
  @override
  $UserCopyWith<$Res> get reporter;
  @override
  $UserCopyWith<$Res>? get reportedUser;
  @override
  $UserCopyWith<$Res>? get assignedTo;
  @override
  $UserCopyWith<$Res> get propertyOwner;
  @override
  $LocationDetailsCopyWith<$Res> get locationDetails;
  @override
  $EvidenceCopyWith<$Res> get evidence;
  @override
  $CommentSummaryCopyWith<$Res> get commentsSummary;
}

/// @nodoc
class __$$ViolationImplCopyWithImpl<$Res>
    extends _$ViolationCopyWithImpl<$Res, _$ViolationImpl>
    implements _$$ViolationImplCopyWith<$Res> {
  __$$ViolationImplCopyWithImpl(
      _$ViolationImpl _value, $Res Function(_$ViolationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? referenceCode = null,
    Object? violationCode = null,
    Object? category = null,
    Object? estate = null,
    Object? reporter = null,
    Object? reportedUser = freezed,
    Object? assignedTo = freezed,
    Object? propertyOwner = null,
    Object? locationDetails = null,
    Object? description = null,
    Object? evidence = null,
    Object? status = null,
    Object? statusBadge = null,
    Object? priority = null,
    Object? priorityBadge = null,
    Object? isAnonymous = null,
    Object? isOpen = null,
    Object? isClosed = null,
    Object? commentsSummary = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ViolationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      referenceCode: null == referenceCode
          ? _value.referenceCode
          : referenceCode // ignore: cast_nullable_to_non_nullable
              as String,
      violationCode: null == violationCode
          ? _value.violationCode
          : violationCode // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      estate: null == estate
          ? _value.estate
          : estate // ignore: cast_nullable_to_non_nullable
              as Estate,
      reporter: null == reporter
          ? _value.reporter
          : reporter // ignore: cast_nullable_to_non_nullable
              as User,
      reportedUser: freezed == reportedUser
          ? _value.reportedUser
          : reportedUser // ignore: cast_nullable_to_non_nullable
              as User?,
      assignedTo: freezed == assignedTo
          ? _value.assignedTo
          : assignedTo // ignore: cast_nullable_to_non_nullable
              as User?,
      propertyOwner: null == propertyOwner
          ? _value.propertyOwner
          : propertyOwner // ignore: cast_nullable_to_non_nullable
              as User,
      locationDetails: null == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationDetails,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      evidence: null == evidence
          ? _value.evidence
          : evidence // ignore: cast_nullable_to_non_nullable
              as Evidence,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusBadge: null == statusBadge
          ? _value.statusBadge
          : statusBadge // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      priorityBadge: null == priorityBadge
          ? _value.priorityBadge
          : priorityBadge // ignore: cast_nullable_to_non_nullable
              as String,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
      commentsSummary: null == commentsSummary
          ? _value.commentsSummary
          : commentsSummary // ignore: cast_nullable_to_non_nullable
              as CommentSummary,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ViolationImpl implements _Violation {
  const _$ViolationImpl(
      {required this.id,
      @JsonKey(name: 'reference_code') required this.referenceCode,
      @JsonKey(name: 'violation_code') required this.violationCode,
      required this.category,
      required this.estate,
      required this.reporter,
      @JsonKey(name: 'reported_user') this.reportedUser,
      @JsonKey(name: 'assigned_to') this.assignedTo,
      @JsonKey(name: 'property_owner') required this.propertyOwner,
      @JsonKey(name: 'location_details') required this.locationDetails,
      required this.description,
      required this.evidence,
      required this.status,
      @JsonKey(name: 'status_badge') required this.statusBadge,
      required this.priority,
      @JsonKey(name: 'priority_badge') required this.priorityBadge,
      @JsonKey(name: 'is_anonymous') required this.isAnonymous,
      @JsonKey(name: 'is_open') required this.isOpen,
      @JsonKey(name: 'is_closed') required this.isClosed,
      @JsonKey(name: 'comments_summary') required this.commentsSummary,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$ViolationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViolationImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'reference_code')
  final String referenceCode;
  @override
  @JsonKey(name: 'violation_code')
  final String violationCode;
  @override
  final Category category;
  @override
  final Estate estate;
  @override
  final User reporter;
  @override
  @JsonKey(name: 'reported_user')
  final User? reportedUser;
  @override
  @JsonKey(name: 'assigned_to')
  final User? assignedTo;
  @override
  @JsonKey(name: 'property_owner')
  final User propertyOwner;
  @override
  @JsonKey(name: 'location_details')
  final LocationDetails locationDetails;
  @override
  final String description;
  @override
  final Evidence evidence;
  @override
  final String status;
  @override
  @JsonKey(name: 'status_badge')
  final String statusBadge;
  @override
  final String priority;
  @override
  @JsonKey(name: 'priority_badge')
  final String priorityBadge;
  @override
  @JsonKey(name: 'is_anonymous')
  final bool isAnonymous;
  @override
  @JsonKey(name: 'is_open')
  final bool isOpen;
  @override
  @JsonKey(name: 'is_closed')
  final bool isClosed;
  @override
  @JsonKey(name: 'comments_summary')
  final CommentSummary commentsSummary;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'Violation(id: $id, referenceCode: $referenceCode, violationCode: $violationCode, category: $category, estate: $estate, reporter: $reporter, reportedUser: $reportedUser, assignedTo: $assignedTo, propertyOwner: $propertyOwner, locationDetails: $locationDetails, description: $description, evidence: $evidence, status: $status, statusBadge: $statusBadge, priority: $priority, priorityBadge: $priorityBadge, isAnonymous: $isAnonymous, isOpen: $isOpen, isClosed: $isClosed, commentsSummary: $commentsSummary, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViolationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.referenceCode, referenceCode) ||
                other.referenceCode == referenceCode) &&
            (identical(other.violationCode, violationCode) ||
                other.violationCode == violationCode) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.estate, estate) || other.estate == estate) &&
            (identical(other.reporter, reporter) ||
                other.reporter == reporter) &&
            (identical(other.reportedUser, reportedUser) ||
                other.reportedUser == reportedUser) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.propertyOwner, propertyOwner) ||
                other.propertyOwner == propertyOwner) &&
            (identical(other.locationDetails, locationDetails) ||
                other.locationDetails == locationDetails) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.evidence, evidence) ||
                other.evidence == evidence) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusBadge, statusBadge) ||
                other.statusBadge == statusBadge) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.priorityBadge, priorityBadge) ||
                other.priorityBadge == priorityBadge) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed) &&
            (identical(other.commentsSummary, commentsSummary) ||
                other.commentsSummary == commentsSummary) &&
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
        referenceCode,
        violationCode,
        category,
        estate,
        reporter,
        reportedUser,
        assignedTo,
        propertyOwner,
        locationDetails,
        description,
        evidence,
        status,
        statusBadge,
        priority,
        priorityBadge,
        isAnonymous,
        isOpen,
        isClosed,
        commentsSummary,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViolationImplCopyWith<_$ViolationImpl> get copyWith =>
      __$$ViolationImplCopyWithImpl<_$ViolationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViolationImplToJson(
      this,
    );
  }
}

abstract class _Violation implements Violation {
  const factory _Violation(
          {required final int id,
          @JsonKey(name: 'reference_code') required final String referenceCode,
          @JsonKey(name: 'violation_code') required final String violationCode,
          required final Category category,
          required final Estate estate,
          required final User reporter,
          @JsonKey(name: 'reported_user') final User? reportedUser,
          @JsonKey(name: 'assigned_to') final User? assignedTo,
          @JsonKey(name: 'property_owner') required final User propertyOwner,
          @JsonKey(name: 'location_details')
          required final LocationDetails locationDetails,
          required final String description,
          required final Evidence evidence,
          required final String status,
          @JsonKey(name: 'status_badge') required final String statusBadge,
          required final String priority,
          @JsonKey(name: 'priority_badge') required final String priorityBadge,
          @JsonKey(name: 'is_anonymous') required final bool isAnonymous,
          @JsonKey(name: 'is_open') required final bool isOpen,
          @JsonKey(name: 'is_closed') required final bool isClosed,
          @JsonKey(name: 'comments_summary')
          required final CommentSummary commentsSummary,
          @JsonKey(name: 'created_at') required final String createdAt,
          @JsonKey(name: 'updated_at') required final String updatedAt}) =
      _$ViolationImpl;

  factory _Violation.fromJson(Map<String, dynamic> json) =
      _$ViolationImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'reference_code')
  String get referenceCode;
  @override
  @JsonKey(name: 'violation_code')
  String get violationCode;
  @override
  Category get category;
  @override
  Estate get estate;
  @override
  User get reporter;
  @override
  @JsonKey(name: 'reported_user')
  User? get reportedUser;
  @override
  @JsonKey(name: 'assigned_to')
  User? get assignedTo;
  @override
  @JsonKey(name: 'property_owner')
  User get propertyOwner;
  @override
  @JsonKey(name: 'location_details')
  LocationDetails get locationDetails;
  @override
  String get description;
  @override
  Evidence get evidence;
  @override
  String get status;
  @override
  @JsonKey(name: 'status_badge')
  String get statusBadge;
  @override
  String get priority;
  @override
  @JsonKey(name: 'priority_badge')
  String get priorityBadge;
  @override
  @JsonKey(name: 'is_anonymous')
  bool get isAnonymous;
  @override
  @JsonKey(name: 'is_open')
  bool get isOpen;
  @override
  @JsonKey(name: 'is_closed')
  bool get isClosed;
  @override
  @JsonKey(name: 'comments_summary')
  CommentSummary get commentsSummary;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViolationImplCopyWith<_$ViolationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
