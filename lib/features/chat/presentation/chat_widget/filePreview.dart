import 'dart:io';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/data/provider/chat_provier.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/get_list_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChatPreviewScreen extends ConsumerStatefulWidget {
  final int conversationId;

  const ChatPreviewScreen({super.key, required this.conversationId});

  @override
  ConsumerState<ChatPreviewScreen> createState() => _ChatPreviewScreenState();
}

class _ChatPreviewScreenState extends ConsumerState<ChatPreviewScreen> {
  final TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);
    final chatNotifier = ref.read(chatProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.close, color: AppColors.instance.grey200),
          onPressed: () {
            context.pop();
            chatNotifier.clearImage();
            context.pop();
            // closeAllBottomSheets(context);
          },
        ),
        actions: [_buildPopUp(chatNotifier)],
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              /// PREVIEW AREA
              Expanded(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 80,
                    ),
                    child: Center(child: _buildPreview(chatState)),
                  ),
                ),
              ),

              /// INPUT AREA
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: _buildInputArea(chatNotifier),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInputArea(ChatNotifier chatNotifier) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: Colors.black,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: _captionController,
                style: const TextStyle(color: Colors.white),
                maxLines: 4,
                minLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Add caption…",
                  hintStyle: TextStyle(color: AppColors.instance.black300),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          GestureDetector(
            onTap: () async {
              final pdf = ref.read(chatProvider).selectedFilePath;
              final image = ref.read(chatProvider).selectedImage;

              if (image != null) {
                ref
                    .read(messagesProvider(widget.conversationId).notifier)
                    .sendMessage(
                      context: context,
                      text: _captionController.text.trim(),
                      file: File(image),
                    );
              } else if (pdf != null) {
                ref
                    .read(messagesProvider(widget.conversationId).notifier)
                    .sendMessage(
                      context: context,
                      text: _captionController.text.trim(),
                      file: File(pdf),
                    );
              }
              context.pop();
              chatNotifier.clearImage();
              context.pop();
            },
            child: CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.instance.teal300,
              child: Icon(Icons.send, color: AppColors.instance.grey200),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopUp(ChatNotifier state) {
    return PopupMenuButton<String>(
      iconColor: AppColors.instance.grey200,
      color: AppColors.instance.grey200,
      onSelected: (value) {
        if (value == 'gallery') {
          pickFromGallery(state);
        } else if (value == 'file') {
          pickFromFile(state);
        } else if (value == 'camera') {
          pickFromCamera(state);
        }
      },
      itemBuilder:
          (BuildContext context) => [
            PopupMenuItem(
              value: 'gallery',
              child: ListTile(
                leading: Icon(Icons.photo, color: AppColors.instance.black500),
                title: Text(
                  'Choose from Gallery',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black500,
                  ),
                ),
              ),
            ),
            PopupMenuItem(
              value: 'file',
              child: ListTile(
                leading: Icon(
                  Icons.insert_drive_file,
                  color: AppColors.instance.black500,
                ),
                title: Text(
                  'Choose from File',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black500,
                  ),
                ),
              ),
            ),
            PopupMenuItem(
              value: 'camera',
              child: ListTile(
                leading: Icon(
                  Icons.camera_alt,
                  color: AppColors.instance.black500,
                ),
                title: Text(
                  'Take Photo',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black500,
                  ),
                ),
              ),
            ),
          ],
    );
  }

  void pickFromGallery(ChatNotifier chatNotifier) async {
    await chatNotifier.pickImage(context, widget.conversationId);
  }

  void pickFromFile(ChatNotifier chatNotifier) async {
    await chatNotifier.pickFile(context, widget.conversationId);
  }

  void pickFromCamera(ChatNotifier chatNotifier) async {
    await chatNotifier.pickImagefromcamera(context, widget.conversationId);
    print("Open camera");
  }

  Widget _buildPreview(chatState) {
    final image = chatState.selectedImage;
    final fileName = chatState.selectedFileName;

    /// IMAGE PREVIEW
    if (image != null) {
      return InteractiveViewer(
        child: Image.file(File(image), fit: BoxFit.contain),
      );
    }

    /// PDF / FILE PREVIEW
    if (fileName != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.picture_as_pdf,
            size: 120,
            color: AppColors.instance.grey200,
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              fileName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.instance.grey200,
                fontFamily: FontFamilies.interDisplay,
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            _formatFileSize(chatState.selectedFileSize),
            style: const TextStyle(color: Colors.white54, fontSize: 14),
          ),
        ],
      );
    }

    return const SizedBox();
  }

  String _formatFileSize(int? sizeInBytes) {
    if (sizeInBytes == null) return '';
    if (sizeInBytes < 1024) return '$sizeInBytes B';
    if (sizeInBytes < 1024 * 1024)
      return '${(sizeInBytes / 1024).toStringAsFixed(1)} KB';
    return '${(sizeInBytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
