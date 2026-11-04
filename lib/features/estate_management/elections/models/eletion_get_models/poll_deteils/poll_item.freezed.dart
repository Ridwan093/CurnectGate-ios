// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PollItem _$PollItemFromJson(Map<String, dynamic> json) {
  return _PollItem.fromJson(json);
}

/// @nodoc
mixin _$PollItem {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get opensAt => throw _privateConstructorUsedError;
  String? get closesAt => throw _privateConstructorUsedError;
  bool? get isAnonymous => throw _privateConstructorUsedError;
  String? get rulesAndRegulations => throw _privateConstructorUsedError;
  List<PositionItemDetails>? get positions =>
      throw _privateConstructorUsedError;
  UserStatus? get userStatus => throw _privateConstructorUsedError;
  PollStatistics? get statistics => throw _privateConstructorUsedError;

  /// Serializes this PollItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PollItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollItemCopyWith<PollItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollItemCopyWith<$Res> {
  factory $PollItemCopyWith(PollItem value, $Res Function(PollItem) then) =
      _$PollItemCopyWithImpl<$Res, PollItem>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      String? type,
      String? status,
      String? opensAt,
      String? closesAt,
      bool? isAnonymous,
      String? rulesAndRegulations,
      List<PositionItemDetails>? positions,
      UserStatus? userStatus,
      PollStatistics? statistics});

  $UserStatusCopyWith<$Res>? get userStatus;
  $PollStatisticsCopyWith<$Res>? get statistics;
}

/// @nodoc
class _$PollItemCopyWithImpl<$Res, $Val extends PollItem>
    implements $PollItemCopyWith<$Res> {
  _$PollItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PollItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? opensAt = freezed,
    Object? closesAt = freezed,
    Object? isAnonymous = freezed,
    Object? rulesAndRegulations = freezed,
    Object? positions = freezed,
    Object? userStatus = freezed,
    Object? statistics = freezed,
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      opensAt: freezed == opensAt
          ? _value.opensAt
          : opensAt // ignore: cast_nullable_to_non_nullable
              as String?,
      closesAt: freezed == closesAt
          ? _value.closesAt
          : closesAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnonymous: freezed == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool?,
      rulesAndRegulations: freezed == rulesAndRegulations
          ? _value.rulesAndRegulations
          : rulesAndRegulations // ignore: cast_nullable_to_non_nullable
              as String?,
      positions: freezed == positions
          ? _value.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<PositionItemDetails>?,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as UserStatus?,
      statistics: freezed == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as PollStatistics?,
    ) as $Val);
  }

  /// Create a copy of PollItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStatusCopyWith<$Res>? get userStatus {
    if (_value.userStatus == null) {
      return null;
    }

    return $UserStatusCopyWith<$Res>(_value.userStatus!, (value) {
      return _then(_value.copyWith(userStatus: value) as $Val);
    });
  }

  /// Create a copy of PollItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PollStatisticsCopyWith<$Res>? get statistics {
    if (_value.statistics == null) {
      return null;
    }

    return $PollStatisticsCopyWith<$Res>(_value.statistics!, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PollItemImplCopyWith<$Res>
    implements $PollItemCopyWith<$Res> {
  factory _$$PollItemImplCopyWith(
          _$PollItemImpl value, $Res Function(_$PollItemImpl) then) =
      __$$PollItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      String? type,
      String? status,
      String? opensAt,
      String? closesAt,
      bool? isAnonymous,
      String? rulesAndRegulations,
      List<PositionItemDetails>? positions,
      UserStatus? userStatus,
      PollStatistics? statistics});

  @override
  $UserStatusCopyWith<$Res>? get userStatus;
  @override
  $PollStatisticsCopyWith<$Res>? get statistics;
}

