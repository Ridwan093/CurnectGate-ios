// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'committee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Committee _$CommitteeFromJson(Map<String, dynamic> json) {
  return _Committee.fromJson(json);
}

/// @nodoc
mixin _$Committee {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  CommitteeCategory? get category => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get memberCount => throw _privateConstructorUsedError;
  String? get chairperson => throw _privateConstructorUsedError;
  String? get secretary => throw _privateConstructorUsedError;
  DateTime? get nextMeeting => throw _privateConstructorUsedError;
  DateTime? get establishedDate => throw _privateConstructorUsedError;
  MeetingSchedule? get meetingSchedule => throw _privateConstructorUsedError;
  String? get meetingLocation => throw _privateConstructorUsedError;
  List<String>? get objectives => throw _privateConstructorUsedError;
  List<String>? get achievements => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Committee to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Committee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommitteeCopyWith<Committee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommitteeCopyWith<$Res> {
  factory $CommitteeCopyWith(Committee value, $Res Function(Committee) then) =
      _$CommitteeCopyWithImpl<$Res, Committee>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      CommitteeCategory? category,
      String? status,
      int? memberCount,
      String? chairperson,
      String? secretary,
      DateTime? nextMeeting,
      DateTime? establishedDate,
      MeetingSchedule? meetingSchedule,
      String? meetingLocation,
      List<String>? objectives,
      List<String>? achievements,
      DateTime? createdAt,
      DateTime? updatedAt});

  $CommitteeCategoryCopyWith<$Res>? get category;
  $MeetingScheduleCopyWith<$Res>? get meetingSchedule;
}

