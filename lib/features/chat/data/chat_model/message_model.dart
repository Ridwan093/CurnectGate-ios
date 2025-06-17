import 'package:hive/hive.dart';
import 'package:curnectgate/features/chat/data/chat_model/messages_Enum/M_enum.dart';

part 'message_model.g.dart'; // Required for Hive code generation


@HiveType(typeId: 1)
class Messages {
  @HiveField(0) final String senderID;
  @HiveField(1) final String reciverID;
  @HiveField(2) final String text;
  @HiveField(3) final MessageEnum type;
  @HiveField(4) final String messageId;
  @HiveField(5) final bool isSeen;
  @HiveField(6) final DateTime timeSend;
  @HiveField(7) final String repliedMessage;
  @HiveField(8) final String repliedTo;
  @HiveField(9) final MessageEnum repliedMessageType;
  @HiveField(10) final String senderusername;
  @HiveField(11) final String reciverusername;
  @HiveField(12) bool isFailed;
  @HiveField(13) bool isReceiverCopy;

  Messages({
    required this.senderID,
    required this.reciverID,
    required this.text,
    required this.type,
    required this.messageId,
    required this.isSeen,
    required this.timeSend,
    required this.senderusername,
    required this.reciverusername,
    required this.repliedMessage,
    required this.repliedTo,
    required this.repliedMessageType,
    this.isFailed = false,
    this.isReceiverCopy = false,
  });

  String get hiveKey => isReceiverCopy ? '$messageId-receiver' : messageId;

  Map<String, dynamic> toMap() {
    return {
      "senderID": senderID,
      "reciverID": reciverID,
      "text": text,
      "type": type.type,
      "messageId": messageId,
      "isSeen": isSeen,
      "timeSend": timeSend.millisecondsSinceEpoch,
      "senderusername": senderusername,
      "reciverusername": reciverusername,
      'repliedMessage': repliedMessage,
      'repliedTo': repliedTo,
      'repliedMessageType': repliedMessageType.type,
      'isFailed': isFailed,
    };
  }

  factory Messages.fromMap(Map<String, dynamic> map) {
    return Messages(
      senderID: map['senderID'] ?? '',
      reciverID: map['reciverID'] ?? '',
      text: map['text'] ?? '',
      type: (map['type'] as String).toEnum(),
      messageId: map['messageId'] ?? '',
      isSeen: map['isSeen'] ?? false,
      timeSend: DateTime.fromMillisecondsSinceEpoch(map['timeSend']),
      senderusername: map['senderusername'] ?? '',
      reciverusername: map['reciverusername'] ?? '',
      repliedMessage: map['repliedMessage'] ?? '',
      repliedTo: map['repliedTo'] ?? '',
      repliedMessageType: (map['repliedMessageType'] as String).toEnum(),
      isFailed: map['isFailed'] ?? false,
    );
  }
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Messages &&
          runtimeType == other.runtimeType &&
          messageId == other.messageId; // Changed from text to messageId

  @override
  int get hashCode => messageId.hashCode; // Changed from text to messageId

  Messages copyWith({
    String? senderID,
    String? reciverID,
    String? text,
    MessageEnum? type,
    String? messageId,
    bool? isSeen,
    DateTime? timeSend,
    String? repliedMessage,
    String? repliedTo,
    MessageEnum? repliedMessageType,
    String? senderusername,
    String? reciverusername,
    bool? isReceiverCopy,
    bool? isFailed,
  }) {
    return Messages(
      
      senderID: senderID ?? this.senderID,
      reciverID: reciverID ?? this.reciverID,
      text: text ?? this.text,
      type: type ?? this.type,
      messageId: messageId ?? this.messageId,
      isSeen: isSeen ?? this.isSeen,
      timeSend: timeSend ?? this.timeSend,
      repliedMessage: repliedMessage ?? this.repliedMessage,
      repliedTo: repliedTo ?? this.repliedTo,
      repliedMessageType: repliedMessageType ?? this.repliedMessageType,
      senderusername: senderusername ?? this.senderusername,
      reciverusername: reciverusername ?? this.reciverusername,
      isFailed:isFailed ?? this.isFailed ,
      isReceiverCopy: isReceiverCopy ?? this.isReceiverCopy
    );
  }
}