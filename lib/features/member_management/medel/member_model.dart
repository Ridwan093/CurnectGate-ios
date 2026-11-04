class MemberModel {
  final String userfirstName;
  final String userlaseName;
  final String userpix;
  final String userRole;
  final String email;
  final String phonenumber;

  MemberModel({
    required this.userfirstName,
    required this.userlaseName,
    required this.userpix,
    required this.userRole,
    required this.email,
    required this.phonenumber,
  });
}

List<MemberModel> memebers = [];
