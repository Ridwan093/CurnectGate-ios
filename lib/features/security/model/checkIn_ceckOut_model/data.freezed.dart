// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataPayload _$DataPayloadFromJson(Map<String, dynamic> json) {
  return _DataPayload.fromJson(json);
}

/// @nodoc
mixin _$DataPayload {
  List<VisitorModel>? get visitors => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;
  bool? get showingMyVisitorsOnly => throw _privateConstructorUsedError;

  /// Serializes this DataPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataPayloadCopyWith<DataPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataPayloadCopyWith<$Res> {
  factory $DataPayloadCopyWith(
          DataPayload value, $Res Function(DataPayload) then) =
      _$DataPayloadCopyWithImpl<$Res, DataPayload>;
  @useResult
  $Res call(
      {List<VisitorModel>? visitors,
      int? count,
      int? estateId,
      bool? showingMyVisitorsOnly});
}

/// @nodoc
class _$DataPayloadCopyWithImpl<$Res, $Val extends DataPayload>
    implements $DataPayloadCopyWith<$Res> {
  _$DataPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitors = freezed,
    Object? count = freezed,
    Object? estateId = freezed,
    Object? showingMyVisitorsOnly = freezed,
  }) {
    return _then(_value.copyWith(
      visitors: freezed == visitors
          ? _value.visitors
          : visitors // ignore: cast_nullable_to_non_nullable
              as List<VisitorModel>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      showingMyVisitorsOnly: freezed == showingMyVisitorsOnly
          ? _value.showingMyVisitorsOnly
          : showingMyVisitorsOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataPayloadImplCopyWith<$Res>
    implements $DataPayloadCopyWith<$Res> {
  factory _$$DataPayloadImplCopyWith(
          _$DataPayloadImpl value, $Res Function(_$DataPayloadImpl) then) =
      __$$DataPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<VisitorModel>? visitors,
      int? count,
      int? estateId,
      bool? showingMyVisitorsOnly});
}

/// @nodoc
class __$$DataPayloadImplCopyWithImpl<$Res>
    extends _$DataPayloadCopyWithImpl<$Res, _$DataPayloadImpl>
    implements _$$DataPayloadImplCopyWith<$Res> {
  __$$DataPayloadImplCopyWithImpl(
      _$DataPayloadImpl _value, $Res Function(_$DataPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? visitors = freezed,
    Object? count = freezed,
    Object? estateId = freezed,
    Object? showingMyVisitorsOnly = freezed,
  }) {
    return _then(_$DataPayloadImpl(
      visitors: freezed == visitors
          ? _value._visitors
          : visitors // ignore: cast_nullable_to_non_nullable
              as List<VisitorModel>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      showingMyVisitorsOnly: freezed == showingMyVisitorsOnly
          ? _value.showingMyVisitorsOnly
          : showingMyVisitorsOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataPayloadImpl implements _DataPayload {
  const _$DataPayloadImpl(
      {final List<VisitorModel>? visitors,
      this.count,
      this.estateId,
      this.showingMyVisitorsOnly})
      : _visitors = visitors;

  factory _$DataPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataPayloadImplFromJson(json);

  final List<VisitorModel>? _visitors;
  @override
  List<VisitorModel>? get visitors {
    final value = _visitors;
    if (value == null) return null;
    if (_visitors is EqualUnmodifiableListView) return _visitors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? count;
  @override
  final int? estateId;
  @override
  final bool? showingMyVisitorsOnly;

  @override
  String toString() {
    return 'DataPayload(visitors: $visitors, count: $count, estateId: $estateId, showingMyVisitorsOnly: $showingMyVisitorsOnly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataPayloadImpl &&
            const DeepCollectionEquality().equals(other._visitors, _visitors) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.showingMyVisitorsOnly, showingMyVisitorsOnly) ||
                other.showingMyVisitorsOnly == showingMyVisitorsOnly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_visitors),
      count,
      estateId,
      showingMyVisitorsOnly);

  /// Create a copy of DataPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataPayloadImplCopyWith<_$DataPayloadImpl> get copyWith =>
      __$$DataPayloadImplCopyWithImpl<_$DataPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataPayloadImplToJson(
      this,
    );
  }
}

abstract class _DataPayload implements DataPayload {
  const factory _DataPayload(
      {final List<VisitorModel>? visitors,
      final int? count,
      final int? estateId,
      final bool? showingMyVisitorsOnly}) = _$DataPayloadImpl;

  factory _DataPayload.fromJson(Map<String, dynamic> json) =
      _$DataPayloadImpl.fromJson;

  @override
  List<VisitorModel>? get visitors;
  @override
  int? get count;
  @override
  int? get estateId;
  @override
  bool? get showingMyVisitorsOnly;

  /// Create a copy of DataPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataPayloadImplCopyWith<_$DataPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