/// @nodoc
class __$$PollItemImplCopyWithImpl<$Res>
    extends _$PollItemCopyWithImpl<$Res, _$PollItemImpl>
    implements _$$PollItemImplCopyWith<$Res> {
  __$$PollItemImplCopyWithImpl(
      _$PollItemImpl _value, $Res Function(_$PollItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of PollItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? opensAt = freezed,
    Object? closesAt = freezed,
    Object? isAnonymous = freezed,
    Object? rulesAndRegulations = freezed,
    Object? positions = freezed,
    Object? userStatus = freezed,
    Object? statistics = freezed,
  }) {
    return _then(_$PollItemImpl(
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      opensAt: freezed == opensAt
          ? _value.opensAt
          : opensAt // ignore: cast_nullable_to_non_nullable
              as String?,
      closesAt: freezed == closesAt
          ? _value.closesAt
          : closesAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnonymous: freezed == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool?,
      rulesAndRegulations: freezed == rulesAndRegulations
          ? _value.rulesAndRegulations
          : rulesAndRegulations // ignore: cast_nullable_to_non_nullable
              as String?,
      positions: freezed == positions
          ? _value._positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<PositionItemDetails>?,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as UserStatus?,
      statistics: freezed == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as PollStatistics?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PollItemImpl implements _PollItem {
  const _$PollItemImpl(
      {this.id,
      this.title,
      this.description,
      this.type,
      this.status,
      this.opensAt,
      this.closesAt,
      this.isAnonymous,
      this.rulesAndRegulations,
      final List<PositionItemDetails>? positions,
      this.userStatus,
      this.statistics})
      : _positions = positions;

  factory _$PollItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollItemImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? type;
  @override
  final String? status;
  @override
  final String? opensAt;
  @override
  final String? closesAt;
  @override
  final bool? isAnonymous;
  @override
  final String? rulesAndRegulations;
  final List<PositionItemDetails>? _positions;
  @override
  List<PositionItemDetails>? get positions {
    final value = _positions;
    if (value == null) return null;
    if (_positions is EqualUnmodifiableListView) return _positions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserStatus? userStatus;
  @override
  final PollStatistics? statistics;

  @override
  String toString() {
    return 'PollItem(id: $id, title: $title, description: $description, type: $type, status: $status, opensAt: $opensAt, closesAt: $closesAt, isAnonymous: $isAnonymous, rulesAndRegulations: $rulesAndRegulations, positions: $positions, userStatus: $userStatus, statistics: $statistics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.opensAt, opensAt) || other.opensAt == opensAt) &&
            (identical(other.closesAt, closesAt) ||
                other.closesAt == closesAt) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            (identical(other.rulesAndRegulations, rulesAndRegulations) ||
                other.rulesAndRegulations == rulesAndRegulations) &&
            const DeepCollectionEquality()
                .equals(other._positions, _positions) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      type,
      status,
      opensAt,
      closesAt,
      isAnonymous,
      rulesAndRegulations,
      const DeepCollectionEquality().hash(_positions),
      userStatus,
      statistics);

  /// Create a copy of PollItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollItemImplCopyWith<_$PollItemImpl> get copyWith =>
      __$$PollItemImplCopyWithImpl<_$PollItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollItemImplToJson(
      this,
    );
  }
}

abstract class _PollItem implements PollItem {
  const factory _PollItem(
      {final int? id,
      final String? title,
      final String? description,
      final String? type,
      final String? status,
      final String? opensAt,
      final String? closesAt,
      final bool? isAnonymous,
      final String? rulesAndRegulations,
      final List<PositionItemDetails>? positions,
      final UserStatus? userStatus,
      final PollStatistics? statistics}) = _$PollItemImpl;

  factory _PollItem.fromJson(Map<String, dynamic> json) =
      _$PollItemImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get type;
  @override
  String? get status;
  @override
  String? get opensAt;
  @override
  String? get closesAt;
  @override
  bool? get isAnonymous;
  @override
  String? get rulesAndRegulations;
  @override
  List<PositionItemDetails>? get positions;
  @override
  UserStatus? get userStatus;
  @override
  PollStatistics? get statistics;

  /// Create a copy of PollItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollItemImplCopyWith<_$PollItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
