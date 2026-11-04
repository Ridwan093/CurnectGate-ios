// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'household_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HouseholdData _$HouseholdDataFromJson(Map<String, dynamic> json) {
  return _HouseholdData.fromJson(json);
}

/// @nodoc
mixin _$HouseholdData {
  @JsonKey(name: 'household')
  List<HouseholdMember>? get householdMembers =>
      throw _privateConstructorUsedError;

  /// Serializes this HouseholdData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HouseholdData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HouseholdDataCopyWith<HouseholdData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdDataCopyWith<$Res> {
  factory $HouseholdDataCopyWith(
          HouseholdData value, $Res Function(HouseholdData) then) =
      _$HouseholdDataCopyWithImpl<$Res, HouseholdData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'household') List<HouseholdMember>? householdMembers});
}

/// @nodoc
class _$HouseholdDataCopyWithImpl<$Res, $Val extends HouseholdData>
    implements $HouseholdDataCopyWith<$Res> {
  _$HouseholdDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HouseholdData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? householdMembers = freezed,
  }) {
    return _then(_value.copyWith(
      householdMembers: freezed == householdMembers
          ? _value.householdMembers
          : householdMembers // ignore: cast_nullable_to_non_nullable
              as List<HouseholdMember>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseholdDataImplCopyWith<$Res>
    implements $HouseholdDataCopyWith<$Res> {
  factory _$$HouseholdDataImplCopyWith(
          _$HouseholdDataImpl value, $Res Function(_$HouseholdDataImpl) then) =
      __$$HouseholdDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'household') List<HouseholdMember>? householdMembers});
}

/// @nodoc
class __$$HouseholdDataImplCopyWithImpl<$Res>
    extends _$HouseholdDataCopyWithImpl<$Res, _$HouseholdDataImpl>
    implements _$$HouseholdDataImplCopyWith<$Res> {
  __$$HouseholdDataImplCopyWithImpl(
      _$HouseholdDataImpl _value, $Res Function(_$HouseholdDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HouseholdData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? householdMembers = freezed,
  }) {
    return _then(_$HouseholdDataImpl(
      householdMembers: freezed == householdMembers
          ? _value._householdMembers
          : householdMembers // ignore: cast_nullable_to_non_nullable
              as List<HouseholdMember>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$HouseholdDataImpl implements _HouseholdData {
  const _$HouseholdDataImpl(
      {@JsonKey(name: 'household')
      final List<HouseholdMember>? householdMembers})
      : _householdMembers = householdMembers;

  factory _$HouseholdDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseholdDataImplFromJson(json);

  final List<HouseholdMember>? _householdMembers;
  @override
  @JsonKey(name: 'household')
  List<HouseholdMember>? get householdMembers {
    final value = _householdMembers;
    if (value == null) return null;
    if (_householdMembers is EqualUnmodifiableListView)
      return _householdMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HouseholdData(householdMembers: $householdMembers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdDataImpl &&
            const DeepCollectionEquality()
                .equals(other._householdMembers, _householdMembers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_householdMembers));

  /// Create a copy of HouseholdData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdDataImplCopyWith<_$HouseholdDataImpl> get copyWith =>
      __$$HouseholdDataImplCopyWithImpl<_$HouseholdDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseholdDataImplToJson(
      this,
    );
  }
}

abstract class _HouseholdData implements HouseholdData {
  const factory _HouseholdData(
      {@JsonKey(name: 'household')
      final List<HouseholdMember>? householdMembers}) = _$HouseholdDataImpl;

  factory _HouseholdData.fromJson(Map<String, dynamic> json) =
      _$HouseholdDataImpl.fromJson;

  @override
  @JsonKey(name: 'household')
  List<HouseholdMember>? get householdMembers;

  /// Create a copy of HouseholdData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseholdDataImplCopyWith<_$HouseholdDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
