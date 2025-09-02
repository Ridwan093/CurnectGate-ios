// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resident_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Resident _$ResidentFromJson(Map<String, dynamic> json) {
  return _Resident.fromJson(json);
}

/// @nodoc
mixin _$Resident {
  int get id => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get memberCode => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;
  List<CommitteeMember> get committees => throw _privateConstructorUsedError;
  List<BoardPosition> get boardPositions => throw _privateConstructorUsedError;
  bool get isCommitteeMember => throw _privateConstructorUsedError;
  bool get isBoardMember => throw _privateConstructorUsedError;
  List<LeadershipRole> get leadershipRoles =>
      throw _privateConstructorUsedError;
  DateTime get joinedDate => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  /// Serializes this Resident to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResidentCopyWith<Resident> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResidentCopyWith<$Res> {
  factory $ResidentCopyWith(Resident value, $Res Function(Resident) then) =
      _$ResidentCopyWithImpl<$Res, Resident>;
  @useResult
  $Res call(
      {int id,
      String firstname,
      String lastname,
      String fullName,
      String memberCode,
      String? profilePhoto,
      List<CommitteeMember> committees,
      List<BoardPosition> boardPositions,
      bool isCommitteeMember,
      bool isBoardMember,
      List<LeadershipRole> leadershipRoles,
      DateTime joinedDate,
      String? email,
      String? phone,
      String? address});
}

/// @nodoc
class _$ResidentCopyWithImpl<$Res, $Val extends Resident>
    implements $ResidentCopyWith<$Res> {
  _$ResidentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? fullName = null,
    Object? memberCode = null,
    Object? profilePhoto = freezed,
    Object? committees = null,
    Object? boardPositions = null,
    Object? isCommitteeMember = null,
    Object? isBoardMember = null,
    Object? leadershipRoles = null,
    Object? joinedDate = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      memberCode: null == memberCode
          ? _value.memberCode
          : memberCode // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      committees: null == committees
          ? _value.committees
          : committees // ignore: cast_nullable_to_non_nullable
              as List<CommitteeMember>,
      boardPositions: null == boardPositions
          ? _value.boardPositions
          : boardPositions // ignore: cast_nullable_to_non_nullable
              as List<BoardPosition>,
      isCommitteeMember: null == isCommitteeMember
          ? _value.isCommitteeMember
          : isCommitteeMember // ignore: cast_nullable_to_non_nullable
              as bool,
      isBoardMember: null == isBoardMember
          ? _value.isBoardMember
          : isBoardMember // ignore: cast_nullable_to_non_nullable
              as bool,
      leadershipRoles: null == leadershipRoles
          ? _value.leadershipRoles
          : leadershipRoles // ignore: cast_nullable_to_non_nullable
              as List<LeadershipRole>,
      joinedDate: null == joinedDate
          ? _value.joinedDate
          : joinedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResidentImplCopyWith<$Res>
    implements $ResidentCopyWith<$Res> {
  factory _$$ResidentImplCopyWith(
          _$ResidentImpl value, $Res Function(_$ResidentImpl) then) =
      __$$ResidentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String firstname,
      String lastname,
      String fullName,
      String memberCode,
      String? profilePhoto,
      List<CommitteeMember> committees,
      List<BoardPosition> boardPositions,
      bool isCommitteeMember,
      bool isBoardMember,
      List<LeadershipRole> leadershipRoles,
      DateTime joinedDate,
      String? email,
      String? phone,
      String? address});
}

