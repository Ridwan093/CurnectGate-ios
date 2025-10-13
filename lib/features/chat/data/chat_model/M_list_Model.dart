

class ChatLists {
  final String name;
  final String profilepice;
  final String contactId;
  final DateTime sendeTime;
  final String lastMessage;
  final bool isonlin;
  final bool isSeen;
  final bool isMuted;
  final bool isMe;
  final bool myMuteSeen;
  final String p1;
  final String p2;
  final String p3;
  final String age;
  final String gender;
  final List<String?> tokens;
  final String messageId;
  final bool isblockeMe;
  final String callID;
  final bool isMeBlockhim;
  final int unseenMessageCount; // New fild for unseen message count

  ChatLists({
    required this.isblockeMe,
    required this.callID,
    required this.isMeBlockhim,
    required this.p1,
    required this.p2,
    required this.p3,
    required this.gender,
    required this.age,
    required this.messageId,
    required this.isMe,
    required this.myMuteSeen,
    required this.isMuted,
    required this.name,
    required this.tokens,
    required this.isSeen,
    required this.isonlin,
    required this.profilepice,
    required this.contactId,
    required this.sendeTime,
    required this.lastMessage,
    required this.unseenMessageCount, // Initialize the field
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "profilepice": profilepice,
      "contactId": contactId,
      "sendeTime": sendeTime,
      "lastMessage": lastMessage,
      "isonlin": isonlin,
      "isSeen": isSeen,
      "isMuted": isMuted,
      "isMe": isMe,
      "myMuteSeen": myMuteSeen,
      "tokens": tokens,
      "callID":callID,
      "p1": p1,
      "p2": p2,
      "p3": p3,
      "age": age,
      "gender": gender,
      "messageId": messageId,
      "isblockeMe": isblockeMe,
      "isMeBlockhim": isMeBlockhim,
      "unseenMessageCount": unseenMessageCount, // Include the field in the map
    };
  }

  factory ChatLists.fromMap(Map<String, dynamic> map) {
    List<String?> tokens = [];
    if (map['tokens'] != null) {
      tokens = List<String?>.from(map['tokens']);
    }

    return ChatLists(
      callID: map["callID"],
        messageId: map["messageId"] ?? "",
        name: map["name"] ?? "",
        profilepice: map["profilepice"] ?? "",
        contactId: map["contactId"] ?? "",
        sendeTime: (map['sendeTime']),
        lastMessage: map["lastMessage"] ?? "",
        isSeen: map["isSeen"] ?? false,
        isonlin: map["isonlin"] ?? false,
        isMuted: map["isMuted"] ?? false,
        myMuteSeen: map["myMuteSeen"] ?? false,
        isMe: map["isMe"] ?? false,
        tokens: tokens,
        unseenMessageCount: map["unseenMessageCount"] ?? 0,
        age: map["age"] ?? "",
        p1: map["p1"] ?? "",
        p2: map["p2"] ?? "",
        p3: map["p3"] ?? "",
        isblockeMe: map["isblockeMe"] ?? "",
        isMeBlockhim: map["isMeBlockhim"] ?? "",
        gender: map["gender"] ?? "");
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatLists &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
