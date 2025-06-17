// ignore_for_file: file_names

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:curnectgate/core/storage/common_firebase_storage_repository.dart';
import 'package:curnectgate/features/chat/data/chat_model/M_list_Model.dart';
import 'package:curnectgate/features/chat/data/chat_model/M_reply_Model.dart';
import 'package:curnectgate/features/chat/data/chat_model/message_model.dart';
import 'package:curnectgate/features/chat/data/chat_model/messages_Enum/M_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:uuid/uuid.dart';

final chatRepositryprovider = Provider(
  (ref) => CartRepositry(FirebaseFirestore.instance),
);

class CartRepositry {
  final FirebaseFirestore firestore;

  CartRepositry(this.firestore);

  Future<void> sendNotificationToAll({
    required bool isBlockB,
    required bool isBlock,
    required bool ismuted,
    required String age,
    required String gender,
    required String p1,
    required String p2,
    required String p3,
    required String message,
    required String messageType,
    required String senderName,
    required String senderProfilePix,
    required List<String?> tokens,
    required bool isOnline,
    required String senderId,
    required String callID,
    required List<String?> sendertokens,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? senderUserToken = prefs.getStringList('tokens');
    try {
      for (String? deviceToken in tokens) {
        // Define the request body

        log("${deviceToken}NodeviceToke");
        Map<String, dynamic> body = {
          'priority': "High",
          'data': {
            'click_actone': 'FLUTTER_NOTIFICATION_CLICK',
            'statuse': 'done',
            'title': 'New Message',
            'body': message,
            'senderName': senderName,
            'senderProfilePix': senderProfilePix,
            "messageType": messageType,
            "isOnline": isOnline,
            "senderId": senderId,
            "isBlockB": isBlockB,
            "isBlock": isBlock,
            "token": senderUserToken,
            "ismuted": ismuted,
            "age": age,
            "gender": gender,
            "p1": p1,
            "p2": p2,
            "p3": p3,
            "callID": callID,
          },
          'notification': {
            'title': null,
            'body': null,
            'andriod_channel_id': "abcfood",
          },
          'to': deviceToken,
        };

        // Add APNS payload for iOS devices
        if (Platform.isIOS) {
          body['apns'] = {
            'payload': {
              'aps': {
                'mutable-content': 1,
                'sound': 'default',
                'alert': {'title': 'New Message', 'body': message},
              },
            },
          };
        }

        // // Send the POST request
        // http.Response response = await http.post(
        //   Uri.parse('https://fcm.googleapis.com/fcm/send'),
        //   headers: headers,
        //   body: json.encode(body),
        // );

        // if (response.statusCode == 200) {
        //   log('Notification sent successfully.');
        // } else {
        //   log('Error sending notification: ${response.body}');
        // }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Define a stream controller

  void removeChatAndMessages(String receiverUserId) async {
    try {
      final userChatRef = FirebaseFirestore.instance
          .collection('user')
          .doc("Current userId") // add Cuttrent UserId
          .collection('chart')
          .doc(receiverUserId);

      final userMessageRef = userChatRef.collection('message');

      await userChatRef.delete();
      await userMessageRef.get().then((snapshot) {
        for (var doc in snapshot.docs) {
          doc.reference.delete();
        }
      });

      // Log success or handle other operations
    } catch (e) {
      // Log error or handle errors
    }
  }

  Future<List<Messages>> getLastFiveMessages(
    String userId,
    String receiverUserId,
  ) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('user')
              .doc(userId)
              .collection('chart')
              .doc(receiverUserId)
              .collection('message')
              .orderBy('timeSend', descending: true)
              .limit(5)
              .get();

      List<Messages> messages =
          querySnapshot.docs.map((doc) {
            return Messages.fromMap(doc.data());
          }).toList();

      return messages;
    } catch (e) {
      log('Error retrieving messages: $e');
      return [];
    }
  }
  Stream<List<Messages>> getChatStream(String receiverUserId) async* {
  // 1. Get current user ID
  final preferences = await SharedPreferences.getInstance();
  final currentUserId = preferences.getString("currentuserId");
  if (currentUserId == null) throw Exception("User not logged in");

  // 2. Initialize Hive box
  final chatBox = Hive.box<Messages>('chat_messages');

  // 3. First emit cached messages from Hive (only show messages where current user is involved)
  final cachedMessages = chatBox.values
      .where((msg) => 
          msg.senderID == currentUserId || 
          msg.reciverID == currentUserId)
      .where((msg) =>
          (msg.senderID == currentUserId && msg.reciverID == receiverUserId) ||
          (msg.senderID == receiverUserId && msg.reciverID == currentUserId))
      .toList()
    ..sort((a, b) => a.timeSend.compareTo(b.timeSend));

  yield cachedMessages;

  // 4. Check connectivity
  final connectivityResult = await Connectivity().checkConnectivity();
  final isOnline = connectivityResult != ConnectivityResult.none;

  if (isOnline) {
    // Listen to ONLY our received messages in Firebase to avoid duplicates
    await for (final snapshot in firestore
        .collection('user')
        .doc(currentUserId)  // Only our received messages
        .collection('chat')
        .doc(receiverUserId)
        .collection('message')
        .orderBy('timeSend')
        .snapshots()) {
      
      // Process changes
      for (final doc in snapshot.docChanges) {
        if (doc.type == DocumentChangeType.added || doc.type == DocumentChangeType.modified) {
          var message = Messages.fromMap(doc.doc.data()!);

          // Only process if we don't already have this message
          if (!chatBox.containsKey(message.hiveKey)) {
            // Cache files if media message
            if (message.type != MessageEnum.text) {
              try {
                final cachedPath = await DefaultCacheManager()
                    .getSingleFile(message.text)
                    .then((file) => file.path);
                message = message.copyWith(text: cachedPath);
              } catch (e) {
                debugPrint('File caching failed: $e');
              }
            }

            // Save to Hive
            await chatBox.put(message.hiveKey, message);
          }
        }
      }

      // Emit updated list (only unique messages)
      final updatedMessages = chatBox.values
          .where((msg) =>
              (msg.senderID == currentUserId && msg.reciverID == receiverUserId) ||
              (msg.senderID == receiverUserId && msg.reciverID == currentUserId))
          .toList()
        ..sort((a, b) => a.timeSend.compareTo(b.timeSend));

      yield updatedMessages;
    }
  }
}

  void sendDataToContactSubcollection({
    required String sendername,
    required bool ismuted,
    required String uid,
    required String senderprofilpix,
    required String text,
    required DateTime timeSend,
    required String reciverUserid,
    required String reciverName,
    required String reciverprix,
    required List<String?> reciverusertokens,
    required List<String?> sendertokens,
    required String age,
    required String gender,
    required String p1,
    required String p2,
    required String p3,
    required String callID,
    required String messageid,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var currentUserId = preferences.getString("currentuserId");

    var reciverCartContactSnapshot =
        await firestore
            .collection('user')
            .doc(reciverUserid)
            .collection('chart')
            .doc(currentUserId) //UserId
            .get();
    int unseenMessageCount = 0;
    bool isMuted = false;
    bool myMuteSeen = false;
    bool isMeBlockhim = false;
    bool isblockeMe = false;
    bool isMeOnline = false;

    if (reciverCartContactSnapshot.exists) {
      var reciverCartContactData = reciverCartContactSnapshot.data();
      unseenMessageCount = reciverCartContactData!['unseenMessageCount'] ?? 0;
      isMuted = reciverCartContactData["isMuted"] ?? false;
      myMuteSeen = reciverCartContactData["myMuteSeen"] ?? false;
      isMeBlockhim = reciverCartContactData["isblockeMe"] ?? false;
      isblockeMe = reciverCartContactData["isblockeMe"] ?? false;
      isMeOnline = reciverCartContactData["isonlin"] ?? false;

      // ... rest of the code ...
    } else {
      // Document does not exist, handle the situation accordingly
      // For example, you can set default values for unseenMessageCount, isMuted, and myMuteSeen

      unseenMessageCount = 0;

      // ... rest of the code ...
    }

    var reciverCartContact = ChatLists(
      callID: 'getcontroller.getNewId.value',
      isMeBlockhim: isMeBlockhim,
      isblockeMe: isblockeMe,
      messageId: messageid,
      p1: '',
      p2: 'getcontroller.p12.value,',
      p3: 'getcontroller.p13.value',
      gender: 'getcontroller.sexs.value',
      age: "2",
      isMe: false,
      myMuteSeen: myMuteSeen,
      isMuted: isMuted,
      tokens: sendertokens,
      isSeen: false,
      isonlin: isMeOnline,
      name: sendername,
      profilepice: senderprofilpix,
      contactId: uid,
      sendeTime: timeSend,
      lastMessage: text,
      unseenMessageCount:
          unseenMessageCount + 1, // Increment unseen message count
    );

    await firestore
        .collection('user')
        .doc(reciverUserid)
        .collection('chat')
        .doc(currentUserId)
        .set(reciverCartContact.toMap(), SetOptions(merge: true));

    var senderCartContactSnapshot =
        await firestore
            .collection('user')
            .doc(currentUserId)
            .collection('chat')
            .doc(reciverUserid)
            .get();

    var senderCartContactData = senderCartContactSnapshot.data();

    isMuted = senderCartContactData?["isMuted"] ?? false;
    myMuteSeen = senderCartContactData?["myMuteSeen"] ?? false;
    bool isMe = senderCartContactData?["isMe"] ?? false;
    isblockeMe = senderCartContactData?["isblockeMe"] ?? false;
    isMeBlockhim = senderCartContactData?["isMeBlockhim"] ?? false;
    bool isOnlin = senderCartContactData?["isonlin"] ?? false;

    var senderCartContact = ChatLists(
      callID: callID,
      isMeBlockhim: isMeBlockhim,
      isblockeMe: isblockeMe,
      messageId: messageid,
      p1: p1,
      p2: p2,
      p3: p3,
      gender: gender,
      age: age,
      isMe: isMe,
      myMuteSeen: myMuteSeen,
      isMuted: isMuted,
      isSeen: false,
      isonlin: isOnlin,
      tokens: reciverusertokens,
      name: reciverName,
      profilepice: reciverprix,
      contactId: reciverUserid,
      sendeTime: timeSend,
      lastMessage: text,
      unseenMessageCount: 0, // Increment unseen message count
    );

    await firestore
        .collection('user')
        .doc(currentUserId)
        .collection('chat')
        .doc(reciverUserid)
        .set(senderCartContact.toMap(), SetOptions(merge: true));
    if (isMuted == true) {
      log("${reciverName}muted Me");
    } else {
      log("false for Muted");
      if (reciverusertokens.isNotEmpty) {
        sendNotificationToAll(
          callID: callID,
          isBlock: isblockeMe,
          isBlockB: isMeBlockhim,
          ismuted: ismuted,
          age: age,
          gender: gender,
          p1: p1,
          p2: p2,
          p3: p3,
          message: text,
          messageType: "chat",
          senderName: 'controller.newUsername.value',
          senderProfilePix: 'controller.profile.value',
          tokens: reciverusertokens,
          sendertokens: sendertokens,
          isOnline: isOnlin,
          senderId: 'controller.getUserID.value',
        );
      }
    }

    // Update the block time for both the sender and receiver (assuming they are not blocked)

    log(
      'Receiver Unseen Message Count: ${reciverCartContact.unseenMessageCount}',
    );
    log('Sender Unseen Message Count: ${senderCartContact.unseenMessageCount}');
  }
Future<void> _saveMessageToMessagesubCollection({
  required String currentUserName,
  required String reciveusername,
  required String text,
  required DateTime timeSend,
  required String reciverUserid,
  required MessageEnum messageType,
  required MessageReply? messageReply,
  required String messageId,
  required Ref ref,
}) async {
  // 1. Get current user ID
  final currentUserId =
      (await SharedPreferences.getInstance()).getString("currentuserId")!;

  // 2. Create only ONE message (sender's perspective)
  final message = Messages(
    repliedMessageType: messageReply?.messageEnum ?? MessageEnum.text,
    repliedTo: messageReply == null
        ? ''
        : (messageReply.isMe ? currentUserName : reciveusername),
    repliedMessage: messageReply?.message ?? '',
    senderusername: currentUserName,
    reciverusername: reciveusername,
    senderID: currentUserId,
    reciverID: reciverUserid,
    text: text,
    type: messageType,
    messageId: messageId,
    isSeen: false,
    timeSend: timeSend,
    // Removed isReceiverCopy completely
  );

  // 3. Cache locally (only one copy)
  final chatBox = Hive.box<Messages>('chat_messages');
  final pendingBox = Hive.box<Messages>('pending_messages');
  
  await chatBox.put(message.hiveKey, message);

  // 4. Try sending to Firebase (still two copies there)
  try {
    if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
      // Create receiver copy just for Firebase
      final receiverMessage = message.copyWith(
        senderID: reciverUserid,
        reciverID: currentUserId,
        senderusername: reciveusername,
        reciverusername: currentUserName,
      );

      await Future.wait([
        firestore
            .collection('user')
            .doc(reciverUserid)
            .collection('chat')
            .doc(currentUserId)
            .collection('message')
            .doc(messageId)
            .set(receiverMessage.toMap()),

        firestore
            .collection('user')
            .doc(currentUserId)
            .collection('chat')
            .doc(reciverUserid)
            .collection('message')
            .doc(messageId)
            .set(message.toMap()),
      ]);

      // Clean up pending if successful
      await pendingBox.delete(message.hiveKey);
    } else {
      // Offline - add to pending
      // await pendingBox.put(message.hiveKey, message.copyWith(isFailed: true));
    }
  } catch (e) {
    // Mark as failed and keep in pending
    // await pendingBox.put(message.hiveKey, message.copyWith(isFailed: true));
    rethrow;
  }
}
  //handle both offline and onlline message sender
  void sendTextMessage({
    required BuildContext context,
    required String reciverUserId,
    required String reciverUserName,
    required String reciverprofilpix,
    required MessageReply? messageReply,
    required List<String?> reciverusertokens,
    required Ref ref,
    required bool muted,
    required String age,
    required String gender,
    required String p1,
    required String p2,
    required String callID,
    required String p3,
    required String text,
  }) async {
    try {
      // final value = ref.watch(themeProvider).asData!.value;
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? senderUserToken = ["jsdjhsjhdjhs"];
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var currentUserId = preferences.getString("currentuserId");

      var currentuserpicUrl =
          "https://firebasestorage.googleapis.com/v0/b/fir-app-189fc.appspot.com/o/profile_images%2FM98KlLkM7wb6IgIPLI7zPN4XJN93?alt=media&token=ec030c14-7796-43c1-9650-2ed6fe36fa89";

      var currentUserName = preferences.getString("currentUsername");

      var timeSend = DateTime.now();

      var messageId = const Uuid().v1();

      sendDataToContactSubcollection(
        callID: callID,
        ismuted: muted,
        messageid: messageId,
        p1: p1,
        p2: p2,
        p3: p3,
        gender: gender,
        age: age,
        reciverusertokens: reciverusertokens,
        sendertokens: senderUserToken,
        text: text,
        timeSend: timeSend,
        reciverUserid: reciverUserId,
        reciverName: reciverUserName,
        reciverprix: reciverprofilpix,
        sendername: currentUserName!,
        senderprofilpix: currentuserpicUrl,
        uid: currentUserId!,
      );

      _saveMessageToMessagesubCollection(
        ref: ref,
        messageReply: messageReply,
        currentUserName: currentUserName,
        reciveusername: reciverUserName,
        text: text,
        timeSend: timeSend,
        reciverUserid: reciverUserId,
        messageType: MessageEnum.text,
        messageId: messageId,
      );
      setSeenIconTonOne(reciverUserId, false);

      // setSeenIconTonOne(reciverUserId, true);

      // sendNotification(text, messageId, MessageEnum.texe.type, reciverUserId,
      //     controller.newUsername.value, controller.profile.value);

      // showNotificationss(soundUrl: "https://i.imgur.com/6eCDksW.jpg", userName: "name", message: "Hello");
      //  notfy();
    } catch (e) {
      log(e.toString());
    }
  }

  void sendFileMessage({
    required BuildContext context,
    required File file,
    required String recieverUserId,
    required String reciverUserName,
    required String reciverprofilpix,
    required Ref ref,
    required MessageEnum messageEnum,
    required MessageReply? messageReply,
    required bool isMuted,
    required List<String?> reciverUserToken,
    required String age,
    required String gender,
    required String p1,
    required String p2,
    required String p3,
    required String callID,
    // required MessageReply? messageReply,
    // required bool isGroupChat,
  }) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var currentUserId = preferences.getString("currentuserId");

      var currentuserpicUrl = preferences.getString("currentuserpUr");

      var currentUserName = preferences.getString("currentUsername");

      var timeSent = DateTime.now();
      var messageId = const Uuid().v1();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? senderUserToken = prefs.getStringList('tokens');

      String imageUrl = await ref
          .read(commonFirebaseStorageRepositoryProvider)
          .storeFileToFirebase(
            'chat/${messageEnum.type}/$currentUserId/$recieverUserId/$messageId',
            file,
          );

      String contactMsg;

      switch (messageEnum) {
        case MessageEnum.image:
          contactMsg = '📷 Photo';
          break;
        case MessageEnum.video:
          contactMsg = '📸 Video';
          break;
        case MessageEnum.audio:
          contactMsg = '🎵 Audio';
          break;
        case MessageEnum.gif:
          contactMsg = 'GIF';
          break;
        default:
          contactMsg = 'GIF';
      }

      sendDataToContactSubcollection(
        callID: callID,
        ismuted: isMuted,
        messageid: messageId,
        p1: p1,
        p2: p2,
        p3: p3,
        gender: gender,
        age: age,
        reciverusertokens: reciverUserToken,
        sendertokens: senderUserToken!,
        text: contactMsg,
        timeSend: timeSent,
        reciverUserid: recieverUserId,
        reciverName: reciverUserName,
        reciverprix: reciverprofilpix,
        sendername: currentUserName!,
        senderprofilpix: currentuserpicUrl!,
        uid: currentUserId!,
      );

      // setSeenIconTonOne(recieverUserId, true);
      _saveMessageToMessagesubCollection(
        ref: ref,
        messageReply: messageReply,
        currentUserName: currentUserName,
        reciveusername: reciverUserName,
        text: imageUrl,
        timeSend: timeSent,
        reciverUserid: recieverUserId,
        messageType: messageEnum,
        messageId: messageId,
      );
      setSeenIconTonOne(recieverUserId, false);
    } catch (e) {
      // showSnackBar(context: context, content: e.toString());
    }
  }

