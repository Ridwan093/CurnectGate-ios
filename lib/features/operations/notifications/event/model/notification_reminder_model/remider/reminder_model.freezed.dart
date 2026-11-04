// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReminderModel _$ReminderModelFromJson(Map<String, dynamic> json) {
  return _ReminderModel.fromJson(json);
}

/// @nodoc
mixin _$ReminderModel {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get reminderType => throw _privateConstructorUsedError;
  String? get reminderDatetime => throw _privateConstructorUsedError;
  String? get notificationMethod => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  bool? get isSharedWithHousehold => throw _privateConstructorUsedError;
  String? get snoozeUntil => throw _privateConstructorUsedError;
  int? get snoozeCount => throw _privateConstructorUsedError;
  bool? get hasFired => throw _privateConstructorUsedError;
  String? get lastFiredAt => throw _privateConstructorUsedError;
  bool? get isDue => throw _privateConstructorUsedError;
  bool? get isUpcoming => throw _privateConstructorUsedError;
  bool? get isSnoozed => throw _privateConstructorUsedError;
  bool? get isRecurring => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ReminderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderModelCopyWith<ReminderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderModelCopyWith<$Res> {
  factory $ReminderModelCopyWith(
          ReminderModel value, $Res Function(ReminderModel) then) =
      _$ReminderModelCopyWithImpl<$Res, ReminderModel>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      String? category,
      String? reminderType,
      String? reminderDatetime,
      String? notificationMethod,
      String? status,
      bool? isSharedWithHousehold,
      String? snoozeUntil,
      int? snoozeCount,
      bool? hasFired,
      String? lastFiredAt,
      bool? isDue,
      bool? isUpcoming,
      bool? isSnoozed,
      bool? isRecurring,
      String? createdAt});
}

/// @nodoc
class _$ReminderModelCopyWithImpl<$Res, $Val extends ReminderModel>
    implements $ReminderModelCopyWith<$Res> {
  _$ReminderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? reminderType = freezed,
    Object? reminderDatetime = freezed,
    Object? notificationMethod = freezed,
    Object? status = freezed,
    Object? isSharedWithHousehold = freezed,
    Object? snoozeUntil = freezed,
    Object? snoozeCount = freezed,
    Object? hasFired = freezed,
    Object? lastFiredAt = freezed,
    Object? isDue = freezed,
    Object? isUpcoming = freezed,
    Object? isSnoozed = freezed,
    Object? isRecurring = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      reminderType: freezed == reminderType
          ? _value.reminderType
          : reminderType // ignore: cast_nullable_to_non_nullable
              as String?,
      reminderDatetime: freezed == reminderDatetime
          ? _value.reminderDatetime
          : reminderDatetime // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationMethod: freezed == notificationMethod
          ? _value.notificationMethod
          : notificationMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isSharedWithHousehold: freezed == isSharedWithHousehold
          ? _value.isSharedWithHousehold
          : isSharedWithHousehold // ignore: cast_nullable_to_non_nullable
              as bool?,
      snoozeUntil: freezed == snoozeUntil
          ? _value.snoozeUntil
          : snoozeUntil // ignore: cast_nullable_to_non_nullable
              as String?,
      snoozeCount: freezed == snoozeCount
          ? _value.snoozeCount
          : snoozeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      hasFired: freezed == hasFired
          ? _value.hasFired
          : hasFired // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastFiredAt: freezed == lastFiredAt
          ? _value.lastFiredAt
          : lastFiredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isDue: freezed == isDue
          ? _value.isDue
          : isDue // ignore: cast_nullable_to_non_nullable
              as bool?,
      isUpcoming: freezed == isUpcoming
          ? _value.isUpcoming
          : isUpcoming // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSnoozed: freezed == isSnoozed
          ? _value.isSnoozed
          : isSnoozed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRecurring: freezed == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReminderModelImplCopyWith<$Res>
    implements $ReminderModelCopyWith<$Res> {
  factory _$$ReminderModelImplCopyWith(
          _$ReminderModelImpl value, $Res Function(_$ReminderModelImpl) then) =
      __$$ReminderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      String? category,
      String? reminderType,
      String? reminderDatetime,
      String? notificationMethod,
      String? status,
      bool? isSharedWithHousehold,
      String? snoozeUntil,
      int? snoozeCount,
      bool? hasFired,
      String? lastFiredAt,
      bool? isDue,
      bool? isUpcoming,
      bool? isSnoozed,
      bool? isRecurring,
      String? createdAt});
}

