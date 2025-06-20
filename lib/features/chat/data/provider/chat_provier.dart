// Riverpod provider for chat state
import 'dart:developer';

import 'package:curnectgate/features/chat/data/provider/%20chat_list_provider.dart';
import 'package:curnectgate/features/chat/data/chat_model/message_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  return ChatNotifier();
});

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier() : super(ChatState(messages: [], selectedImage: null));

  void sendMessage(String text, WidgetRef ref ) {
    if (text.isEmpty &&
        state.selectedImage == null &&
        state.selectedFilePath == null) {
      return;
    }
   
    final newMessage = ChatMessage(
      text: text,
      image: state.selectedImage,
      file: state.selectedFilePath,
      selectedFileName: state.selectedFileName,

      selectedFileSize: state.selectedFileSize,

      time: DateTime.now(),
      isMe: false,
    );
    log("hell${newMessage.selectedFileSize}");
    state = state.copyWith(
      messages: [...state.messages, newMessage],
      selectedImage: null,
      selectedFilePath: null,
    );
     ref.read(chatListProvider.notifier).updateFromChatState(state);
  }
  

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      state = state.copyWith(selectedImage: pickedFile.path);
    }
  }

  Future<void> pickImagefromcamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      state = state.copyWith(selectedImage: pickedFile.path);
    }
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
    );

    if (result != null && result.files.single.path != null) {
      final file = result.files.single;
      state = state.copyWith(
        selectedFilePath: file.path,
        selectedFileName: file.name,
        selectedFileSize: file.size, // in bytes
      );
    }
  }

  void clearImage() {
    log("Clearing image...");
    state = state.copyWith(
      removeImage: true,
      removeFile: true,
      removefileZise: true,
      removefilename: true,
    );
    log("State after clearing: ${state.selectedImage}");
  }
}
