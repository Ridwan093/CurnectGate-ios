// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_count_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationCountData _$NotificationCountDataFromJson(
    Map<String, dynamic> json) {
  return _NotificationCountData.fromJson(json);
}

/// @nodoc
mixin _$NotificationCountData {
  int? get count => throw _privateConstructorUsedError;
  bool? get unreadOnly => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;

  /// Serializes this NotificationCountData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationCountData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationCountDataCopyWith<NotificationCountData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCountDataCopyWith<$Res> {
  factory $NotificationCountDataCopyWith(NotificationCountData value,
          $Res Function(NotificationCountData) then) =
      _$NotificationCountDataCopyWithImpl<$Res, NotificationCountData>;
  @useResult
  $Res call({int? count, bool? unreadOnly, int? estateId});
}

/// @nodoc
class _$NotificationCountDataCopyWithImpl<$Res,
        $Val extends NotificationCountData>
    implements $NotificationCountDataCopyWith<$Res> {
  _$NotificationCountDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationCountData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? unreadOnly = freezed,
    Object? estateId = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      unreadOnly: freezed == unreadOnly
          ? _value.unreadOnly
          : unreadOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationCountDataImplCopyWith<$Res>
    implements $NotificationCountDataCopyWith<$Res> {
  factory _$$NotificationCountDataImplCopyWith(
          _$NotificationCountDataImpl value,
          $Res Function(_$NotificationCountDataImpl) then) =
      __$$NotificationCountDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? count, bool? unreadOnly, int? estateId});
}

/// @nodoc
class __$$NotificationCountDataImplCopyWithImpl<$Res>
    extends _$NotificationCountDataCopyWithImpl<$Res,
        _$NotificationCountDataImpl>
    implements _$$NotificationCountDataImplCopyWith<$Res> {
  __$$NotificationCountDataImplCopyWithImpl(_$NotificationCountDataImpl _value,
      $Res Function(_$NotificationCountDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationCountData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? unreadOnly = freezed,
    Object? estateId = freezed,
  }) {
    return _then(_$NotificationCountDataImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      unreadOnly: freezed == unreadOnly
          ? _value.unreadOnly
          : unreadOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$NotificationCountDataImpl implements _NotificationCountData {
  const _$NotificationCountDataImpl(
      {this.count, this.unreadOnly, this.estateId});

  factory _$NotificationCountDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationCountDataImplFromJson(json);

  @override
  final int? count;
  @override
  final bool? unreadOnly;
  @override
  final int? estateId;

  @override
  String toString() {
    return 'NotificationCountData(count: $count, unreadOnly: $unreadOnly, estateId: $estateId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationCountDataImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.unreadOnly, unreadOnly) ||
                other.unreadOnly == unreadOnly) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, unreadOnly, estateId);

  /// Create a copy of NotificationCountData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationCountDataImplCopyWith<_$NotificationCountDataImpl>
      get copyWith => __$$NotificationCountDataImplCopyWithImpl<
          _$NotificationCountDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationCountDataImplToJson(
      this,
    );
  }
}

abstract class _NotificationCountData implements NotificationCountData {
  const factory _NotificationCountData(
      {final int? count,
      final bool? unreadOnly,
      final int? estateId}) = _$NotificationCountDataImpl;

  factory _NotificationCountData.fromJson(Map<String, dynamic> json) =
      _$NotificationCountDataImpl.fromJson;

  @override
  int? get count;
  @override
  bool? get unreadOnly;
  @override
  int? get estateId;

  /// Create a copy of NotificationCountData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationCountDataImplCopyWith<_$NotificationCountDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
