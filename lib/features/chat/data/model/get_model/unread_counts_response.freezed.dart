// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unread_counts_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UnreadCountsResponse _$UnreadCountsResponseFromJson(Map<String, dynamic> json) {
  return _UnreadCountsResponse.fromJson(json);
}

/// @nodoc
mixin _$UnreadCountsResponse {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  UnreadCountsData? get data => throw _privateConstructorUsedError;

  /// Serializes this UnreadCountsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnreadCountsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnreadCountsResponseCopyWith<UnreadCountsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnreadCountsResponseCopyWith<$Res> {
  factory $UnreadCountsResponseCopyWith(UnreadCountsResponse value,
          $Res Function(UnreadCountsResponse) then) =
      _$UnreadCountsResponseCopyWithImpl<$Res, UnreadCountsResponse>;
  @useResult
  $Res call({bool? success, String? message, UnreadCountsData? data});

  $UnreadCountsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$UnreadCountsResponseCopyWithImpl<$Res,
        $Val extends UnreadCountsResponse>
    implements $UnreadCountsResponseCopyWith<$Res> {
  _$UnreadCountsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnreadCountsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UnreadCountsData?,
    ) as $Val);
  }

  /// Create a copy of UnreadCountsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UnreadCountsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UnreadCountsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UnreadCountsResponseImplCopyWith<$Res>
    implements $UnreadCountsResponseCopyWith<$Res> {
  factory _$$UnreadCountsResponseImplCopyWith(_$UnreadCountsResponseImpl value,
          $Res Function(_$UnreadCountsResponseImpl) then) =
      __$$UnreadCountsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, UnreadCountsData? data});

  @override
  $UnreadCountsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$UnreadCountsResponseImplCopyWithImpl<$Res>
    extends _$UnreadCountsResponseCopyWithImpl<$Res, _$UnreadCountsResponseImpl>
    implements _$$UnreadCountsResponseImplCopyWith<$Res> {
  __$$UnreadCountsResponseImplCopyWithImpl(_$UnreadCountsResponseImpl _value,
      $Res Function(_$UnreadCountsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnreadCountsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$UnreadCountsResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UnreadCountsData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$UnreadCountsResponseImpl implements _UnreadCountsResponse {
  const _$UnreadCountsResponseImpl({this.success, this.message, this.data});

  factory _$UnreadCountsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnreadCountsResponseImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  @override
  final UnreadCountsData? data;

  @override
  String toString() {
    return 'UnreadCountsResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnreadCountsResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of UnreadCountsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnreadCountsResponseImplCopyWith<_$UnreadCountsResponseImpl>
      get copyWith =>
          __$$UnreadCountsResponseImplCopyWithImpl<_$UnreadCountsResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnreadCountsResponseImplToJson(
      this,
    );
  }
}

abstract class _UnreadCountsResponse implements UnreadCountsResponse {
  const factory _UnreadCountsResponse(
      {final bool? success,
      final String? message,
      final UnreadCountsData? data}) = _$UnreadCountsResponseImpl;

  factory _UnreadCountsResponse.fromJson(Map<String, dynamic> json) =
      _$UnreadCountsResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  UnreadCountsData? get data;

  /// Create a copy of UnreadCountsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnreadCountsResponseImplCopyWith<_$UnreadCountsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UnreadCountsData _$UnreadCountsDataFromJson(Map<String, dynamic> json) {
  return _UnreadCountsData.fromJson(json);
}

/// @nodoc
mixin _$UnreadCountsData {
  int? get totalUnreadMessages => throw _privateConstructorUsedError;
  int? get unreadConversationsCount => throw _privateConstructorUsedError;
  int? get badgeCount => throw _privateConstructorUsedError;
  UnreadByType? get byType => throw _privateConstructorUsedError;

  /// Serializes this UnreadCountsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnreadCountsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnreadCountsDataCopyWith<UnreadCountsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnreadCountsDataCopyWith<$Res> {
  factory $UnreadCountsDataCopyWith(
          UnreadCountsData value, $Res Function(UnreadCountsData) then) =
      _$UnreadCountsDataCopyWithImpl<$Res, UnreadCountsData>;
  @useResult
  $Res call(
      {int? totalUnreadMessages,
      int? unreadConversationsCount,
      int? badgeCount,
      UnreadByType? byType});

  $UnreadByTypeCopyWith<$Res>? get byType;
}

/// @nodoc
class _$UnreadCountsDataCopyWithImpl<$Res, $Val extends UnreadCountsData>
    implements $UnreadCountsDataCopyWith<$Res> {
  _$UnreadCountsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnreadCountsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalUnreadMessages = freezed,
    Object? unreadConversationsCount = freezed,
    Object? badgeCount = freezed,
    Object? byType = freezed,
  }) {
    return _then(_value.copyWith(
      totalUnreadMessages: freezed == totalUnreadMessages
          ? _value.totalUnreadMessages
          : totalUnreadMessages // ignore: cast_nullable_to_non_nullable
              as int?,
      unreadConversationsCount: freezed == unreadConversationsCount
          ? _value.unreadConversationsCount
          : unreadConversationsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      badgeCount: freezed == badgeCount
          ? _value.badgeCount
          : badgeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      byType: freezed == byType
          ? _value.byType
          : byType // ignore: cast_nullable_to_non_nullable
              as UnreadByType?,
    ) as $Val);
  }

  /// Create a copy of UnreadCountsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UnreadByTypeCopyWith<$Res>? get byType {
    if (_value.byType == null) {
      return null;
    }

    return $UnreadByTypeCopyWith<$Res>(_value.byType!, (value) {
      return _then(_value.copyWith(byType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UnreadCountsDataImplCopyWith<$Res>
    implements $UnreadCountsDataCopyWith<$Res> {
  factory _$$UnreadCountsDataImplCopyWith(_$UnreadCountsDataImpl value,
          $Res Function(_$UnreadCountsDataImpl) then) =
      __$$UnreadCountsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? totalUnreadMessages,
      int? unreadConversationsCount,
      int? badgeCount,
      UnreadByType? byType});

  @override
  $UnreadByTypeCopyWith<$Res>? get byType;
}

/// @nodoc
class __$$UnreadCountsDataImplCopyWithImpl<$Res>
    extends _$UnreadCountsDataCopyWithImpl<$Res, _$UnreadCountsDataImpl>
    implements _$$UnreadCountsDataImplCopyWith<$Res> {
  __$$UnreadCountsDataImplCopyWithImpl(_$UnreadCountsDataImpl _value,
      $Res Function(_$UnreadCountsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnreadCountsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalUnreadMessages = freezed,
    Object? unreadConversationsCount = freezed,
    Object? badgeCount = freezed,
    Object? byType = freezed,
  }) {
    return _then(_$UnreadCountsDataImpl(
      totalUnreadMessages: freezed == totalUnreadMessages
          ? _value.totalUnreadMessages
          : totalUnreadMessages // ignore: cast_nullable_to_non_nullable
              as int?,
      unreadConversationsCount: freezed == unreadConversationsCount
          ? _value.unreadConversationsCount
          : unreadConversationsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      badgeCount: freezed == badgeCount
          ? _value.badgeCount
          : badgeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      byType: freezed == byType
          ? _value.byType
          : byType // ignore: cast_nullable_to_non_nullable
              as UnreadByType?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$UnreadCountsDataImpl implements _UnreadCountsData {
  const _$UnreadCountsDataImpl(
      {this.totalUnreadMessages,
      this.unreadConversationsCount,
      this.badgeCount,
      this.byType});

  factory _$UnreadCountsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnreadCountsDataImplFromJson(json);

  @override
  final int? totalUnreadMessages;
  @override
  final int? unreadConversationsCount;
  @override
  final int? badgeCount;
  @override
  final UnreadByType? byType;

  @override
  String toString() {
    return 'UnreadCountsData(totalUnreadMessages: $totalUnreadMessages, unreadConversationsCount: $unreadConversationsCount, badgeCount: $badgeCount, byType: $byType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnreadCountsDataImpl &&
            (identical(other.totalUnreadMessages, totalUnreadMessages) ||
                other.totalUnreadMessages == totalUnreadMessages) &&
            (identical(
                    other.unreadConversationsCount, unreadConversationsCount) ||
                other.unreadConversationsCount == unreadConversationsCount) &&
            (identical(other.badgeCount, badgeCount) ||
                other.badgeCount == badgeCount) &&
            (identical(other.byType, byType) || other.byType == byType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalUnreadMessages,
      unreadConversationsCount, badgeCount, byType);

  /// Create a copy of UnreadCountsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnreadCountsDataImplCopyWith<_$UnreadCountsDataImpl> get copyWith =>
      __$$UnreadCountsDataImplCopyWithImpl<_$UnreadCountsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnreadCountsDataImplToJson(
      this,
    );
  }
}

abstract class _UnreadCountsData implements UnreadCountsData {
  const factory _UnreadCountsData(
      {final int? totalUnreadMessages,
      final int? unreadConversationsCount,
      final int? badgeCount,
      final UnreadByType? byType}) = _$UnreadCountsDataImpl;

  factory _UnreadCountsData.fromJson(Map<String, dynamic> json) =
      _$UnreadCountsDataImpl.fromJson;

  @override
  int? get totalUnreadMessages;
  @override
  int? get unreadConversationsCount;
  @override
  int? get badgeCount;
  @override
  UnreadByType? get byType;

  /// Create a copy of UnreadCountsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnreadCountsDataImplCopyWith<_$UnreadCountsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UnreadByType _$UnreadByTypeFromJson(Map<String, dynamic> json) {
  return _UnreadByType.fromJson(json);
}

/// @nodoc
mixin _$UnreadByType {
  UnreadTypeItem? get admin => throw _privateConstructorUsedError;
  UnreadTypeItem? get committee => throw _privateConstructorUsedError;
  UnreadTypeItem? get board => throw _privateConstructorUsedError;
  UnreadTypeItem? get security => throw _privateConstructorUsedError;

  /// Serializes this UnreadByType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnreadByType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnreadByTypeCopyWith<UnreadByType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnreadByTypeCopyWith<$Res> {
  factory $UnreadByTypeCopyWith(
          UnreadByType value, $Res Function(UnreadByType) then) =
      _$UnreadByTypeCopyWithImpl<$Res, UnreadByType>;
  @useResult
  $Res call(
      {UnreadTypeItem? admin,
      UnreadTypeItem? committee,
      UnreadTypeItem? board,
      UnreadTypeItem? security});

  $UnreadTypeItemCopyWith<$Res>? get admin;
  $UnreadTypeItemCopyWith<$Res>? get committee;
  $UnreadTypeItemCopyWith<$Res>? get board;
  $UnreadTypeItemCopyWith<$Res>? get security;
}

/// @nodoc
class _$UnreadByTypeCopyWithImpl<$Res, $Val extends UnreadByType>
    implements $UnreadByTypeCopyWith<$Res> {
  _$UnreadByTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnreadByType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? admin = freezed,
    Object? committee = freezed,
    Object? board = freezed,
    Object? security = freezed,
  }) {
    return _then(_value.copyWith(
      admin: freezed == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as UnreadTypeItem?,
      committee: freezed == committee
          ? _value.committee
          : committee // ignore: cast_nullable_to_non_nullable
              as UnreadTypeItem?,
      board: freezed == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as UnreadTypeItem?,
      security: freezed == security
          ? _value.security
          : security // ignore: cast_nullable_to_non_nullable
              as UnreadTypeItem?,
    ) as $Val);
  }

  /// Create a copy of UnreadByType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UnreadTypeItemCopyWith<$Res>? get admin {
    if (_value.admin == null) {
      return null;
    }

    return $UnreadTypeItemCopyWith<$Res>(_value.admin!, (value) {
      return _then(_value.copyWith(admin: value) as $Val);
    });
  }

  /// Create a copy of UnreadByType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UnreadTypeItemCopyWith<$Res>? get committee {
    if (_value.committee == null) {
      return null;
    }

    return $UnreadTypeItemCopyWith<$Res>(_value.committee!, (value) {
      return _then(_value.copyWith(committee: value) as $Val);
    });
  }

  /// Create a copy of UnreadByType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UnreadTypeItemCopyWith<$Res>? get board {
    if (_value.board == null) {
      return null;
    }

    return $UnreadTypeItemCopyWith<$Res>(_value.board!, (value) {
      return _then(_value.copyWith(board: value) as $Val);
    });
  }

  /// Create a copy of UnreadByType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UnreadTypeItemCopyWith<$Res>? get security {
    if (_value.security == null) {
      return null;
    }

    return $UnreadTypeItemCopyWith<$Res>(_value.security!, (value) {
      return _then(_value.copyWith(security: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UnreadByTypeImplCopyWith<$Res>
    implements $UnreadByTypeCopyWith<$Res> {
  factory _$$UnreadByTypeImplCopyWith(
          _$UnreadByTypeImpl value, $Res Function(_$UnreadByTypeImpl) then) =
      __$$UnreadByTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UnreadTypeItem? admin,
      UnreadTypeItem? committee,
      UnreadTypeItem? board,
      UnreadTypeItem? security});

  @override
  $UnreadTypeItemCopyWith<$Res>? get admin;
  @override
  $UnreadTypeItemCopyWith<$Res>? get committee;
  @override
  $UnreadTypeItemCopyWith<$Res>? get board;
  @override
  $UnreadTypeItemCopyWith<$Res>? get security;
}

/// @nodoc
class __$$UnreadByTypeImplCopyWithImpl<$Res>
    extends _$UnreadByTypeCopyWithImpl<$Res, _$UnreadByTypeImpl>
    implements _$$UnreadByTypeImplCopyWith<$Res> {
  __$$UnreadByTypeImplCopyWithImpl(
      _$UnreadByTypeImpl _value, $Res Function(_$UnreadByTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnreadByType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? admin = freezed,
    Object? committee = freezed,
    Object? board = freezed,
    Object? security = freezed,
  }) {
    return _then(_$UnreadByTypeImpl(
      admin: freezed == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as UnreadTypeItem?,
      committee: freezed == committee
          ? _value.committee
          : committee // ignore: cast_nullable_to_non_nullable
              as UnreadTypeItem?,
      board: freezed == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as UnreadTypeItem?,
      security: freezed == security
          ? _value.security
          : security // ignore: cast_nullable_to_non_nullable
              as UnreadTypeItem?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$UnreadByTypeImpl implements _UnreadByType {
  const _$UnreadByTypeImpl(
      {this.admin, this.committee, this.board, this.security});

  factory _$UnreadByTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnreadByTypeImplFromJson(json);

  @override
  final UnreadTypeItem? admin;
  @override
  final UnreadTypeItem? committee;
  @override
  final UnreadTypeItem? board;
  @override
  final UnreadTypeItem? security;

  @override
  String toString() {
    return 'UnreadByType(admin: $admin, committee: $committee, board: $board, security: $security)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnreadByTypeImpl &&
            (identical(other.admin, admin) || other.admin == admin) &&
            (identical(other.committee, committee) ||
                other.committee == committee) &&
            (identical(other.board, board) || other.board == board) &&
            (identical(other.security, security) ||
                other.security == security));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, admin, committee, board, security);

  /// Create a copy of UnreadByType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnreadByTypeImplCopyWith<_$UnreadByTypeImpl> get copyWith =>
      __$$UnreadByTypeImplCopyWithImpl<_$UnreadByTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnreadByTypeImplToJson(
      this,
    );
  }
}

abstract class _UnreadByType implements UnreadByType {
  const factory _UnreadByType(
      {final UnreadTypeItem? admin,
      final UnreadTypeItem? committee,
      final UnreadTypeItem? board,
      final UnreadTypeItem? security}) = _$UnreadByTypeImpl;

  factory _UnreadByType.fromJson(Map<String, dynamic> json) =
      _$UnreadByTypeImpl.fromJson;

  @override
  UnreadTypeItem? get admin;
  @override
  UnreadTypeItem? get committee;
  @override
  UnreadTypeItem? get board;
  @override
  UnreadTypeItem? get security;

  /// Create a copy of UnreadByType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnreadByTypeImplCopyWith<_$UnreadByTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UnreadTypeItem _$UnreadTypeItemFromJson(Map<String, dynamic> json) {
  return _UnreadTypeItem.fromJson(json);
}

/// @nodoc
mixin _$UnreadTypeItem {
  int? get count => throw _privateConstructorUsedError;
  int? get conversations => throw _privateConstructorUsedError;

  /// Serializes this UnreadTypeItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnreadTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnreadTypeItemCopyWith<UnreadTypeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnreadTypeItemCopyWith<$Res> {
  factory $UnreadTypeItemCopyWith(
          UnreadTypeItem value, $Res Function(UnreadTypeItem) then) =
      _$UnreadTypeItemCopyWithImpl<$Res, UnreadTypeItem>;
  @useResult
  $Res call({int? count, int? conversations});
}

/// @nodoc
class _$UnreadTypeItemCopyWithImpl<$Res, $Val extends UnreadTypeItem>
    implements $UnreadTypeItemCopyWith<$Res> {
  _$UnreadTypeItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnreadTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? conversations = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      conversations: freezed == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnreadTypeItemImplCopyWith<$Res>
    implements $UnreadTypeItemCopyWith<$Res> {
  factory _$$UnreadTypeItemImplCopyWith(_$UnreadTypeItemImpl value,
          $Res Function(_$UnreadTypeItemImpl) then) =
      __$$UnreadTypeItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? count, int? conversations});
}

/// @nodoc
class __$$UnreadTypeItemImplCopyWithImpl<$Res>
    extends _$UnreadTypeItemCopyWithImpl<$Res, _$UnreadTypeItemImpl>
    implements _$$UnreadTypeItemImplCopyWith<$Res> {
  __$$UnreadTypeItemImplCopyWithImpl(
      _$UnreadTypeItemImpl _value, $Res Function(_$UnreadTypeItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnreadTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? conversations = freezed,
  }) {
    return _then(_$UnreadTypeItemImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      conversations: freezed == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$UnreadTypeItemImpl implements _UnreadTypeItem {
  const _$UnreadTypeItemImpl({this.count, this.conversations});

  factory _$UnreadTypeItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnreadTypeItemImplFromJson(json);

  @override
  final int? count;
  @override
  final int? conversations;

  @override
  String toString() {
    return 'UnreadTypeItem(count: $count, conversations: $conversations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnreadTypeItemImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.conversations, conversations) ||
                other.conversations == conversations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, conversations);

  /// Create a copy of UnreadTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnreadTypeItemImplCopyWith<_$UnreadTypeItemImpl> get copyWith =>
      __$$UnreadTypeItemImplCopyWithImpl<_$UnreadTypeItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnreadTypeItemImplToJson(
      this,
    );
  }
}

abstract class _UnreadTypeItem implements UnreadTypeItem {
  const factory _UnreadTypeItem({final int? count, final int? conversations}) =
      _$UnreadTypeItemImpl;

  factory _UnreadTypeItem.fromJson(Map<String, dynamic> json) =
      _$UnreadTypeItemImpl.fromJson;

  @override
  int? get count;
  @override
  int? get conversations;

  /// Create a copy of UnreadTypeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnreadTypeItemImplCopyWith<_$UnreadTypeItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
