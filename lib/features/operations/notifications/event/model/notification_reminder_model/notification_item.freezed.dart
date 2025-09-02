// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationItem _$NotificationItemFromJson(Map<String, dynamic> json) {
  return _NotificationItem.fromJson(json);
}

/// @nodoc
mixin _$NotificationItem {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate_id')
  int? get estateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_url')
  String? get mediaUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_key')
  String? get mediaKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_type')
  String? get statusType => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate')
  Estate? get estate => throw _privateConstructorUsedError;

  /// Serializes this NotificationItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationItemCopyWith<NotificationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationItemCopyWith<$Res> {
  factory $NotificationItemCopyWith(
          NotificationItem value, $Res Function(NotificationItem) then) =
      _$NotificationItemCopyWithImpl<$Res, NotificationItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'estate_id') int? estateId,
      @JsonKey(name: 'media_url') String? mediaUrl,
      @JsonKey(name: 'media_key') String? mediaKey,
      @JsonKey(name: 'status_type') String? statusType,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'estate') Estate? estate});

  $EstateCopyWith<$Res>? get estate;
}

/// @nodoc
class _$NotificationItemCopyWithImpl<$Res, $Val extends NotificationItem>
    implements $NotificationItemCopyWith<$Res> {
  _$NotificationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? estateId = freezed,
    Object? mediaUrl = freezed,
    Object? mediaKey = freezed,
    Object? statusType = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? estate = freezed,
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
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaKey: freezed == mediaKey
          ? _value.mediaKey
          : mediaKey // ignore: cast_nullable_to_non_nullable
              as String?,
      statusType: freezed == statusType
          ? _value.statusType
          : statusType // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
      estate: freezed == estate
          ? _value.estate
          : estate // ignore: cast_nullable_to_non_nullable
              as Estate?,
    ) as $Val);
  }

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EstateCopyWith<$Res>? get estate {
    if (_value.estate == null) {
      return null;
    }

    return $EstateCopyWith<$Res>(_value.estate!, (value) {
      return _then(_value.copyWith(estate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationItemImplCopyWith<$Res>
    implements $NotificationItemCopyWith<$Res> {
  factory _$$NotificationItemImplCopyWith(_$NotificationItemImpl value,
          $Res Function(_$NotificationItemImpl) then) =
      __$$NotificationItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'estate_id') int? estateId,
      @JsonKey(name: 'media_url') String? mediaUrl,
      @JsonKey(name: 'media_key') String? mediaKey,
      @JsonKey(name: 'status_type') String? statusType,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'estate') Estate? estate});

  @override
  $EstateCopyWith<$Res>? get estate;
}

/// @nodoc
class __$$NotificationItemImplCopyWithImpl<$Res>
    extends _$NotificationItemCopyWithImpl<$Res, _$NotificationItemImpl>
    implements _$$NotificationItemImplCopyWith<$Res> {
  __$$NotificationItemImplCopyWithImpl(_$NotificationItemImpl _value,
      $Res Function(_$NotificationItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? estateId = freezed,
    Object? mediaUrl = freezed,
    Object? mediaKey = freezed,
    Object? statusType = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? estate = freezed,
  }) {
    return _then(_$NotificationItemImpl(
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
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaKey: freezed == mediaKey
          ? _value.mediaKey
          : mediaKey // ignore: cast_nullable_to_non_nullable
              as String?,
      statusType: freezed == statusType
          ? _value.statusType
          : statusType // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
      estate: freezed == estate
          ? _value.estate
          : estate // ignore: cast_nullable_to_non_nullable
              as Estate?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$NotificationItemImpl implements _NotificationItem {
  const _$NotificationItemImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'estate_id') required this.estateId,
      @JsonKey(name: 'media_url') required this.mediaUrl,
      @JsonKey(name: 'media_key') required this.mediaKey,
      @JsonKey(name: 'status_type') required this.statusType,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'estate') required this.estate});

  factory _$NotificationItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationItemImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'estate_id')
  final int? estateId;
  @override
  @JsonKey(name: 'media_url')
  final String? mediaUrl;
  @override
  @JsonKey(name: 'media_key')
  final String? mediaKey;
  @override
  @JsonKey(name: 'status_type')
  final String? statusType;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'estate')
  final Estate? estate;

  @override
  String toString() {
    return 'NotificationItem(id: $id, userId: $userId, estateId: $estateId, mediaUrl: $mediaUrl, mediaKey: $mediaKey, statusType: $statusType, type: $type, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, estate: $estate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.mediaKey, mediaKey) ||
                other.mediaKey == mediaKey) &&
            (identical(other.statusType, statusType) ||
                other.statusType == statusType) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.estate, estate) || other.estate == estate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      estateId,
      mediaUrl,
      mediaKey,
      statusType,
      type,
      description,
      status,
      createdAt,
      updatedAt,
      estate);

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationItemImplCopyWith<_$NotificationItemImpl> get copyWith =>
      __$$NotificationItemImplCopyWithImpl<_$NotificationItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationItemImplToJson(
      this,
    );
  }
}

abstract class _NotificationItem implements NotificationItem {
  const factory _NotificationItem(
          {@JsonKey(name: 'id') required final int? id,
          @JsonKey(name: 'user_id') required final int? userId,
          @JsonKey(name: 'estate_id') required final int? estateId,
          @JsonKey(name: 'media_url') required final String? mediaUrl,
          @JsonKey(name: 'media_key') required final String? mediaKey,
          @JsonKey(name: 'status_type') required final String? statusType,
          @JsonKey(name: 'type') required final String? type,
          @JsonKey(name: 'description') required final String? description,
          @JsonKey(name: 'status') required final String? status,
          @JsonKey(name: 'created_at') required final String? createdAt,
          @JsonKey(name: 'updated_at') required final String? updatedAt,
          @JsonKey(name: 'estate') required final Estate? estate}) =
      _$NotificationItemImpl;

  factory _NotificationItem.fromJson(Map<String, dynamic> json) =
      _$NotificationItemImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'estate_id')
  int? get estateId;
  @override
  @JsonKey(name: 'media_url')
  String? get mediaUrl;
  @override
  @JsonKey(name: 'media_key')
  String? get mediaKey;
  @override
  @JsonKey(name: 'status_type')
  String? get statusType;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'estate')
  Estate? get estate;

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationItemImplCopyWith<_$NotificationItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
