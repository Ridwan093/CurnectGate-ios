// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HistoryItem _$HistoryItemFromJson(Map<String, dynamic> json) {
  return _HistoryItem.fromJson(json);
}

/// @nodoc
mixin _$HistoryItem {
  int? get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  ChangedBy? get changedBy => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get changedAt => throw _privateConstructorUsedError;
  String? get timeAgo => throw _privateConstructorUsedError;

  /// Serializes this HistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryItemCopyWith<HistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryItemCopyWith<$Res> {
  factory $HistoryItemCopyWith(
          HistoryItem value, $Res Function(HistoryItem) then) =
      _$HistoryItemCopyWithImpl<$Res, HistoryItem>;
  @useResult
  $Res call(
      {int? id,
      String? status,
      ChangedBy? changedBy,
      String? notes,
      DateTime? changedAt,
      String? timeAgo});

  $ChangedByCopyWith<$Res>? get changedBy;
}

/// @nodoc
class _$HistoryItemCopyWithImpl<$Res, $Val extends HistoryItem>
    implements $HistoryItemCopyWith<$Res> {
  _$HistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? changedBy = freezed,
    Object? notes = freezed,
    Object? changedAt = freezed,
    Object? timeAgo = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      changedBy: freezed == changedBy
          ? _value.changedBy
          : changedBy // ignore: cast_nullable_to_non_nullable
              as ChangedBy?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      changedAt: freezed == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeAgo: freezed == timeAgo
          ? _value.timeAgo
          : timeAgo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChangedByCopyWith<$Res>? get changedBy {
    if (_value.changedBy == null) {
      return null;
    }

    return $ChangedByCopyWith<$Res>(_value.changedBy!, (value) {
      return _then(_value.copyWith(changedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HistoryItemImplCopyWith<$Res>
    implements $HistoryItemCopyWith<$Res> {
  factory _$$HistoryItemImplCopyWith(
          _$HistoryItemImpl value, $Res Function(_$HistoryItemImpl) then) =
      __$$HistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? status,
      ChangedBy? changedBy,
      String? notes,
      DateTime? changedAt,
      String? timeAgo});

  @override
  $ChangedByCopyWith<$Res>? get changedBy;
}

/// @nodoc
class __$$HistoryItemImplCopyWithImpl<$Res>
    extends _$HistoryItemCopyWithImpl<$Res, _$HistoryItemImpl>
    implements _$$HistoryItemImplCopyWith<$Res> {
  __$$HistoryItemImplCopyWithImpl(
      _$HistoryItemImpl _value, $Res Function(_$HistoryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? changedBy = freezed,
    Object? notes = freezed,
    Object? changedAt = freezed,
    Object? timeAgo = freezed,
  }) {
    return _then(_$HistoryItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      changedBy: freezed == changedBy
          ? _value.changedBy
          : changedBy // ignore: cast_nullable_to_non_nullable
              as ChangedBy?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      changedAt: freezed == changedAt
          ? _value.changedAt
          : changedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeAgo: freezed == timeAgo
          ? _value.timeAgo
          : timeAgo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryItemImpl implements _HistoryItem {
  const _$HistoryItemImpl(
      {this.id,
      this.status,
      this.changedBy,
      this.notes,
      this.changedAt,
      this.timeAgo});

  factory _$HistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryItemImplFromJson(json);

  @override
  final int? id;
  @override
  final String? status;
  @override
  final ChangedBy? changedBy;
  @override
  final String? notes;
  @override
  final DateTime? changedAt;
  @override
  final String? timeAgo;

  @override
  String toString() {
    return 'HistoryItem(id: $id, status: $status, changedBy: $changedBy, notes: $notes, changedAt: $changedAt, timeAgo: $timeAgo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.changedBy, changedBy) ||
                other.changedBy == changedBy) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.changedAt, changedAt) ||
                other.changedAt == changedAt) &&
            (identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, status, changedBy, notes, changedAt, timeAgo);

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryItemImplCopyWith<_$HistoryItemImpl> get copyWith =>
      __$$HistoryItemImplCopyWithImpl<_$HistoryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryItemImplToJson(
      this,
    );
  }
}

abstract class _HistoryItem implements HistoryItem {
  const factory _HistoryItem(
      {final int? id,
      final String? status,
      final ChangedBy? changedBy,
      final String? notes,
      final DateTime? changedAt,
      final String? timeAgo}) = _$HistoryItemImpl;

  factory _HistoryItem.fromJson(Map<String, dynamic> json) =
      _$HistoryItemImpl.fromJson;

  @override
  int? get id;
  @override
  String? get status;
  @override
  ChangedBy? get changedBy;
  @override
  String? get notes;
  @override
  DateTime? get changedAt;
  @override
  String? get timeAgo;

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryItemImplCopyWith<_$HistoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