  void seChatUnseenCountToZero(String recieverUserId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var currentUserId = preferences.getString("currentuserId");

    await FirebaseFirestore.instance
        .collection('user')
        .doc(currentUserId)
        .collection('chat')
        .doc(recieverUserId)
        .update({'unseenMessageCount': 0});
  }

  void setSeenIconTonOne(String recieverUserId, bool isMe) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var currentUserId = preferences.getString("currentuserId");

    await FirebaseFirestore.instance
        .collection('user')
        .doc(currentUserId)
        .collection('chat')
        .doc(recieverUserId)
        .update({'isMe': true});

    await FirebaseFirestore.instance
        .collection('user')
        .doc(recieverUserId)
        .collection('chat')
        .doc(currentUserId)
        .update({'isMe': false});
  }

  // Function to toggle the muted status for a user

  // Function to toggle the muted status for a user
  Future<void> toggleMutedStatus({
    required String userId,
    required String recieverUserId,
    bool isReceiver = true,
  }) async {
    final String mutedField = isReceiver ? 'isMuted' : 'myMuteSeen';

    try {
      final userDocRef = FirebaseFirestore.instance
          .collection('user')
          .doc(userId)
          .collection('chat')
          .doc(recieverUserId);

      final userDocSnapshot = await userDocRef.get();

      if (userDocSnapshot.exists) {
        final userData = userDocSnapshot.data();
        final currentMutedStatus = userData?[mutedField] ?? false;
        final updatedMutedStatus = !currentMutedStatus;

        await userDocRef.update({mutedField: updatedMutedStatus});

        debugPrint(
          'Muted status toggled successfully. New status: $updatedMutedStatus',
        );
      } else {
        debugPrint('User document not found.');
      }
    } catch (e) {
      debugPrint('Error toggling muted status: $e');
    }
  }

  // void setChatMessageSeen(
  //   BuildContext context,
  //   String recieverUserId,
  //   String messageId,
  // ) async {
  //   try {
  //     await firestore
  //         .collection('user')
  //         .doc(recieverUserId)
  //         .collection('chart')
  //         .doc(controller.getUserID.value)
  //         .collection('message')
  //         .doc(messageId)
  //         .update({'isSeen': true});

  //     // await firestore
  //     //     .collection('user')
  //     //     .doc(controller.getUserID.value)
  //     //     .collection('chart')
  //     //     .doc(recieverUserId)
  //     //     .update({'isSeen': true});

  //     await firestore
  //         .collection('user')
  //         .doc(recieverUserId)
  //         .collection('chart')
  //         .doc(controller.getUserID.value)
  //         .update({'isSeen': true});
  //   } catch (e) {
  //     // showSnackBar(context: context, content: e.toString());
  //   }
  // }
  void setChatMessageSeen(
    BuildContext context,
    String receiverUserId,
    String messageId,
  ) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var currentUserId = preferences.getString("currentuserId");

      // Check if the document exists before updating
      final messageReference = firestore
          .collection('user')
          .doc(receiverUserId)
          .collection('chat')
          .doc(currentUserId)
          .collection('message')
          .doc(messageId);

      final messageSnapshot = await messageReference.get();

      if (messageSnapshot.exists) {
        await messageReference.update({'isSeen': true});
      } else {
        // Handle the case where the document does not exist
        // You can create the document or log an error here
      }

      // Update the user document for the receiver
      final userReference = firestore
          .collection('user')
          .doc(receiverUserId)
          .collection('chat')
          .doc(currentUserId);

      await userReference.update({'isSeen': true});
    } catch (e) {
      // Handle errors
      // showSnackBar(context: context, content: e.toString());
    }
  }

  void setChatMessageDilver(
    BuildContext context,
    String recieverUserId,
    String messageId,
    bool isOnlin,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var currentUserId = preferences.getString("currentuserId");

    try {
      await firestore
          .collection('user')
          .doc(currentUserId)
          .collection('chat')
          .doc(recieverUserId)
          .collection('message')
          .doc(messageId)
          .update({'isonlin': isOnlin});

      await firestore
          .collection('user')
          .doc(recieverUserId)
          .collection('chat')
          .doc(currentUserId)
          .collection('message')
          .doc(messageId)
          .update({'isonlin': isOnlin});

      await firestore
          .collection('user')
          .doc(currentUserId)
          .collection('chat')
          .doc(recieverUserId)
          .update({'isonlin': isOnlin});

      await firestore
          .collection('user')
          .doc(recieverUserId)
          .collection('chat')
          .doc(currentUserId)
          .update({'isonlin': isOnlin});
    } catch (e) {
      // showSnackBar(context: context, content: e.toString());
    }
  }

  void deletChatMessage(
    BuildContext context,
    String recieverUserId,
    String messageId,
    String profilePic,
    String username,
    List<String?> reciverUserTokens,
    bool ismuted,
    MessageReply? messageReply,
  ) async {
    try {
      await firestore
          .collection('user')
          .doc('controller.getUserID.value')
          .collection('chart')
          .doc(recieverUserId)
          .update({"lastMessage": "this message was deleted"});

      await firestore
          .collection('user')
          .doc(recieverUserId)
          .collection('chart')
          .doc('controller.getUserID.value')
          .update({"lastMessage": "this message was deleted"});

      await firestore
          .collection('user')
          .doc('controller.getUserID.value')
          .collection('chart')
          .doc(recieverUserId)
          .collection('message')
          .doc(messageId)
          .update({
            "text": "this message was deleted",
            "type": "text",
            "repliedMessageType": "",
            "repliedMessage": "",
          });

      await firestore
          .collection('user')
          .doc(recieverUserId)
          .collection('chart')
          .doc('controller.getUserID.value')
          .collection('message')
          .doc(messageId)
          .update({
            "text": "this message was deleted",
            "type": "text",
            "repliedMessageType": "",
            "repliedMessage": "",
          });
    } catch (e) {
      // showSnackBar(context: context, content: e.toString());
    }
  }

  void deletDeletMessage(
    BuildContext context,
    String recieverUserId,
    String messageId,
  ) async {
    try {
      await firestore
          .collection('user')
          .doc('controller.getUserID.value')
          .collection('chart')
          .doc(recieverUserId)
          .collection('message')
          .doc(messageId)
          .delete();
    } catch (e) {
      // showSnackBar(context: context, content: e.toString());
    }
  }

  void deleteFromMee(
    BuildContext context,
    String recieverUserId,
    String messageId,
    String profilePic,
    String username,
    List<String?> reciverUserTokens,
    MessageReply? messageReply,
  ) async {
    try {
      await firestore
          .collection('user')
          .doc('controller.getUserID.value')
          .collection('chart')
          .doc(recieverUserId)
          .update({"lastMessage": "Message was Deleted"});
      await firestore
          .collection('user')
          .doc('controller.getUserID.value')
          .collection('chart')
          .doc(recieverUserId)
          .collection('message')
          .doc(messageId)
          .update({
            "text": "Message was Deleted",
            "type": "text",
            "repliedMessageType": "",
            "repliedMessage": "",
          });
      log("${username}newaa");
      // sendDeleTextMessage(
      //     reciverUserToken: reciverUserTokens,
      //     context: context,
      //     reciverUserId: recieverUserId,
      //     reciverUserName: username,
      //     reciverprofilpix: profilePic,
      //     messageReply: messageReply,
      //     text: "this Message was Deleted");
    } catch (e) {
      // showSnackBar(context: context, content: e.toString());
    }
  }

  Future<void> updateBlockTime(String userId, DateTime blockTime) async {
    await firestore
        .collection('user')
        .doc(userId)
        .collection('chart')
        .doc('controller.getUserID.value')
        .update({'blockTime': blockTime});
  }

  Future<void> removeBlockTime(String userId) async {
    await firestore
        .collection('user')
        .doc(userId)
        .collection('chart')
        .doc('controller.getUserID.value')
        .update({'blockTime': null});
  }

  Future<void> updateUserOnlinStatuse({
    required String currentUserId,
    required bool isonlin,
  }) async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance
              .collectionGroup('chart')
              .where('contactId', isEqualTo: currentUserId)
              .get();

      final batch = FirebaseFirestore.instance.batch();

      for (final document in querySnapshot.docs) {
        batch.update(document.reference, {'isonlin': isonlin});
      }

      await batch.commit();
      log('Fields updated successfully.');
    } catch (e) {
      log('Error updating fields: $e');
    }
  }

  // Future<String> sendNotification(
  //     String receiverId, String messageId, String authToken) async {
  //   log("Notification");
  //   const url =
  //       'https://us-central1-nack-a842e.cloudfunctions.net/sendNotification';

  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization':
  //             'Bearer $authToken', // Pass the auth token in the Authorization header
  //       },
  //       body: jsonEncode({
  //         'receiverId': receiverId,
  //         'messageId': messageId,
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       log("Notification sent successfully");
  //       return 'Notification sent successfully';
  //     } else {
  //       return 'Error sending notification: ${response.reasonPhrase}';
  //     }
  //   } catch (e) {
  //     // Handle the exception
  //     log('Error sending notification: $e');
  //     return 'Error sending notification: $e';
  //   }
  // }

  // Future<void> sendNotification(String receiverId, String messageId) async {
  //   try {
  //     // Get the current user's ID token
  //     final currentUser = FirebaseAuth.instance.currentUser;
  //     final idToken = await currentUser!.getIdToken();

  //     log("Token:$idToken");

  //     // Call the Firebase Cloud Function to send the notification
  //     final HttpsCallable callable = FirebaseFunctions.instanceFor(
  //       app: Firebase.app(),
  //       region: 'us-central1',
  //     ).httpsCallable('sendNotification');

  //     final response = await callable.call({
  //       'receiverId': receiverId,
  //       'messageId': messageId,
  //       'idToken': idToken.toString(),
  //     });

  //     print('Cloud Function Response: ${response.data}');
  //   } on FirebaseFunctionsException catch (e) {
  //     print('Firebase Cloud Function Error: $e');
  //     return;
  //   } catch (e) {
  //     print('Unknown Error: $e');
  //     return;
  //   }
  // }

  void configureLocalNotifications() {
    // Configure local notifications here
  }
}
