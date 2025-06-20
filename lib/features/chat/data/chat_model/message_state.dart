class ChatState {
  final List<ChatMessage> messages;
  final String? selectedImage;
  final String? selectedFilePath;
  final String? selectedFileName;
  final int? selectedFileSize;

  ChatState({
    required this.messages,
    this.selectedImage,
    this.selectedFilePath,
    this.selectedFileName,
    this.selectedFileSize,
  });
  ChatState copyWith({
    List<ChatMessage>? messages,
    bool removeImage = false,
    bool removeFile = false,
    bool removefilename = false,
    bool removefileZise = false,
    String? selectedImage,
    String? selectedFilePath,
    String? selectedFileName,

    int? selectedFileSize,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      selectedImage: removeImage ? null : (selectedImage ?? this.selectedImage),
      selectedFilePath:
          removeFile ? null : (selectedFilePath ?? this.selectedFilePath),
      selectedFileName:
          removefilename ? null : (selectedFileName ?? this.selectedFileName),
      selectedFileSize:
          removefileZise ? null : (selectedFileSize ?? this.selectedFileSize),
    );
  }
}

class ChatMessage {
  final String text;
  final String? image;
  final String? file;
  final DateTime time;
  final String? selectedFileName;
  final int? selectedFileSize;

  final bool isMe;

  ChatMessage({
    required this.text,
    this.image,
    this.file,
    this.selectedFileName,
    this.selectedFileSize,
    required this.time,
    required this.isMe,
  });
}
