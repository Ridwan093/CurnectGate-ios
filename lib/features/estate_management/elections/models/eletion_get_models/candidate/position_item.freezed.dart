// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'position_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PositionItem _$PositionItemFromJson(Map<String, dynamic> json) {
  return _PositionItem.fromJson(json);
}

/// @nodoc
mixin _$PositionItem {
  int? get positionId => throw _privateConstructorUsedError;
  String? get positionTitle => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  List<CandidateItem>? get candidates => throw _privateConstructorUsedError;

  /// Serializes this PositionItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PositionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PositionItemCopyWith<PositionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionItemCopyWith<$Res> {
  factory $PositionItemCopyWith(
          PositionItem value, $Res Function(PositionItem) then) =
      _$PositionItemCopyWithImpl<$Res, PositionItem>;
  @useResult
  $Res call(
      {int? positionId,
      String? positionTitle,
      String? color,
      List<CandidateItem>? candidates});
}

/// @nodoc
class _$PositionItemCopyWithImpl<$Res, $Val extends PositionItem>
    implements $PositionItemCopyWith<$Res> {
  _$PositionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PositionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positionId = freezed,
    Object? positionTitle = freezed,
    Object? color = freezed,
    Object? candidates = freezed,
  }) {
    return _then(_value.copyWith(
      positionId: freezed == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int?,
      positionTitle: freezed == positionTitle
          ? _value.positionTitle
          : positionTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      candidates: freezed == candidates
          ? _value.candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<CandidateItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionItemImplCopyWith<$Res>
    implements $PositionItemCopyWith<$Res> {
  factory _$$PositionItemImplCopyWith(
          _$PositionItemImpl value, $Res Function(_$PositionItemImpl) then) =
      __$$PositionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? positionId,
      String? positionTitle,
      String? color,
      List<CandidateItem>? candidates});
}

/// @nodoc
class __$$PositionItemImplCopyWithImpl<$Res>
    extends _$PositionItemCopyWithImpl<$Res, _$PositionItemImpl>
    implements _$$PositionItemImplCopyWith<$Res> {
  __$$PositionItemImplCopyWithImpl(
      _$PositionItemImpl _value, $Res Function(_$PositionItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of PositionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positionId = freezed,
    Object? positionTitle = freezed,
    Object? color = freezed,
    Object? candidates = freezed,
  }) {
    return _then(_$PositionItemImpl(
      positionId: freezed == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int?,
      positionTitle: freezed == positionTitle
          ? _value.positionTitle
          : positionTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      candidates: freezed == candidates
          ? _value._candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<CandidateItem>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PositionItemImpl implements _PositionItem {
  const _$PositionItemImpl(
      {this.positionId,
      this.positionTitle,
      this.color,
      final List<CandidateItem>? candidates})
      : _candidates = candidates;

  factory _$PositionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionItemImplFromJson(json);

  @override
  final int? positionId;
  @override
  final String? positionTitle;
  @override
  final String? color;
  final List<CandidateItem>? _candidates;
  @override
  List<CandidateItem>? get candidates {
    final value = _candidates;
    if (value == null) return null;
    if (_candidates is EqualUnmodifiableListView) return _candidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PositionItem(positionId: $positionId, positionTitle: $positionTitle, color: $color, candidates: $candidates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionItemImpl &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            (identical(other.positionTitle, positionTitle) ||
                other.positionTitle == positionTitle) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality()
                .equals(other._candidates, _candidates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, positionId, positionTitle, color,
      const DeepCollectionEquality().hash(_candidates));

  /// Create a copy of PositionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionItemImplCopyWith<_$PositionItemImpl> get copyWith =>
      __$$PositionItemImplCopyWithImpl<_$PositionItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionItemImplToJson(
      this,
    );
  }
}

abstract class _PositionItem implements PositionItem {
  const factory _PositionItem(
      {final int? positionId,
      final String? positionTitle,
      final String? color,
      final List<CandidateItem>? candidates}) = _$PositionItemImpl;

  factory _PositionItem.fromJson(Map<String, dynamic> json) =
      _$PositionItemImpl.fromJson;

  @override
  int? get positionId;
  @override
  String? get positionTitle;
  @override
  String? get color;
  @override
  List<CandidateItem>? get candidates;

  /// Create a copy of PositionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PositionItemImplCopyWith<_$PositionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
