// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PollData _$PollDataFromJson(Map<String, dynamic> json) {
  return _PollData.fromJson(json);
}

/// @nodoc
mixin _$PollData {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get opensAt => throw _privateConstructorUsedError;
  String? get closesAt => throw _privateConstructorUsedError;
  bool? get isAnonymous => throw _privateConstructorUsedError;

  /// Serializes this PollData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PollData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollDataCopyWith<PollData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollDataCopyWith<$Res> {
  factory $PollDataCopyWith(PollData value, $Res Function(PollData) then) =
      _$PollDataCopyWithImpl<$Res, PollData>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      String? type,
      String? status,
      String? opensAt,
      String? closesAt,
      bool? isAnonymous});
}

/// @nodoc
class _$PollDataCopyWithImpl<$Res, $Val extends PollData>
    implements $PollDataCopyWith<$Res> {
  _$PollDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PollData
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollDataImplCopyWith<$Res>
    implements $PollDataCopyWith<$Res> {
  factory _$$PollDataImplCopyWith(
          _$PollDataImpl value, $Res Function(_$PollDataImpl) then) =
      __$$PollDataImplCopyWithImpl<$Res>;
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
      bool? isAnonymous});
}

/// @nodoc
class __$$PollDataImplCopyWithImpl<$Res>
    extends _$PollDataCopyWithImpl<$Res, _$PollDataImpl>
    implements _$$PollDataImplCopyWith<$Res> {
  __$$PollDataImplCopyWithImpl(
      _$PollDataImpl _value, $Res Function(_$PollDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PollData
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
  }) {
    return _then(_$PollDataImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PollDataImpl implements _PollData {
  const _$PollDataImpl(
      {this.id,
      this.title,
      this.description,
      this.type,
      this.status,
      this.opensAt,
      this.closesAt,
      this.isAnonymous});

  factory _$PollDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollDataImplFromJson(json);

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
  String toString() {
    return 'PollData(id: $id, title: $title, description: $description, type: $type, status: $status, opensAt: $opensAt, closesAt: $closesAt, isAnonymous: $isAnonymous)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollDataImpl &&
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
                other.isAnonymous == isAnonymous));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, type,
      status, opensAt, closesAt, isAnonymous);

  /// Create a copy of PollData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollDataImplCopyWith<_$PollDataImpl> get copyWith =>
      __$$PollDataImplCopyWithImpl<_$PollDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollDataImplToJson(
      this,
    );
  }
}

abstract class _PollData implements PollData {
  const factory _PollData(
      {final int? id,
      final String? title,
      final String? description,
      final String? type,
      final String? status,
      final String? opensAt,
      final String? closesAt,
      final bool? isAnonymous}) = _$PollDataImpl;

  factory _PollData.fromJson(Map<String, dynamic> json) =
      _$PollDataImpl.fromJson;

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

  /// Create a copy of PollData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollDataImplCopyWith<_$PollDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