/// @nodoc
class __$$ResidentImplCopyWithImpl<$Res>
    extends _$ResidentCopyWithImpl<$Res, _$ResidentImpl>
    implements _$$ResidentImplCopyWith<$Res> {
  __$$ResidentImplCopyWithImpl(
      _$ResidentImpl _value, $Res Function(_$ResidentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? fullName = null,
    Object? memberCode = null,
    Object? profilePhoto = freezed,
    Object? committees = null,
    Object? boardPositions = null,
    Object? isCommitteeMember = null,
    Object? isBoardMember = null,
    Object? leadershipRoles = null,
    Object? joinedDate = null,
    Object? email = freezed,
    Object? phone = freezed,
    Object? address = freezed,
  }) {
    return _then(_$ResidentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      memberCode: null == memberCode
          ? _value.memberCode
          : memberCode // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      committees: null == committees
          ? _value._committees
          : committees // ignore: cast_nullable_to_non_nullable
              as List<CommitteeMember>,
      boardPositions: null == boardPositions
          ? _value._boardPositions
          : boardPositions // ignore: cast_nullable_to_non_nullable
              as List<BoardPosition>,
      isCommitteeMember: null == isCommitteeMember
          ? _value.isCommitteeMember
          : isCommitteeMember // ignore: cast_nullable_to_non_nullable
              as bool,
      isBoardMember: null == isBoardMember
          ? _value.isBoardMember
          : isBoardMember // ignore: cast_nullable_to_non_nullable
              as bool,
      leadershipRoles: null == leadershipRoles
          ? _value._leadershipRoles
          : leadershipRoles // ignore: cast_nullable_to_non_nullable
              as List<LeadershipRole>,
      joinedDate: null == joinedDate
          ? _value.joinedDate
          : joinedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ResidentImpl implements _Resident {
  const _$ResidentImpl(
      {this.id = 0,
      this.firstname = '',
      this.lastname = '',
      this.fullName = '',
      this.memberCode = '',
      this.profilePhoto,
      final List<CommitteeMember> committees = const [],
      final List<BoardPosition> boardPositions = const [],
      this.isCommitteeMember = false,
      this.isBoardMember = false,
      final List<LeadershipRole> leadershipRoles = const [],
      required this.joinedDate,
      this.email,
      this.phone,
      this.address})
      : _committees = committees,
        _boardPositions = boardPositions,
        _leadershipRoles = leadershipRoles;

  factory _$ResidentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResidentImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String firstname;
  @override
  @JsonKey()
  final String lastname;
  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String memberCode;
  @override
  final String? profilePhoto;
  final List<CommitteeMember> _committees;
  @override
  @JsonKey()
  List<CommitteeMember> get committees {
    if (_committees is EqualUnmodifiableListView) return _committees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_committees);
  }

  final List<BoardPosition> _boardPositions;
  @override
  @JsonKey()
  List<BoardPosition> get boardPositions {
    if (_boardPositions is EqualUnmodifiableListView) return _boardPositions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boardPositions);
  }

  @override
  @JsonKey()
  final bool isCommitteeMember;
  @override
  @JsonKey()
  final bool isBoardMember;
  final List<LeadershipRole> _leadershipRoles;
  @override
  @JsonKey()
  List<LeadershipRole> get leadershipRoles {
    if (_leadershipRoles is EqualUnmodifiableListView) return _leadershipRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_leadershipRoles);
  }

  @override
  final DateTime joinedDate;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? address;

  @override
  String toString() {
    return 'Resident(id: $id, firstname: $firstname, lastname: $lastname, fullName: $fullName, memberCode: $memberCode, profilePhoto: $profilePhoto, committees: $committees, boardPositions: $boardPositions, isCommitteeMember: $isCommitteeMember, isBoardMember: $isBoardMember, leadershipRoles: $leadershipRoles, joinedDate: $joinedDate, email: $email, phone: $phone, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResidentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.memberCode, memberCode) ||
                other.memberCode == memberCode) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            const DeepCollectionEquality()
                .equals(other._committees, _committees) &&
            const DeepCollectionEquality()
                .equals(other._boardPositions, _boardPositions) &&
            (identical(other.isCommitteeMember, isCommitteeMember) ||
                other.isCommitteeMember == isCommitteeMember) &&
            (identical(other.isBoardMember, isBoardMember) ||
                other.isBoardMember == isBoardMember) &&
            const DeepCollectionEquality()
                .equals(other._leadershipRoles, _leadershipRoles) &&
            (identical(other.joinedDate, joinedDate) ||
                other.joinedDate == joinedDate) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstname,
      lastname,
      fullName,
      memberCode,
      profilePhoto,
      const DeepCollectionEquality().hash(_committees),
      const DeepCollectionEquality().hash(_boardPositions),
      isCommitteeMember,
      isBoardMember,
      const DeepCollectionEquality().hash(_leadershipRoles),
      joinedDate,
      email,
      phone,
      address);

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResidentImplCopyWith<_$ResidentImpl> get copyWith =>
      __$$ResidentImplCopyWithImpl<_$ResidentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResidentImplToJson(
      this,
    );
  }
}

abstract class _Resident implements Resident {
  const factory _Resident(
      {final int id,
      final String firstname,
      final String lastname,
      final String fullName,
      final String memberCode,
      final String? profilePhoto,
      final List<CommitteeMember> committees,
      final List<BoardPosition> boardPositions,
      final bool isCommitteeMember,
      final bool isBoardMember,
      final List<LeadershipRole> leadershipRoles,
      required final DateTime joinedDate,
      final String? email,
      final String? phone,
      final String? address}) = _$ResidentImpl;

  factory _Resident.fromJson(Map<String, dynamic> json) =
      _$ResidentImpl.fromJson;

  @override
  int get id;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String get fullName;
  @override
  String get memberCode;
  @override
  String? get profilePhoto;
  @override
  List<CommitteeMember> get committees;
  @override
  List<BoardPosition> get boardPositions;
  @override
  bool get isCommitteeMember;
  @override
  bool get isBoardMember;
  @override
  List<LeadershipRole> get leadershipRoles;
  @override
  DateTime get joinedDate;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get address;

  /// Create a copy of Resident
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResidentImplCopyWith<_$ResidentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
