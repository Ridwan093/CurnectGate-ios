// user_model.dart
class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? profileUrl;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.profileUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profileUrl: map['profileUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profileUrl': profileUrl,
    };
  }
}