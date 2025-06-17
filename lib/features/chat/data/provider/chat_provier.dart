// Riverpod provider for chat state
import 'dart:developer';

import 'package:curnectgate/features/chat/data/chat_model/chat_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  return ChatNotifier();
});

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier() : super(ChatState(messages: [], selectedImage: null));

  void sendMessage(String text) {
    if (text.isEmpty && state.selectedImage == null) return;

    final newMessage = ChatMessage(
      text: text,
      image: state.selectedImage,
      time: DateTime.now(),
      isMe: true,
    );
    state = state.copyWith(
      messages: [...state.messages, newMessage],
      selectedImage: null,
    );
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
    state = state.copyWith(removeImage: true);
    log("State after clearing: ${state.selectedImage}");
  }
}