/// @nodoc
class __$$ReminderModelImplCopyWithImpl<$Res>
    extends _$ReminderModelCopyWithImpl<$Res, _$ReminderModelImpl>
    implements _$$ReminderModelImplCopyWith<$Res> {
  __$$ReminderModelImplCopyWithImpl(
      _$ReminderModelImpl _value, $Res Function(_$ReminderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? reminderType = freezed,
    Object? reminderDatetime = freezed,
    Object? notificationMethod = freezed,
    Object? status = freezed,
    Object? isSharedWithHousehold = freezed,
    Object? snoozeUntil = freezed,
    Object? snoozeCount = freezed,
    Object? hasFired = freezed,
    Object? lastFiredAt = freezed,
    Object? isDue = freezed,
    Object? isUpcoming = freezed,
    Object? isSnoozed = freezed,
    Object? isRecurring = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ReminderModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      reminderType: freezed == reminderType
          ? _value.reminderType
          : reminderType // ignore: cast_nullable_to_non_nullable
              as String?,
      reminderDatetime: freezed == reminderDatetime
          ? _value.reminderDatetime
          : reminderDatetime // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationMethod: freezed == notificationMethod
          ? _value.notificationMethod
          : notificationMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isSharedWithHousehold: freezed == isSharedWithHousehold
          ? _value.isSharedWithHousehold
          : isSharedWithHousehold // ignore: cast_nullable_to_non_nullable
              as bool?,
      snoozeUntil: freezed == snoozeUntil
          ? _value.snoozeUntil
          : snoozeUntil // ignore: cast_nullable_to_non_nullable
              as String?,
      snoozeCount: freezed == snoozeCount
          ? _value.snoozeCount
          : snoozeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      hasFired: freezed == hasFired
          ? _value.hasFired
          : hasFired // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastFiredAt: freezed == lastFiredAt
          ? _value.lastFiredAt
          : lastFiredAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isDue: freezed == isDue
          ? _value.isDue
          : isDue // ignore: cast_nullable_to_non_nullable
              as bool?,
      isUpcoming: freezed == isUpcoming
          ? _value.isUpcoming
          : isUpcoming // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSnoozed: freezed == isSnoozed
          ? _value.isSnoozed
          : isSnoozed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRecurring: freezed == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ReminderModelImpl implements _ReminderModel {
  const _$ReminderModelImpl(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.reminderType,
      this.reminderDatetime,
      this.notificationMethod,
      this.status,
      this.isSharedWithHousehold,
      this.snoozeUntil,
      this.snoozeCount,
      this.hasFired,
      this.lastFiredAt,
      this.isDue,
      this.isUpcoming,
      this.isSnoozed,
      this.isRecurring,
      this.createdAt});

  factory _$ReminderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? category;
  @override
  final String? reminderType;
  @override
  final String? reminderDatetime;
  @override
  final String? notificationMethod;
  @override
  final String? status;
  @override
  final bool? isSharedWithHousehold;
  @override
  final String? snoozeUntil;
  @override
  final int? snoozeCount;
  @override
  final bool? hasFired;
  @override
  final String? lastFiredAt;
  @override
  final bool? isDue;
  @override
  final bool? isUpcoming;
  @override
  final bool? isSnoozed;
  @override
  final bool? isRecurring;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'ReminderModel(id: $id, title: $title, description: $description, category: $category, reminderType: $reminderType, reminderDatetime: $reminderDatetime, notificationMethod: $notificationMethod, status: $status, isSharedWithHousehold: $isSharedWithHousehold, snoozeUntil: $snoozeUntil, snoozeCount: $snoozeCount, hasFired: $hasFired, lastFiredAt: $lastFiredAt, isDue: $isDue, isUpcoming: $isUpcoming, isSnoozed: $isSnoozed, isRecurring: $isRecurring, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.reminderType, reminderType) ||
                other.reminderType == reminderType) &&
            (identical(other.reminderDatetime, reminderDatetime) ||
                other.reminderDatetime == reminderDatetime) &&
            (identical(other.notificationMethod, notificationMethod) ||
                other.notificationMethod == notificationMethod) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isSharedWithHousehold, isSharedWithHousehold) ||
                other.isSharedWithHousehold == isSharedWithHousehold) &&
            (identical(other.snoozeUntil, snoozeUntil) ||
                other.snoozeUntil == snoozeUntil) &&
            (identical(other.snoozeCount, snoozeCount) ||
                other.snoozeCount == snoozeCount) &&
            (identical(other.hasFired, hasFired) ||
                other.hasFired == hasFired) &&
            (identical(other.lastFiredAt, lastFiredAt) ||
                other.lastFiredAt == lastFiredAt) &&
            (identical(other.isDue, isDue) || other.isDue == isDue) &&
            (identical(other.isUpcoming, isUpcoming) ||
                other.isUpcoming == isUpcoming) &&
            (identical(other.isSnoozed, isSnoozed) ||
                other.isSnoozed == isSnoozed) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      category,
      reminderType,
      reminderDatetime,
      notificationMethod,
      status,
      isSharedWithHousehold,
      snoozeUntil,
      snoozeCount,
      hasFired,
      lastFiredAt,
      isDue,
      isUpcoming,
      isSnoozed,
      isRecurring,
      createdAt);

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderModelImplCopyWith<_$ReminderModelImpl> get copyWith =>
      __$$ReminderModelImplCopyWithImpl<_$ReminderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderModelImplToJson(
      this,
    );
  }
}

abstract class _ReminderModel implements ReminderModel {
  const factory _ReminderModel(
      {final int? id,
      final String? title,
      final String? description,
      final String? category,
      final String? reminderType,
      final String? reminderDatetime,
      final String? notificationMethod,
      final String? status,
      final bool? isSharedWithHousehold,
      final String? snoozeUntil,
      final int? snoozeCount,
      final bool? hasFired,
      final String? lastFiredAt,
      final bool? isDue,
      final bool? isUpcoming,
      final bool? isSnoozed,
      final bool? isRecurring,
      final String? createdAt}) = _$ReminderModelImpl;

  factory _ReminderModel.fromJson(Map<String, dynamic> json) =
      _$ReminderModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get category;
  @override
  String? get reminderType;
  @override
  String? get reminderDatetime;
  @override
  String? get notificationMethod;
  @override
  String? get status;
  @override
  bool? get isSharedWithHousehold;
  @override
  String? get snoozeUntil;
  @override
  int? get snoozeCount;
  @override
  bool? get hasFired;
  @override
  String? get lastFiredAt;
  @override
  bool? get isDue;
  @override
  bool? get isUpcoming;
  @override
  bool? get isSnoozed;
  @override
  bool? get isRecurring;
  @override
  String? get createdAt;

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderModelImplCopyWith<_$ReminderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