/// @nodoc
class _$CommitteeCopyWithImpl<$Res, $Val extends Committee>
    implements $CommitteeCopyWith<$Res> {
  _$CommitteeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Committee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? status = freezed,
    Object? memberCount = freezed,
    Object? chairperson = freezed,
    Object? secretary = freezed,
    Object? nextMeeting = freezed,
    Object? establishedDate = freezed,
    Object? meetingSchedule = freezed,
    Object? meetingLocation = freezed,
    Object? objectives = freezed,
    Object? achievements = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CommitteeCategory?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCount: freezed == memberCount
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      chairperson: freezed == chairperson
          ? _value.chairperson
          : chairperson // ignore: cast_nullable_to_non_nullable
              as String?,
      secretary: freezed == secretary
          ? _value.secretary
          : secretary // ignore: cast_nullable_to_non_nullable
              as String?,
      nextMeeting: freezed == nextMeeting
          ? _value.nextMeeting
          : nextMeeting // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      establishedDate: freezed == establishedDate
          ? _value.establishedDate
          : establishedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      meetingSchedule: freezed == meetingSchedule
          ? _value.meetingSchedule
          : meetingSchedule // ignore: cast_nullable_to_non_nullable
              as MeetingSchedule?,
      meetingLocation: freezed == meetingLocation
          ? _value.meetingLocation
          : meetingLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      objectives: freezed == objectives
          ? _value.objectives
          : objectives // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      achievements: freezed == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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

  /// Create a copy of Committee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommitteeCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CommitteeCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of Committee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MeetingScheduleCopyWith<$Res>? get meetingSchedule {
    if (_value.meetingSchedule == null) {
      return null;
    }

    return $MeetingScheduleCopyWith<$Res>(_value.meetingSchedule!, (value) {
      return _then(_value.copyWith(meetingSchedule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommitteeImplCopyWith<$Res>
    implements $CommitteeCopyWith<$Res> {
  factory _$$CommitteeImplCopyWith(
          _$CommitteeImpl value, $Res Function(_$CommitteeImpl) then) =
      __$$CommitteeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      CommitteeCategory? category,
      String? status,
      int? memberCount,
      String? chairperson,
      String? secretary,
      DateTime? nextMeeting,
      DateTime? establishedDate,
      MeetingSchedule? meetingSchedule,
      String? meetingLocation,
      List<String>? objectives,
      List<String>? achievements,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $CommitteeCategoryCopyWith<$Res>? get category;
  @override
  $MeetingScheduleCopyWith<$Res>? get meetingSchedule;
}

/// @nodoc
class __$$CommitteeImplCopyWithImpl<$Res>
    extends _$CommitteeCopyWithImpl<$Res, _$CommitteeImpl>
    implements _$$CommitteeImplCopyWith<$Res> {
  __$$CommitteeImplCopyWithImpl(
      _$CommitteeImpl _value, $Res Function(_$CommitteeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Committee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? status = freezed,
    Object? memberCount = freezed,
    Object? chairperson = freezed,
    Object? secretary = freezed,
    Object? nextMeeting = freezed,
    Object? establishedDate = freezed,
    Object? meetingSchedule = freezed,
    Object? meetingLocation = freezed,
    Object? objectives = freezed,
    Object? achievements = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CommitteeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CommitteeCategory?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      memberCount: freezed == memberCount
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      chairperson: freezed == chairperson
          ? _value.chairperson
          : chairperson // ignore: cast_nullable_to_non_nullable
              as String?,
      secretary: freezed == secretary
          ? _value.secretary
          : secretary // ignore: cast_nullable_to_non_nullable
              as String?,
      nextMeeting: freezed == nextMeeting
          ? _value.nextMeeting
          : nextMeeting // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      establishedDate: freezed == establishedDate
          ? _value.establishedDate
          : establishedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      meetingSchedule: freezed == meetingSchedule
          ? _value.meetingSchedule
          : meetingSchedule // ignore: cast_nullable_to_non_nullable
              as MeetingSchedule?,
      meetingLocation: freezed == meetingLocation
          ? _value.meetingLocation
          : meetingLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      objectives: freezed == objectives
          ? _value._objectives
          : objectives // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      achievements: freezed == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CommitteeImpl implements _Committee {
  const _$CommitteeImpl(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.status,
      this.memberCount,
      this.chairperson,
      this.secretary,
      this.nextMeeting,
      this.establishedDate,
      this.meetingSchedule,
      this.meetingLocation,
      final List<String>? objectives,
      final List<String>? achievements,
      this.createdAt,
      this.updatedAt})
      : _objectives = objectives,
        _achievements = achievements;

  factory _$CommitteeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommitteeImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final CommitteeCategory? category;
  @override
  final String? status;
  @override
  final int? memberCount;
  @override
  final String? chairperson;
  @override
  final String? secretary;
  @override
  final DateTime? nextMeeting;
  @override
  final DateTime? establishedDate;
  @override
  final MeetingSchedule? meetingSchedule;
  @override
  final String? meetingLocation;
  final List<String>? _objectives;
  @override
  List<String>? get objectives {
    final value = _objectives;
    if (value == null) return null;
    if (_objectives is EqualUnmodifiableListView) return _objectives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _achievements;
  @override
  List<String>? get achievements {
    final value = _achievements;
    if (value == null) return null;
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Committee(id: $id, name: $name, description: $description, category: $category, status: $status, memberCount: $memberCount, chairperson: $chairperson, secretary: $secretary, nextMeeting: $nextMeeting, establishedDate: $establishedDate, meetingSchedule: $meetingSchedule, meetingLocation: $meetingLocation, objectives: $objectives, achievements: $achievements, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommitteeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.chairperson, chairperson) ||
                other.chairperson == chairperson) &&
            (identical(other.secretary, secretary) ||
                other.secretary == secretary) &&
            (identical(other.nextMeeting, nextMeeting) ||
                other.nextMeeting == nextMeeting) &&
            (identical(other.establishedDate, establishedDate) ||
                other.establishedDate == establishedDate) &&
            (identical(other.meetingSchedule, meetingSchedule) ||
                other.meetingSchedule == meetingSchedule) &&
            (identical(other.meetingLocation, meetingLocation) ||
                other.meetingLocation == meetingLocation) &&
            const DeepCollectionEquality()
                .equals(other._objectives, _objectives) &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements) &&
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
      description,
      category,
      status,
      memberCount,
      chairperson,
      secretary,
      nextMeeting,
      establishedDate,
      meetingSchedule,
      meetingLocation,
      const DeepCollectionEquality().hash(_objectives),
      const DeepCollectionEquality().hash(_achievements),
      createdAt,
      updatedAt);

  /// Create a copy of Committee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommitteeImplCopyWith<_$CommitteeImpl> get copyWith =>
      __$$CommitteeImplCopyWithImpl<_$CommitteeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommitteeImplToJson(
      this,
    );
  }
}

abstract class _Committee implements Committee {
  const factory _Committee(
      {final int? id,
      final String? name,
      final String? description,
      final CommitteeCategory? category,
      final String? status,
      final int? memberCount,
      final String? chairperson,
      final String? secretary,
      final DateTime? nextMeeting,
      final DateTime? establishedDate,
      final MeetingSchedule? meetingSchedule,
      final String? meetingLocation,
      final List<String>? objectives,
      final List<String>? achievements,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$CommitteeImpl;

  factory _Committee.fromJson(Map<String, dynamic> json) =
      _$CommitteeImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  CommitteeCategory? get category;
  @override
  String? get status;
  @override
  int? get memberCount;
  @override
  String? get chairperson;
  @override
  String? get secretary;
  @override
  DateTime? get nextMeeting;
  @override
  DateTime? get establishedDate;
  @override
  MeetingSchedule? get meetingSchedule;
  @override
  String? get meetingLocation;
  @override
  List<String>? get objectives;
  @override
  List<String>? get achievements;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Committee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommitteeImplCopyWith<_$CommitteeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
