// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candidate_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CandidateDetails _$CandidateDetailsFromJson(Map<String, dynamic> json) {
  return _CandidateDetails.fromJson(json);
}

/// @nodoc
mixin _$CandidateDetails {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get partyAffiliation => throw _privateConstructorUsedError;
  String? get mediaUrl => throw _privateConstructorUsedError;
  int? get candidateOrder => throw _privateConstructorUsedError;

  /// Serializes this CandidateDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CandidateDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CandidateDetailsCopyWith<CandidateDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateDetailsCopyWith<$Res> {
  factory $CandidateDetailsCopyWith(
          CandidateDetails value, $Res Function(CandidateDetails) then) =
      _$CandidateDetailsCopyWithImpl<$Res, CandidateDetails>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? bio,
      String? partyAffiliation,
      String? mediaUrl,
      int? candidateOrder});
}

/// @nodoc
class _$CandidateDetailsCopyWithImpl<$Res, $Val extends CandidateDetails>
    implements $CandidateDetailsCopyWith<$Res> {
  _$CandidateDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CandidateDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? bio = freezed,
    Object? partyAffiliation = freezed,
    Object? mediaUrl = freezed,
    Object? candidateOrder = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      partyAffiliation: freezed == partyAffiliation
          ? _value.partyAffiliation
          : partyAffiliation // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      candidateOrder: freezed == candidateOrder
          ? _value.candidateOrder
          : candidateOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CandidateDetailsImplCopyWith<$Res>
    implements $CandidateDetailsCopyWith<$Res> {
  factory _$$CandidateDetailsImplCopyWith(_$CandidateDetailsImpl value,
          $Res Function(_$CandidateDetailsImpl) then) =
      __$$CandidateDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? bio,
      String? partyAffiliation,
      String? mediaUrl,
      int? candidateOrder});
}

/// @nodoc
class __$$CandidateDetailsImplCopyWithImpl<$Res>
    extends _$CandidateDetailsCopyWithImpl<$Res, _$CandidateDetailsImpl>
    implements _$$CandidateDetailsImplCopyWith<$Res> {
  __$$CandidateDetailsImplCopyWithImpl(_$CandidateDetailsImpl _value,
      $Res Function(_$CandidateDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CandidateDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? bio = freezed,
    Object? partyAffiliation = freezed,
    Object? mediaUrl = freezed,
    Object? candidateOrder = freezed,
  }) {
    return _then(_$CandidateDetailsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      partyAffiliation: freezed == partyAffiliation
          ? _value.partyAffiliation
          : partyAffiliation // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      candidateOrder: freezed == candidateOrder
          ? _value.candidateOrder
          : candidateOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CandidateDetailsImpl implements _CandidateDetails {
  const _$CandidateDetailsImpl(
      {this.id,
      this.name,
      this.bio,
      this.partyAffiliation,
      this.mediaUrl,
      this.candidateOrder});

  factory _$CandidateDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CandidateDetailsImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? bio;
  @override
  final String? partyAffiliation;
  @override
  final String? mediaUrl;
  @override
  final int? candidateOrder;

  @override
  String toString() {
    return 'CandidateDetails(id: $id, name: $name, bio: $bio, partyAffiliation: $partyAffiliation, mediaUrl: $mediaUrl, candidateOrder: $candidateOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.partyAffiliation, partyAffiliation) ||
                other.partyAffiliation == partyAffiliation) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.candidateOrder, candidateOrder) ||
                other.candidateOrder == candidateOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, bio, partyAffiliation, mediaUrl, candidateOrder);

  /// Create a copy of CandidateDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CandidateDetailsImplCopyWith<_$CandidateDetailsImpl> get copyWith =>
      __$$CandidateDetailsImplCopyWithImpl<_$CandidateDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CandidateDetailsImplToJson(
      this,
    );
  }
}

abstract class _CandidateDetails implements CandidateDetails {
  const factory _CandidateDetails(
      {final int? id,
      final String? name,
      final String? bio,
      final String? partyAffiliation,
      final String? mediaUrl,
      final int? candidateOrder}) = _$CandidateDetailsImpl;

  factory _CandidateDetails.fromJson(Map<String, dynamic> json) =
      _$CandidateDetailsImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get bio;
  @override
  String? get partyAffiliation;
  @override
  String? get mediaUrl;
  @override
  int? get candidateOrder;

  /// Create a copy of CandidateDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CandidateDetailsImplCopyWith<_$CandidateDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
