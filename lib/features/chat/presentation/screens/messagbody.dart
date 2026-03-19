import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/local_store/User_localdata_provider.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/data/provider/chat_provier.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/get_list_message.dart';
import 'package:curnectgate/features/chat/data/provider/typingindicator_provider.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/messagesBubbles.dart';
import 'package:curnectgate/features/chat/services/reverb_service.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/operations/violation/screens/reportViolation.dart';
import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MessageScreens extends ConsumerStatefulWidget {
  final String profileUrl;
  final String userFullName;
  final int id;
  final String userRole;
  final String isOnline;

  const MessageScreens({
    super.key,
    required this.id,
    required this.profileUrl,
    required this.userFullName,
    required this.userRole,
    required this.isOnline,
  });

  @override
  ConsumerState<MessageScreens> createState() => _MessageScreenState();
}

class _MessageScreenState extends ConsumerState<MessageScreens> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  /// Chat channel & subscriptions
  PrivateChannel? _chatChannel;
  StreamSubscription<ChannelReadEvent>? _messageSubscription;
  StreamSubscription<ChannelReadEvent>? _typingSubscription;
  StreamSubscription? _connectivitySub;

  bool _initialJumpDone = false;

  @override
  void initState() {
    super.initState();

    /// 1️⃣ Subscribe to this chat's real-time channel

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ReverbService.subscribeChat(chatId: widget.id, ref: ref);

      markAsRead();
    });

    /// 2️⃣ Retry pending messages on connectivity restore
    _connectivitySub = Connectivity().onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none) {
        ref
            .read(messagesProvider(widget.id).notifier)
            .retryPendingMessages(context);
      }
    });
  }

  /// Jump to bottom without animation
  void _jumpToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
      markAsRead();
    }
  }

  void markAsRead() {
    ref.read(formProvider.notifier).markMessageRead(ref: ref, id: widget.id);
  }

  void onTextChanged(String text) {
    final authState = ref.watch(authProvider);

    final user = authState.user;

    final userId = user?["id"] ?? "";
    final isTyping = text.isNotEmpty;

    // Update local typing state for self
    ref
        .read(typingStatusProvider(widget.id).notifier)
        .updateTyping(userId, isTyping);

    // Send typing event to Reverb
    // ReverbService.sendTyping(
    //   chatId: widget.id,
    //   userId: userId,
    //   isTyping: isTyping,
    // );
  }

  Widget _buildTypingIndicator(int chatId) {
    final typingUsers = ref.watch(typingStatusProvider(chatId));
    if (typingUsers.isEmpty) return const SizedBox.shrink();

    // final names = typingUsers.entries
    //     .where((e) => e.value)
    //     .map((e) => "User ${e.key}") // replace with actual user names if you have
    //     .join(", ");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "${widget.userFullName} typing...",
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  /// Scroll to bottom with animation
  void _scrollToBottomAnimated() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    _messageSubscription?.cancel();
    _typingSubscription?.cancel();
    _connectivitySub?.cancel();
    _chatChannel?.unsubscribe();
    ReverbService.unsubscribeChat();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncMessages = ref.watch(messagesProvider(widget.id));
    final chatNotifier = ref.read(chatProvider.notifier);
    final authState = ref.watch(authProvider);

    final user = authState.user;

    final userId = user?["id"] ?? "";

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                asyncMessages.when(
                  skipLoadingOnReload: true,
                  data: (messages) {
                    if (!_initialJumpDone) {
                      _initialJumpDone = true;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _jumpToBottom();
                      });
                    }

                    final List<dynamic> items = [];
                    String? lastDate;

                    for (final m in messages ?? []) {
                      DateTime created;
                      try {
                        created = DateTime.parse(m.createdAt ?? "");
                      } catch (_) {
                        created = DateTime.now();
                      }

                      final label = _formatMessageDate(created);
                      if (lastDate != label) {
                        items.add(label);
                        lastDate = label;
                      }
                      items.add(m);
                    }

                    return ListView.builder(
                      controller: _scrollController,
                      reverse: true,
                      padding: const EdgeInsets.only(bottom: 100, top: 10),
                      itemCount: items.length,
                      itemBuilder: (_, i) {
                        final item = items[items.length - 1 - i];
                        if (item is String) {
                          return _buildDateHeader(item);
                        }
                        return ChatBubble(message: item);
                      },
                    );
                  },
                  loading:
                      () => ListView(
                        controller: _scrollController,
                        reverse: true,
                        children: [_buildHeaderInfo()],
                      ),
                  error:
                      (_, __) => ListView(
                        controller: _scrollController,
                        reverse: true,
                        children: [_buildHeaderInfo()],
                      ),
                ),
              ],
            ),
          ),
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   bottom: 70, // above input
          //   child: _buildTypingIndicator(widget.id),
          // ),
          SafeArea(child: _buildMessageInput(chatNotifier, userId)),
        ],
      ),
    );
  }

  // AppBar, header, date header, and input remain the same

  Widget _buildMessageInput(ChatNotifier chatNotifier, int userId) {
    return SizedBox(
      height: 60,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.add_circle,
                size: 30,
                color: AppColors.instance.black300,
              ),
              onPressed: () async {
                showUserBottomSheet(
                  context: context,
                  headertitle: "Upload file",
                  headersubtitle: "Attach image from your gallery",
                  ref: ref,
                  bottom: BottomSheetView.messageuplodefile,
                  id: widget.id,
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
                onChanged: (text) {
                  // Send typing indicator
                  onTextChanged(text);
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: AppColors.instance.black600),
              onPressed: () {
                if (_textController.text.trim().isNotEmpty ||
                    ref.read(chatProvider).selectedImage != null ||
                    ref.read(chatProvider).selectedFilePath != null) {
                  ref
                      .read(messagesProvider(widget.id).notifier)
                      .sendMessage(
                        context: context,
                        text: _textController.text.trim(),
                        file: null,
                      );
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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final double avatarSize = MediaQuery.of(context).size.width * 0.12;
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: AppColors.instance.black600),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          const Spacer(),
          IconButton(
            icon: Icon(Icons.call, color: AppColors.instance.black600),
            onPressed: () {
              showUserBottomSheet(
                context: context,
                headertitle: "",
                headersubtitle: "",
                ref: ref,
                id: widget.id,
                bottom: BottomSheetView.residentEmgencyContacts,
              );
              // showUserBottomSheet(
              //   context: context,
              //   headertitle: "Have an emergency?",
              //   headersubtitle: "Call this emergency contact",
              //   ref: ref,
              //   bottom: BottomSheetView.messageEmergency,
              // );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings, color: AppColors.instance.black600),
            onPressed: () {
              showUserBottomSheet(
                context: context,
                headertitle: "",
                headersubtitle: "",
                ref: ref,
                bottom: BottomSheetView.chatSettings,
              );
            },
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
                backgroundColor: Colors.grey.shade200,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: widget.profileUrl,
                    width: avatarSize,
                    height: avatarSize,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Loadingstates(),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.person),
                  ),
                ),
              ),

              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contexr) => ReportViolation(),
                          ),
                        ),
                    child: Row(
                      children: [
                        Text(
                          widget.userFullName,
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
                          decoration: BoxDecoration(
                            color:
                                widget.isOnline.toLowerCase().contains("online")
                                    ? AppColors.instance.teal500
                                    : AppColors.instance.grey400,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.userRole,
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

  //   Widget _buildFilePreview(ChatState chatState) {
  //     final filePath = chatState.selectedFilePath;
  //     final fileName = chatState.selectedFileName;
  //     final fileSize = chatState.selectedFileSize;

  //     if (filePath == null) return const SizedBox.shrink();

  //     return GestureDetector(
  //       onTap: () => OpenFilex.open(filePath),
  //       child: Container(
  //         padding: const EdgeInsets.all(12),
  //         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //         decoration: BoxDecoration(
  //           color: Colors.grey[200],
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         child: Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             // Icon(_getFileIcon(fileName), color: Colors.blueAccent, size: 32),
  //             const SizedBox(width: 10),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   fileName ?? "Unknown file",
  //                   style: const TextStyle(fontWeight: FontWeight.w600),
  //                 ),
  //                 const SizedBox(height: 4),
  //                 Text(
  //                   "    _formatFileSize(fileSize),",
  //                   style: TextStyle(color: Colors.grey[600], fontSize: 12),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
}
