// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_household_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReminderHouseholdData _$ReminderHouseholdDataFromJson(
    Map<String, dynamic> json) {
  return _ReminderHouseholdData.fromJson(json);
}

/// @nodoc
mixin _$ReminderHouseholdData {
  List<ReminderHouseholdMember>? get members =>
      throw _privateConstructorUsedError;

  /// Serializes this ReminderHouseholdData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReminderHouseholdData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderHouseholdDataCopyWith<ReminderHouseholdData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderHouseholdDataCopyWith<$Res> {
  factory $ReminderHouseholdDataCopyWith(ReminderHouseholdData value,
          $Res Function(ReminderHouseholdData) then) =
      _$ReminderHouseholdDataCopyWithImpl<$Res, ReminderHouseholdData>;
  @useResult
  $Res call({List<ReminderHouseholdMember>? members});
}

/// @nodoc
class _$ReminderHouseholdDataCopyWithImpl<$Res,
        $Val extends ReminderHouseholdData>
    implements $ReminderHouseholdDataCopyWith<$Res> {
  _$ReminderHouseholdDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReminderHouseholdData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = freezed,
  }) {
    return _then(_value.copyWith(
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<ReminderHouseholdMember>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReminderHouseholdDataImplCopyWith<$Res>
    implements $ReminderHouseholdDataCopyWith<$Res> {
  factory _$$ReminderHouseholdDataImplCopyWith(
          _$ReminderHouseholdDataImpl value,
          $Res Function(_$ReminderHouseholdDataImpl) then) =
      __$$ReminderHouseholdDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReminderHouseholdMember>? members});
}

/// @nodoc
class __$$ReminderHouseholdDataImplCopyWithImpl<$Res>
    extends _$ReminderHouseholdDataCopyWithImpl<$Res,
        _$ReminderHouseholdDataImpl>
    implements _$$ReminderHouseholdDataImplCopyWith<$Res> {
  __$$ReminderHouseholdDataImplCopyWithImpl(_$ReminderHouseholdDataImpl _value,
      $Res Function(_$ReminderHouseholdDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReminderHouseholdData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = freezed,
  }) {
    return _then(_$ReminderHouseholdDataImpl(
      members: freezed == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<ReminderHouseholdMember>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ReminderHouseholdDataImpl implements _ReminderHouseholdData {
  const _$ReminderHouseholdDataImpl(
      {final List<ReminderHouseholdMember>? members})
      : _members = members;

  factory _$ReminderHouseholdDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderHouseholdDataImplFromJson(json);

  final List<ReminderHouseholdMember>? _members;
  @override
  List<ReminderHouseholdMember>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReminderHouseholdData(members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderHouseholdDataImpl &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_members));

  /// Create a copy of ReminderHouseholdData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderHouseholdDataImplCopyWith<_$ReminderHouseholdDataImpl>
      get copyWith => __$$ReminderHouseholdDataImplCopyWithImpl<
          _$ReminderHouseholdDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderHouseholdDataImplToJson(
      this,
    );
  }
}

abstract class _ReminderHouseholdData implements ReminderHouseholdData {
  const factory _ReminderHouseholdData(
          {final List<ReminderHouseholdMember>? members}) =
      _$ReminderHouseholdDataImpl;

  factory _ReminderHouseholdData.fromJson(Map<String, dynamic> json) =
      _$ReminderHouseholdDataImpl.fromJson;

  @override
  List<ReminderHouseholdMember>? get members;

  /// Create a copy of ReminderHouseholdData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderHouseholdDataImplCopyWith<_$ReminderHouseholdDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
