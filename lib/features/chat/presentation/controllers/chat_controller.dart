// import 'dart:developer';
// import 'dart:io';

// import 'package:curnectgate/features/chat/data/chat_model/messages_Enum/M_enum.dart';
// import 'package:curnectgate/features/chat/data/chat_model/message_model.dart';
// import 'package:curnectgate/features/chat/data/chat_model/M_reply_Model.dart';
// import 'package:curnectgate/features/chat/data/repositories/Chat_repositry.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final chatControllerProvider = Provider((ref) {
 
//   return ChatController(cartRepositry, ref);
// });

// class ChatController {
//   final CartRepositry cartRepositry;
//   final Ref ref;

//   ChatController(this.cartRepositry, this.ref);

//   Stream<List<Messages>> chatStream(String recieverUserId) {
//     return cartRepositry.getChatStream(recieverUserId);
//   }

//   void updateOnlineStatus({required String id, required bool isOnline}) {
//     cartRepositry.updateUserOnlinStatuse(currentUserId: id, isonlin: isOnline);
//   }

//   void sendTextMessage({
//     required BuildContext context,
//     required String text,
//     required String reciverUserId,
//     required String reciverprofilpix,
//     required String reciverName,
//     required bool muted,
//     required String age,
//     required String gender,
//     required String p1,
//     required String p2,
//     required String p3,
//     required String callID,
//     required List<String?> reciverTokens,
//   }) {
//     final messageReply = ref.read(messageReplyProvider);

//     cartRepositry.sendTextMessage(
//       ref: ref,
//       callID: callID,
//       p1: p1,
//       p2: p2,
//       p3: p3,
//       gender: gender,
//       age: age,
//       muted: muted,
//       reciverusertokens: reciverTokens,
//       messageReply: messageReply,
//       context: context,
//       reciverUserId: reciverUserId,
//       text: text,
//       reciverUserName: reciverName,
//       reciverprofilpix: reciverprofilpix,
//     );

//     // ignore: deprecated_member_use
//     ref.read(messageReplyProvider.state).update((state) => null);
//   }

//   void sendFileMessage({
//     required BuildContext context,
//     required File file,
//     required MessageEnum messageEnum,
//     required String reciverUserId,
//     required String reciverprofilpix,
//     required List<String?> reciverTokens,
//     required bool ismuted,
//     required String age,
//     required String gender,
//     required String p1,
//     required String p2,
//     required String callID,
//     required String p3,
//     required String reciverName,
//   }) {
//     final messageReply = ref.read(messageReplyProvider);
//     cartRepositry.sendFileMessage(
//       callID: callID,
//       p1: p1,
//       p2: p2,
//       p3: p3,
//       gender: gender,
//       age: age,
//       isMuted: ismuted,
//       reciverUserToken: reciverTokens,
//       messageReply: messageReply,
//       messageEnum: messageEnum,
//       context: context,
//       recieverUserId: reciverUserId,
//       ref: ref,
//       file: file,
//       reciverUserName: reciverName,
//       reciverprofilpix: reciverprofilpix,
//     );
//     // ignore: deprecated_member_use
//     ref.read(messageReplyProvider.state).update((state) => null);
//   }

//   void setChatMessageSeen(
//     BuildContext context,
//     String recieverUserId,
//     String messageId,
//   ) {
//     cartRepositry.setChatMessageSeen(context, recieverUserId, messageId);
//   }

//   void seChatUnseenCountToZero(String recieverUserId) {
//     cartRepositry.seChatUnseenCountToZero(recieverUserId);
//   }

//   void toggleReceiverMutedStatus(
//     String recieverUserId,
//     bool isReceiver,
//     String userId,
//   ) {
//     cartRepositry.toggleMutedStatus(
//       userId: userId,
//       isReceiver: isReceiver,
//       recieverUserId: recieverUserId,
//     );
//   }

//   void setChatMessageDeliver(
//     BuildContext context,
//     String recieverUserId,
//     String messageId,
//     bool isonline,
//   ) {
//     cartRepositry.setChatMessageDilver(
//       context,
//       recieverUserId,
//       messageId,
//       isonline,
//     );
//   }

//   void deletChatMessageFromBothSide(
//     BuildContext context,
//     String recieverUserId,
//     String messageId,
//     String reciverprofilpix,
//     String reciverName,
//     bool ismuted,
//     List<String?> reciverTokens,
//   ) {
//     final messageReply = ref.read(messageReplyProvider);
//     cartRepositry.deletChatMessage(
//       context,
//       recieverUserId,
//       messageId,
//       reciverName,
//       reciverprofilpix,
//       reciverTokens,
//       ismuted,
//       messageReply,
//     );
//     // ignore: deprecated_member_use
//     ref.read(messageReplyProvider.state).update((state) => null);
//   }

//   void removeChatandMessages({required String receiverUserId}) {
//     cartRepositry.removeChatAndMessages(receiverUserId);
//   }

//   void updateBlockTime({required String receivedId, required DateTime date}) {
//     cartRepositry.updateBlockTime(receivedId, date);
//   }

//   void removBlockTime({required String receivedId}) {
//     cartRepositry.removeBlockTime(receivedId);
//   }

//   void deleTmessageFromMe({
//     required BuildContext context,
//     required String recieverUserId,
//     required String messageId,
//     required String reciverprofilpix,
//     required List<String?> reciverTokens,
//     required String reciverName,
//   }) {
//     final messageReply = ref.read(messageReplyProvider);

//     log('Me Was this log :$reciverName');
//     cartRepositry.deleteFromMee(
//       context,
//       recieverUserId,
//       messageId,
//       reciverprofilpix,
//       reciverName,
//       reciverTokens,
//       messageReply,
//     );

//     // ignore: deprecated_member_use
//     ref.read(messageReplyProvider.state).update((state) => null);
//   }

//   void deletChatMessageDeletFromBothSide(
//     BuildContext context,
//     String recieverUserId,
//     String messageId,
//     //  bool isMuted,
//   ) {
//     cartRepositry.deletDeletMessage(context, recieverUserId, messageId);
//   }
// }
