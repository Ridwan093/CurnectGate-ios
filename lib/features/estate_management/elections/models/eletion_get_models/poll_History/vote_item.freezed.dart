// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VoteItem _$VoteItemFromJson(Map<String, dynamic> json) {
  return _VoteItem.fromJson(json);
}

/// @nodoc
mixin _$VoteItem {
  String? get positionTitle => throw _privateConstructorUsedError;
  List<CandidateItem>? get candidates => throw _privateConstructorUsedError;

  /// Serializes this VoteItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoteItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoteItemCopyWith<VoteItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoteItemCopyWith<$Res> {
  factory $VoteItemCopyWith(VoteItem value, $Res Function(VoteItem) then) =
      _$VoteItemCopyWithImpl<$Res, VoteItem>;
  @useResult
  $Res call({String? positionTitle, List<CandidateItem>? candidates});
}

/// @nodoc
class _$VoteItemCopyWithImpl<$Res, $Val extends VoteItem>
    implements $VoteItemCopyWith<$Res> {
  _$VoteItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoteItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positionTitle = freezed,
    Object? candidates = freezed,
  }) {
    return _then(_value.copyWith(
      positionTitle: freezed == positionTitle
          ? _value.positionTitle
          : positionTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      candidates: freezed == candidates
          ? _value.candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<CandidateItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoteItemImplCopyWith<$Res>
    implements $VoteItemCopyWith<$Res> {
  factory _$$VoteItemImplCopyWith(
          _$VoteItemImpl value, $Res Function(_$VoteItemImpl) then) =
      __$$VoteItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? positionTitle, List<CandidateItem>? candidates});
}

/// @nodoc
class __$$VoteItemImplCopyWithImpl<$Res>
    extends _$VoteItemCopyWithImpl<$Res, _$VoteItemImpl>
    implements _$$VoteItemImplCopyWith<$Res> {
  __$$VoteItemImplCopyWithImpl(
      _$VoteItemImpl _value, $Res Function(_$VoteItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoteItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positionTitle = freezed,
    Object? candidates = freezed,
  }) {
    return _then(_$VoteItemImpl(
      positionTitle: freezed == positionTitle
          ? _value.positionTitle
          : positionTitle // ignore: cast_nullable_to_non_nullable
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
class _$VoteItemImpl implements _VoteItem {
  const _$VoteItemImpl(
      {this.positionTitle, final List<CandidateItem>? candidates})
      : _candidates = candidates;

  factory _$VoteItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoteItemImplFromJson(json);

  @override
  final String? positionTitle;
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
    return 'VoteItem(positionTitle: $positionTitle, candidates: $candidates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoteItemImpl &&
            (identical(other.positionTitle, positionTitle) ||
                other.positionTitle == positionTitle) &&
            const DeepCollectionEquality()
                .equals(other._candidates, _candidates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, positionTitle,
      const DeepCollectionEquality().hash(_candidates));

  /// Create a copy of VoteItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoteItemImplCopyWith<_$VoteItemImpl> get copyWith =>
      __$$VoteItemImplCopyWithImpl<_$VoteItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoteItemImplToJson(
      this,
    );
  }
}

abstract class _VoteItem implements VoteItem {
  const factory _VoteItem(
      {final String? positionTitle,
      final List<CandidateItem>? candidates}) = _$VoteItemImpl;

  factory _VoteItem.fromJson(Map<String, dynamic> json) =
      _$VoteItemImpl.fromJson;

  @override
  String? get positionTitle;
  @override
  List<CandidateItem>? get candidates;

  /// Create a copy of VoteItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoteItemImplCopyWith<_$VoteItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
