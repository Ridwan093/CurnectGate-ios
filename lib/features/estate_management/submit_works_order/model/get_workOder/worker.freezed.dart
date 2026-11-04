// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Worker _$WorkerFromJson(Map<String, dynamic> json) {
  return _Worker.fromJson(json);
}

/// @nodoc
mixin _$Worker {
  int? get id => throw _privateConstructorUsedError;
  int? get workorderId => throw _privateConstructorUsedError;
  String? get workerName => throw _privateConstructorUsedError;
  String? get workerPhone => throw _privateConstructorUsedError;
  String? get accessCode => throw _privateConstructorUsedError;
  bool? get isVendorLeader => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Worker to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkerCopyWith<Worker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkerCopyWith<$Res> {
  factory $WorkerCopyWith(Worker value, $Res Function(Worker) then) =
      _$WorkerCopyWithImpl<$Res, Worker>;
  @useResult
  $Res call(
      {int? id,
      int? workorderId,
      String? workerName,
      String? workerPhone,
      String? accessCode,
      bool? isVendorLeader,
      String? status,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$WorkerCopyWithImpl<$Res, $Val extends Worker>
    implements $WorkerCopyWith<$Res> {
  _$WorkerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? workorderId = freezed,
    Object? workerName = freezed,
    Object? workerPhone = freezed,
    Object? accessCode = freezed,
    Object? isVendorLeader = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      workorderId: freezed == workorderId
          ? _value.workorderId
          : workorderId // ignore: cast_nullable_to_non_nullable
              as int?,
      workerName: freezed == workerName
          ? _value.workerName
          : workerName // ignore: cast_nullable_to_non_nullable
              as String?,
      workerPhone: freezed == workerPhone
          ? _value.workerPhone
          : workerPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      accessCode: freezed == accessCode
          ? _value.accessCode
          : accessCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isVendorLeader: freezed == isVendorLeader
          ? _value.isVendorLeader
          : isVendorLeader // ignore: cast_nullable_to_non_nullable
              as bool?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkerImplCopyWith<$Res> implements $WorkerCopyWith<$Res> {
  factory _$$WorkerImplCopyWith(
          _$WorkerImpl value, $Res Function(_$WorkerImpl) then) =
      __$$WorkerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? workorderId,
      String? workerName,
      String? workerPhone,
      String? accessCode,
      bool? isVendorLeader,
      String? status,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$WorkerImplCopyWithImpl<$Res>
    extends _$WorkerCopyWithImpl<$Res, _$WorkerImpl>
    implements _$$WorkerImplCopyWith<$Res> {
  __$$WorkerImplCopyWithImpl(
      _$WorkerImpl _value, $Res Function(_$WorkerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? workorderId = freezed,
    Object? workerName = freezed,
    Object? workerPhone = freezed,
    Object? accessCode = freezed,
    Object? isVendorLeader = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$WorkerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      workorderId: freezed == workorderId
          ? _value.workorderId
          : workorderId // ignore: cast_nullable_to_non_nullable
              as int?,
      workerName: freezed == workerName
          ? _value.workerName
          : workerName // ignore: cast_nullable_to_non_nullable
              as String?,
      workerPhone: freezed == workerPhone
          ? _value.workerPhone
          : workerPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      accessCode: freezed == accessCode
          ? _value.accessCode
          : accessCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isVendorLeader: freezed == isVendorLeader
          ? _value.isVendorLeader
          : isVendorLeader // ignore: cast_nullable_to_non_nullable
              as bool?,
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
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$WorkerImpl implements _Worker {
  const _$WorkerImpl(
      {this.id,
      this.workorderId,
      this.workerName,
      this.workerPhone,
      this.accessCode,
      this.isVendorLeader,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory _$WorkerImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkerImplFromJson(json);

  @override
  final int? id;
  @override
  final int? workorderId;
  @override
  final String? workerName;
  @override
  final String? workerPhone;
  @override
  final String? accessCode;
  @override
  final bool? isVendorLeader;
  @override
  final String? status;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'Worker(id: $id, workorderId: $workorderId, workerName: $workerName, workerPhone: $workerPhone, accessCode: $accessCode, isVendorLeader: $isVendorLeader, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workorderId, workorderId) ||
                other.workorderId == workorderId) &&
            (identical(other.workerName, workerName) ||
                other.workerName == workerName) &&
            (identical(other.workerPhone, workerPhone) ||
                other.workerPhone == workerPhone) &&
            (identical(other.accessCode, accessCode) ||
                other.accessCode == accessCode) &&
            (identical(other.isVendorLeader, isVendorLeader) ||
                other.isVendorLeader == isVendorLeader) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, workorderId, workerName,
      workerPhone, accessCode, isVendorLeader, status, createdAt, updatedAt);

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkerImplCopyWith<_$WorkerImpl> get copyWith =>
      __$$WorkerImplCopyWithImpl<_$WorkerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkerImplToJson(
      this,
    );
  }
}

abstract class _Worker implements Worker {
  const factory _Worker(
      {final int? id,
      final int? workorderId,
      final String? workerName,
      final String? workerPhone,
      final String? accessCode,
      final bool? isVendorLeader,
      final String? status,
      final String? createdAt,
      final String? updatedAt}) = _$WorkerImpl;

  factory _Worker.fromJson(Map<String, dynamic> json) = _$WorkerImpl.fromJson;

  @override
  int? get id;
  @override
  int? get workorderId;
  @override
  String? get workerName;
  @override
  String? get workerPhone;
  @override
  String? get accessCode;
  @override
  bool? get isVendorLeader;
  @override
  String? get status;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkerImplCopyWith<_$WorkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
