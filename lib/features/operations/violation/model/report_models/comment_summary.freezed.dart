// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentSummary _$CommentSummaryFromJson(Map<String, dynamic> json) {
  return _CommentSummary.fromJson(json);
}

/// @nodoc
mixin _$CommentSummary {
  int get totalComments => throw _privateConstructorUsedError;
  int get publicComments => throw _privateConstructorUsedError;
  int get internalComments => throw _privateConstructorUsedError;
  LatestComment? get latestComment => throw _privateConstructorUsedError;

  /// Serializes this CommentSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentSummaryCopyWith<CommentSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentSummaryCopyWith<$Res> {
  factory $CommentSummaryCopyWith(
          CommentSummary value, $Res Function(CommentSummary) then) =
      _$CommentSummaryCopyWithImpl<$Res, CommentSummary>;
  @useResult
  $Res call(
      {int totalComments,
      int publicComments,
      int internalComments,
      LatestComment? latestComment});

  $LatestCommentCopyWith<$Res>? get latestComment;
}

/// @nodoc
class _$CommentSummaryCopyWithImpl<$Res, $Val extends CommentSummary>
    implements $CommentSummaryCopyWith<$Res> {
  _$CommentSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalComments = null,
    Object? publicComments = null,
    Object? internalComments = null,
    Object? latestComment = freezed,
  }) {
    return _then(_value.copyWith(
      totalComments: null == totalComments
          ? _value.totalComments
          : totalComments // ignore: cast_nullable_to_non_nullable
              as int,
      publicComments: null == publicComments
          ? _value.publicComments
          : publicComments // ignore: cast_nullable_to_non_nullable
              as int,
      internalComments: null == internalComments
          ? _value.internalComments
          : internalComments // ignore: cast_nullable_to_non_nullable
              as int,
      latestComment: freezed == latestComment
          ? _value.latestComment
          : latestComment // ignore: cast_nullable_to_non_nullable
              as LatestComment?,
    ) as $Val);
  }

  /// Create a copy of CommentSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LatestCommentCopyWith<$Res>? get latestComment {
    if (_value.latestComment == null) {
      return null;
    }

    return $LatestCommentCopyWith<$Res>(_value.latestComment!, (value) {
      return _then(_value.copyWith(latestComment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentSummaryImplCopyWith<$Res>
    implements $CommentSummaryCopyWith<$Res> {
  factory _$$CommentSummaryImplCopyWith(_$CommentSummaryImpl value,
          $Res Function(_$CommentSummaryImpl) then) =
      __$$CommentSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalComments,
      int publicComments,
      int internalComments,
      LatestComment? latestComment});

  @override
  $LatestCommentCopyWith<$Res>? get latestComment;
}

/// @nodoc
class __$$CommentSummaryImplCopyWithImpl<$Res>
    extends _$CommentSummaryCopyWithImpl<$Res, _$CommentSummaryImpl>
    implements _$$CommentSummaryImplCopyWith<$Res> {
  __$$CommentSummaryImplCopyWithImpl(
      _$CommentSummaryImpl _value, $Res Function(_$CommentSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalComments = null,
    Object? publicComments = null,
    Object? internalComments = null,
    Object? latestComment = freezed,
  }) {
    return _then(_$CommentSummaryImpl(
      totalComments: null == totalComments
          ? _value.totalComments
          : totalComments // ignore: cast_nullable_to_non_nullable
              as int,
      publicComments: null == publicComments
          ? _value.publicComments
          : publicComments // ignore: cast_nullable_to_non_nullable
              as int,
      internalComments: null == internalComments
          ? _value.internalComments
          : internalComments // ignore: cast_nullable_to_non_nullable
              as int,
      latestComment: freezed == latestComment
          ? _value.latestComment
          : latestComment // ignore: cast_nullable_to_non_nullable
              as LatestComment?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CommentSummaryImpl implements _CommentSummary {
  const _$CommentSummaryImpl(
      {this.totalComments = 0,
      this.publicComments = 0,
      this.internalComments = 0,
      this.latestComment});

  factory _$CommentSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentSummaryImplFromJson(json);

  @override
  @JsonKey()
  final int totalComments;
  @override
  @JsonKey()
  final int publicComments;
  @override
  @JsonKey()
  final int internalComments;
  @override
  final LatestComment? latestComment;

  @override
  String toString() {
    return 'CommentSummary(totalComments: $totalComments, publicComments: $publicComments, internalComments: $internalComments, latestComment: $latestComment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentSummaryImpl &&
            (identical(other.totalComments, totalComments) ||
                other.totalComments == totalComments) &&
            (identical(other.publicComments, publicComments) ||
                other.publicComments == publicComments) &&
            (identical(other.internalComments, internalComments) ||
                other.internalComments == internalComments) &&
            (identical(other.latestComment, latestComment) ||
                other.latestComment == latestComment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalComments, publicComments,
      internalComments, latestComment);

  /// Create a copy of CommentSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentSummaryImplCopyWith<_$CommentSummaryImpl> get copyWith =>
      __$$CommentSummaryImplCopyWithImpl<_$CommentSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentSummaryImplToJson(
      this,
    );
  }
}

abstract class _CommentSummary implements CommentSummary {
  const factory _CommentSummary(
      {final int totalComments,
      final int publicComments,
      final int internalComments,
      final LatestComment? latestComment}) = _$CommentSummaryImpl;

  factory _CommentSummary.fromJson(Map<String, dynamic> json) =
      _$CommentSummaryImpl.fromJson;

  @override
  int get totalComments;
  @override
  int get publicComments;
  @override
  int get internalComments;
  @override
  LatestComment? get latestComment;

  /// Create a copy of CommentSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentSummaryImplCopyWith<_$CommentSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
