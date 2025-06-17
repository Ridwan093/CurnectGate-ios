import 'package:curnectgate/features/chat/data/chat_model/message_model.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/messageBubble.dart';
import 'package:curnectgate/features/chat/presentation/controllers/chat_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MessageScreen extends ConsumerStatefulWidget {
  final String chatId;
  final Widget inputField;

  const MessageScreen({
    super.key,
    required this.chatId,
    required this.inputField,
  });

  @override
  ConsumerState<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends ConsumerState<MessageScreen> {
  final ScrollController _scrollController = ScrollController();
  final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  List<Messages> messages = [];

  @override
  void initState() {
    super.initState();
    _setupMessageListener();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  void _setupMessageListener() {
    final messageStream = ref
        .read(chatControllerProvider)
        .chatStream(widget.chatId);

    messageStream.listen(
      (messages) {
        if (mounted) {
          setState(() {
            messages = messages;
            _scrollToBottomIfNeeded();
          });
        }
      },
      onError: (error) {
        debugPrint('Message stream error: $error');
      },
    );
  }

  void _scrollToBottomIfNeeded() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients &&
          _scrollController.position.maxScrollExtent > 0) {
        _scrollController.jumpTo(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<List<Messages>>(
            stream: ref.read(chatControllerProvider).chatStream(widget.chatId),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final messages = snapshot.data!;

              // Ensure messages are sorted oldest to newest
              messages.sort((a, b) => a.timeSend.compareTo(b.timeSend));
               if (_scrollController.hasClients) {
            ///Another exception was thrown: Looking up a deactivated widget's ancestor is unsafe.
            SchedulerBinding.instance.addPostFrameCallback((_) {
              return _scrollController
                  .jumpTo(_scrollController.position.maxScrollExtent);
            });
          }

              return NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  // Auto-scroll to bottom when new messages arrive
                  if (notification is ScrollEndNotification &&
                      _scrollController.position.pixels ==
                          _scrollController.position.maxScrollExtent) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    });
                  }
                  return false;
                },

                child: ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: false, // Changed from true to false
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 8),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return Align(
                      alignment:
                          message.senderID == currentUserId
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: MessageBubble(
                          key: ValueKey(message.messageId),
                          message: message,
                          isCurrentUser: message.senderID == currentUserId,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        widget.inputField,
      ],
    );
  }
}
