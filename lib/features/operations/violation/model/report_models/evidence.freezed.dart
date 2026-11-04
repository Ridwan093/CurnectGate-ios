// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evidence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Evidence _$EvidenceFromJson(Map<String, dynamic> json) {
  return _Evidence.fromJson(json);
}

/// @nodoc
mixin _$Evidence {
  @JsonKey(name: 'media_urls')
  List<String> get mediaUrls => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_count')
  int get mediaCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_evidence')
  bool get hasEvidence => throw _privateConstructorUsedError;

  /// Serializes this Evidence to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Evidence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EvidenceCopyWith<Evidence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvidenceCopyWith<$Res> {
  factory $EvidenceCopyWith(Evidence value, $Res Function(Evidence) then) =
      _$EvidenceCopyWithImpl<$Res, Evidence>;
  @useResult
  $Res call(
      {@JsonKey(name: 'media_urls') List<String> mediaUrls,
      @JsonKey(name: 'media_count') int mediaCount,
      @JsonKey(name: 'has_evidence') bool hasEvidence});
}

/// @nodoc
class _$EvidenceCopyWithImpl<$Res, $Val extends Evidence>
    implements $EvidenceCopyWith<$Res> {
  _$EvidenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Evidence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaUrls = null,
    Object? mediaCount = null,
    Object? hasEvidence = null,
  }) {
    return _then(_value.copyWith(
      mediaUrls: null == mediaUrls
          ? _value.mediaUrls
          : mediaUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mediaCount: null == mediaCount
          ? _value.mediaCount
          : mediaCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasEvidence: null == hasEvidence
          ? _value.hasEvidence
          : hasEvidence // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EvidenceImplCopyWith<$Res>
    implements $EvidenceCopyWith<$Res> {
  factory _$$EvidenceImplCopyWith(
          _$EvidenceImpl value, $Res Function(_$EvidenceImpl) then) =
      __$$EvidenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'media_urls') List<String> mediaUrls,
      @JsonKey(name: 'media_count') int mediaCount,
      @JsonKey(name: 'has_evidence') bool hasEvidence});
}

/// @nodoc
class __$$EvidenceImplCopyWithImpl<$Res>
    extends _$EvidenceCopyWithImpl<$Res, _$EvidenceImpl>
    implements _$$EvidenceImplCopyWith<$Res> {
  __$$EvidenceImplCopyWithImpl(
      _$EvidenceImpl _value, $Res Function(_$EvidenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Evidence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaUrls = null,
    Object? mediaCount = null,
    Object? hasEvidence = null,
  }) {
    return _then(_$EvidenceImpl(
      mediaUrls: null == mediaUrls
          ? _value._mediaUrls
          : mediaUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mediaCount: null == mediaCount
          ? _value.mediaCount
          : mediaCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasEvidence: null == hasEvidence
          ? _value.hasEvidence
          : hasEvidence // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EvidenceImpl implements _Evidence {
  const _$EvidenceImpl(
      {@JsonKey(name: 'media_urls') final List<String> mediaUrls = const [],
      @JsonKey(name: 'media_count') this.mediaCount = 0,
      @JsonKey(name: 'has_evidence') this.hasEvidence = false})
      : _mediaUrls = mediaUrls;

  factory _$EvidenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$EvidenceImplFromJson(json);

  final List<String> _mediaUrls;
  @override
  @JsonKey(name: 'media_urls')
  List<String> get mediaUrls {
    if (_mediaUrls is EqualUnmodifiableListView) return _mediaUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaUrls);
  }

  @override
  @JsonKey(name: 'media_count')
  final int mediaCount;
  @override
  @JsonKey(name: 'has_evidence')
  final bool hasEvidence;

  @override
  String toString() {
    return 'Evidence(mediaUrls: $mediaUrls, mediaCount: $mediaCount, hasEvidence: $hasEvidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvidenceImpl &&
            const DeepCollectionEquality()
                .equals(other._mediaUrls, _mediaUrls) &&
            (identical(other.mediaCount, mediaCount) ||
                other.mediaCount == mediaCount) &&
            (identical(other.hasEvidence, hasEvidence) ||
                other.hasEvidence == hasEvidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_mediaUrls), mediaCount, hasEvidence);

  /// Create a copy of Evidence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EvidenceImplCopyWith<_$EvidenceImpl> get copyWith =>
      __$$EvidenceImplCopyWithImpl<_$EvidenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EvidenceImplToJson(
      this,
    );
  }
}

abstract class _Evidence implements Evidence {
  const factory _Evidence(
      {@JsonKey(name: 'media_urls') final List<String> mediaUrls,
      @JsonKey(name: 'media_count') final int mediaCount,
      @JsonKey(name: 'has_evidence') final bool hasEvidence}) = _$EvidenceImpl;

  factory _Evidence.fromJson(Map<String, dynamic> json) =
      _$EvidenceImpl.fromJson;

  @override
  @JsonKey(name: 'media_urls')
  List<String> get mediaUrls;
  @override
  @JsonKey(name: 'media_count')
  int get mediaCount;
  @override
  @JsonKey(name: 'has_evidence')
  bool get hasEvidence;

  /// Create a copy of Evidence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EvidenceImplCopyWith<_$EvidenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
