import 'dart:developer';
import 'dart:io';
import 'package:curnectgate/features/chat/data/chat_model/message_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveMigration {
  static Future<void> migrateMessages() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      
      // Step 1: Check if old box exists
      final oldBoxFile = File('${appDir.path}/chat_messages.hive');
      if (!await oldBoxFile.exists()) return;

      // Step 2: Open both boxes
      final oldBox = await Hive.openBox('chat_messages');
      final newBox = await Hive.openBox<Messages>('chat_messages_new');

      // Step 3: Migrate data
      for (var key in oldBox.keys) {
        final oldMsg = oldBox.get(key);
        if (oldMsg is Map) {  // Handle raw untyped data
          newBox.put(key, Messages(
            senderID: oldMsg['senderID'],
            reciverID: oldMsg['reciverID'],
           
      text: oldMsg['text'],
      type: oldMsg['type'],
      messageId: oldMsg['messageId'] ,
      isSeen: oldMsg['isSeen'],
      timeSend:oldMsg['timeSend'],
      senderusername:oldMsg['senderusername'],
      reciverusername: oldMsg['reciverusername'],
      repliedMessage: oldMsg['repliedMessage'] ?? '',
      repliedTo: oldMsg['repliedTo'],
      repliedMessageType: oldMsg['repliedMessageType'],
      isFailed: oldMsg['isFailed'],

            // ... map all other fields ...
            isReceiverCopy: key.toString().contains('-receiver'),
          ));
        }
      }

      // Step 4: Close and delete old box
      await oldBox.close();
      await oldBoxFile.delete();

      // Step 5: Rename new box by moving files
      final newBoxFile = File('${appDir.path}/chat_messages_new.hive');
      await newBoxFile.rename('${appDir.path}/chat_messages.hive');

      // Step 6: Reopen with correct name
      await Hive.openBox<Messages>('chat_messages');
      
    } catch (e) {
      log('Migration failed: $e');
      // Consider keeping both boxes as fallback
    }
  }
}