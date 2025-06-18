import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/data/chat_model/chat_state.dart';
import 'package:curnectgate/features/chat/data/provider/chat_provier.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/displayFileCard.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/displayimage.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/messagesBubbles.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/widget/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';

class MessageScreens extends ConsumerStatefulWidget {
  const MessageScreens({super.key});

  @override
  ConsumerState<MessageScreens> createState() => _MessageScreenState();
}

class _MessageScreenState extends ConsumerState<MessageScreens> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add initial messages for testing
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(chatProvider.notifier).sendMessage("Hello!");
      ref.read(chatProvider.notifier).sendMessage("How are you?");
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final chatState = ref.watch(chatProvider);
    final chatNotifier = ref.watch(chatProvider.notifier);
    final image = ref.read(chatProvider).selectedImage;
    final file = chatState.selectedFileName;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(child: _buildMessageList(chatState)),
                _buildMessageInput(chatNotifier),
              ],
            ),

            if (image != null || file != null) ...[
              _buildImagePreview(chatState),
              _buildimageClearbutton(chatNotifier),
            ],
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: AppColors.instance.black600),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          const Spacer(),
          IconButton(
            icon: Icon(Icons.call, color: AppColors.instance.black600),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: AppColors.instance.black600),
            onPressed: () {},
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(AssetPaths.userAvatar2),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontWeight: FontFamilies.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Estate Committee',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black300,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'All conversations are secured and protected by Curnectgate. Keep conversations within the community guidelines.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: AppColors.instance.black400,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildMessageList(ChatState chatState) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    final groupedMessages = <String, List<ChatMessage>>{};

    for (var message in chatState.messages) {
      final dateLabel = _formatMessageDate(message.time);
      groupedMessages.putIfAbsent(dateLabel, () => []).add(message);
    }

    final items = <Widget>[_buildHeaderInfo()];

    groupedMessages.forEach((dateLabel, messages) {
      items.add(_buildDateHeader(dateLabel));
      items.addAll(messages.map((msg) => ChatBubble(message: msg)));
    });

    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 8),
      children: items,
    );
  }

  Widget _buildImagePreview(ChatState chatState) {
    final image = chatState.selectedImage;
    final fileName = chatState.selectedFileName;

    if (image != null) {
      // Show image preview
      return DisplayImage(chatState: chatState);
    } else if (fileName != null) {
      // Show file info
      return DisplayFilecard(chatState: chatState);
    } else {
      // No file or image selected
      return SizedBox.shrink();
    }
  }

  Widget _buildimageClearbutton(ChatNotifier chatNotifier) {
    return Positioned(
      bottom: 48,
      right: 6,
      child: GestureDetector(
        onTap: () {
          chatNotifier.clearImage();
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.instance.black300,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.close, size: 16, color: AppColors.instance.grey200),
        ),
      ),
    );
  }

  String _formatMessageDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(date.year, date.month, date.day);

    if (messageDate == today) {
      return 'Today';
    } else if (messageDate == today.subtract(Duration(days: 1))) {
      return 'Yesterday';
    } else {
      return DateFormat('MMMM d, yyyy').format(date);
    }
  }

  Widget _buildDateHeader(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.instance.grey200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black400,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput(ChatNotifier chatNotifier) {
    return SizedBox(
      height: 60,
      width: MediaQuery.sizeOf(context).width,

      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.add_circle,
                size: 30,
                color: AppColors.instance.black300,
              ),
              onPressed: () async {
                // await chatNotifier.pickImage();
                // _focusNode.unfocus();
                showUserBottomSheet(
                  context: context,
                  headertitle: "Upload file",
                  headersubtitle: "Attache image from your gallery",
                  ref: ref,
                  bottom: BottomSheetView.messageuplodefile,
                );
              },
            ),
            Expanded(
              child: TextField(
                controller: _textController,
                focusNode: _focusNode,
                minLines: 1,
                maxLines: 5,

                decoration: InputDecoration(
                  hintText: 'Write a message',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.instance.black500,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.instance.black500,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: AppColors.instance.grey200,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: AppColors.instance.black600),
              onPressed: () {
                if (_textController.text.trim().isNotEmpty ||
                    ref.read(chatProvider).selectedImage != null||  ref.read(chatProvider).selectedFilePath != null) {
                  chatNotifier.sendMessage(_textController.text);
                  _textController.clear();
                  chatNotifier.clearImage();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilePreview(ChatState chatState) {
    final filePath = chatState.selectedFilePath;
    final fileName = chatState.selectedFileName;
    final fileSize = chatState.selectedFileSize;

    if (filePath == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () => OpenFilex.open(filePath),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon(_getFileIcon(fileName), color: Colors.blueAccent, size: 32),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName ?? "Unknown file",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  "    _formatFileSize(fileSize),",
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
