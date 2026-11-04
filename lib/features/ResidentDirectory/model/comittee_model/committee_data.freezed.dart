// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'committee_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommitteesData _$CommitteesDataFromJson(Map<String, dynamic> json) {
  return _CommitteesData.fromJson(json);
}

/// @nodoc
mixin _$CommitteesData {
  CommitteeList? get committees => throw _privateConstructorUsedError;

  /// Serializes this CommitteesData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommitteesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommitteesDataCopyWith<CommitteesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommitteesDataCopyWith<$Res> {
  factory $CommitteesDataCopyWith(
          CommitteesData value, $Res Function(CommitteesData) then) =
      _$CommitteesDataCopyWithImpl<$Res, CommitteesData>;
  @useResult
  $Res call({CommitteeList? committees});

  $CommitteeListCopyWith<$Res>? get committees;
}

/// @nodoc
class _$CommitteesDataCopyWithImpl<$Res, $Val extends CommitteesData>
    implements $CommitteesDataCopyWith<$Res> {
  _$CommitteesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommitteesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? committees = freezed,
  }) {
    return _then(_value.copyWith(
      committees: freezed == committees
          ? _value.committees
          : committees // ignore: cast_nullable_to_non_nullable
              as CommitteeList?,
    ) as $Val);
  }

  /// Create a copy of CommitteesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommitteeListCopyWith<$Res>? get committees {
    if (_value.committees == null) {
      return null;
    }

    return $CommitteeListCopyWith<$Res>(_value.committees!, (value) {
      return _then(_value.copyWith(committees: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommitteesDataImplCopyWith<$Res>
    implements $CommitteesDataCopyWith<$Res> {
  factory _$$CommitteesDataImplCopyWith(_$CommitteesDataImpl value,
          $Res Function(_$CommitteesDataImpl) then) =
      __$$CommitteesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CommitteeList? committees});

  @override
  $CommitteeListCopyWith<$Res>? get committees;
}

/// @nodoc
class __$$CommitteesDataImplCopyWithImpl<$Res>
    extends _$CommitteesDataCopyWithImpl<$Res, _$CommitteesDataImpl>
    implements _$$CommitteesDataImplCopyWith<$Res> {
  __$$CommitteesDataImplCopyWithImpl(
      _$CommitteesDataImpl _value, $Res Function(_$CommitteesDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommitteesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? committees = freezed,
  }) {
    return _then(_$CommitteesDataImpl(
      committees: freezed == committees
          ? _value.committees
          : committees // ignore: cast_nullable_to_non_nullable
              as CommitteeList?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CommitteesDataImpl implements _CommitteesData {
  const _$CommitteesDataImpl({this.committees});

  factory _$CommitteesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommitteesDataImplFromJson(json);

  @override
  final CommitteeList? committees;

  @override
  String toString() {
    return 'CommitteesData(committees: $committees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommitteesDataImpl &&
            (identical(other.committees, committees) ||
                other.committees == committees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, committees);

  /// Create a copy of CommitteesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommitteesDataImplCopyWith<_$CommitteesDataImpl> get copyWith =>
      __$$CommitteesDataImplCopyWithImpl<_$CommitteesDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommitteesDataImplToJson(
      this,
    );
  }
}

abstract class _CommitteesData implements CommitteesData {
  const factory _CommitteesData({final CommitteeList? committees}) =
      _$CommitteesDataImpl;

  factory _CommitteesData.fromJson(Map<String, dynamic> json) =
      _$CommitteesDataImpl.fromJson;

  @override
  CommitteeList? get committees;

  /// Create a copy of CommitteesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommitteesDataImplCopyWith<_$CommitteesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
