import 'package:curnectgate/features/chat/data/model/attachment.dart';
import 'package:curnectgate/features/chat/data/model/chat_message.dart';
import 'package:curnectgate/features/chat/data/model/conversation.dart';
import 'package:hive/hive.dart';

/// Returns the Hive box name for chat messages scoped to a specific user.
/// e.g. "chat_messages_42" for user with ID 42.
String chatMessagesBoxName(String userId) => 'chat_messages_$userId';

/// Returns the Hive box name for conversations scoped to a specific user.
/// e.g. "conversations_42" for user with ID 42.
String conversationsBoxName(String userId) => 'conversations_$userId';

/// Registers all Hive adapters. Must be called once at app start (before
/// any user-specific box is opened).
Future<void> initChatHive() async {
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(MessageAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(ConversationAdapter());
  }
  if (!Hive.isAdapterRegistered(3)) {
    Hive.registerAdapter(ParticipantAdapter());
  }
  if (!Hive.isAdapterRegistered(4)) {
    Hive.registerAdapter(LatestMessageAdapter());
  }
  if (!Hive.isAdapterRegistered(5)) {
    Hive.registerAdapter(SenderAdapter());
  }
  if (!Hive.isAdapterRegistered(6)) {
    Hive.registerAdapter(ConversationSettingsAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(AttachmentAdapter());
  }
}

/// Opens (or returns already-open) the messages box for [userId].
Future<Box<Message>> openMessagesBox(String userId) async {
  final name = chatMessagesBoxName(userId);
  if (!Hive.isBoxOpen(name)) {
    await Hive.openBox<Message>(name);
  }
  return Hive.box<Message>(name);
}

/// Opens (or returns already-open) the conversations box for [userId].
Future<Box<Conversation>> getConversationsBox(String userId) async {
  final name = conversationsBoxName(userId);
  if (!Hive.isBoxOpen(name)) {
    await Hive.openBox<Conversation>(name);
  }
  return Hive.box<Conversation>(name);
}

/// Deletes all local chat data for [userId] from disk.
/// Call this during logout so the next user gets a clean slate.
Future<void> clearUserHiveBoxes(String userId) async {
  final msgName = chatMessagesBoxName(userId);
  final convName = conversationsBoxName(userId);

  if (Hive.isBoxOpen(msgName)) {
    await Hive.box<Message>(msgName).deleteFromDisk();
  } else {
    await Hive.deleteBoxFromDisk(msgName);
  }

  if (Hive.isBoxOpen(convName)) {
    await Hive.box<Conversation>(convName).deleteFromDisk();
  } else {
    await Hive.deleteBoxFromDisk(convName);
  }
}
 



////attctmene 
///
///
// / return Attachment(
//       id: NullSafetyHelper.safeInt(fields[0]),
//       fileName: NullSafetyHelper.safeString(fields[1]),
//       fileUrl: NullSafetyHelper.safeString(fields[2]),
//       fileType: NullSafetyHelper.safeString(fields[3]),
//       mimeType: NullSafetyHelper.safeString(fields[4]),
//       fileSize: NullSafetyHelper.safeInt(fields[5]),
//       fileSizeReadable: NullSafetyHelper.safeString(fields[6]),
//       thumbnailUrl: NullSafetyHelper.safeString(fields[7]),
//       isImage: NullSafetyHelper.safeBool(fields[8]),
//       isDocument: NullSafetyHelper.safeBool(fields[9]),
//       isVideo: NullSafetyHelper.safeBool(fields[10]),
//       localPath: NullSafetyHelper.safeString(fields[11]),
//     );////


    ////// MESSAGE 
    ///





    // Message(
    //   id: NullSafetyHelper.safeInt(fields[0]),
    //   conversationId: NullSafetyHelper.safeInt(fields[1]),
    //   senderId: NullSafetyHelper.safeInt(fields[2]),
    //   messageText: NullSafetyHelper.safeString(fields[3]),
    //   status: NullSafetyHelper.safeString(fields[4]),
    //   isRead: NullSafetyHelper.safeBool(fields[5]),
    //   isSender: NullSafetyHelper.safeBool(fields[6]),
    //   timeAgo: NullSafetyHelper.safeString(fields[7]),

    //   attachments:
    //       fields[8] is List
    //           ? (fields[8] as List)
    //               .map((e) => e is Attachment ? e : null)
    //               .whereType<Attachment>()
    //               .toList()
    //           : null,

    //   senderName: NullSafetyHelper.safeString(fields[9]),
    //   senderAvatar: NullSafetyHelper.safeString(fields[10]),
    //   createdAt: NullSafetyHelper.safeString(fields[11]),
    //   updatedAt: NullSafetyHelper.safeString(fields[12]),

    //   isSending: NullSafetyHelper.safeBool(fields[13]),
    //   isFailed: NullSafetyHelper.safeBool(fields[14]),
    //   localId: NullSafetyHelper.safeString(fields[15]),
    //   serverId: NullSafetyHelper.safeInt(fields[16]),

    //   createdLocalAt: fields[17] is DateTime ? fields[17] : DateTime.now(),

    //   syncStatus: NullSafetyHelper.safeString(fields[18]),
    //   hiveKey: NullSafetyHelper.safeInt(fields[19]),
    // );





    ///////CONVERSATION 
    ///
    
    ///Conversation(
//       id: NullSafetyHelper.safeInt(fields[0]),
//       estateId: NullSafetyHelper.safeInt(fields[1]),
//       type: NullSafetyHelper.safeString(fields[2]),
//       title: NullSafetyHelper.safeString(fields[3]),

//       participants: participants,

//       latestMessage: fields[5] is LatestMessage ? fields[5] : null,

//       lastMessageAt: NullSafetyHelper.safeString(fields[6]),

//       unreadCount: NullSafetyHelper.safeInt(fields[7]),

//       settings: fields[8] is ConversationSettings ? fields[8] : null,

//       createdAt: NullSafetyHelper.safeString(fields[9]),
//       updatedAt: NullSafetyHelper.safeString(fields[10]),
//     );
// Participant(
//       userId: NullSafetyHelper.safeInt(fields[0]),
//       fullName: NullSafetyHelper.safeString(fields[1]),
//       avatarUrl: NullSafetyHelper.safeString(fields[2]),
//       role: NullSafetyHelper.safeString(fields[3]),
//       onlineStatus: NullSafetyHelper.safeString(fields[4]),
//       unreadCount: NullSafetyHelper.safeInt(fields[5]),
//       lastReadAt: NullSafetyHelper.safeString(fields[6]),
//     );
// LatestMessage(
//       id: NullSafetyHelper.safeInt(fields[0]),
//       conversationId: NullSafetyHelper.safeInt(fields[1]),
//       senderId: NullSafetyHelper.safeInt(fields[2]),

//       sender: fields[3] is Sender ? fields[3] : null,

//       messageText: NullSafetyHelper.safeString(fields[4]),
//       status: NullSafetyHelper.safeString(fields[5]),
//       read: NullSafetyHelper.safeBool(fields[6]),
//       isSender: NullSafetyHelper.safeBool(fields[7]),

//       createdAt: NullSafetyHelper.safeString(fields[8]),
//       updatedAt: NullSafetyHelper.safeString(fields[9]),
//       timeAgo: NullSafetyHelper.safeString(fields[10]),
//       attachments:
//           fields[11] is List
//               ? (fields[11] as List)
//                   .map((e) => e is Attachment ? e : null)
//                   .whereType<Attachment>()
//                   .toList()
//               : null,
//     );
// Sender(
//       id: NullSafetyHelper.safeInt(fields[0]),
//       firstname: NullSafetyHelper.safeString(fields[1]),
//       lastname: NullSafetyHelper.safeString(fields[2]),
//       fullName: NullSafetyHelper.safeString(fields[3]),
//       avatarUrl: NullSafetyHelper.safeString(fields[4]),
//       role: NullSafetyHelper.safeString(fields[5]),
//     );

//     return ConversationSettings(
//       id: NullSafetyHelper.safeInt(fields[0]),
//       conversationId: NullSafetyHelper.safeInt(fields[1]),
//       notificationsEnabled: NullSafetyHelper.safeBool(fields[2]),
//       doNotDisturb: NullSafetyHelper.safeBool(fields[3]),
//       dndUntil: NullSafetyHelper.safeString(fields[4]),
//       dndActive: NullSafetyHelper.safeBool(fields[5]),
//       archived: NullSafetyHelper.safeBool(fields[6]),
//       pinned: NullSafetyHelper.safeBool(fields[7]),
//       createdAt: NullSafetyHelper.safeString(fields[8]),
//       updatedAt: NullSafetyHelper.safeString(fields[9]),
//     );
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///
    ///












