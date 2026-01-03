import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatMessageInput extends ConsumerStatefulWidget {
  final String type;
  final String id;
  final VoidCallback onSendPressed;
  final Function(String) onMessageChanged;

  const ChatMessageInput({
    super.key,
    required this.onSendPressed,
    required this.onMessageChanged,
    required this.id,
    required this.type
  });

  @override
  ConsumerState<ChatMessageInput> createState() => _ChatMessageInputState();
}

class _ChatMessageInputState extends ConsumerState<ChatMessageInput> {
  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTyping = _controller.text.trim().isNotEmpty;
      });
      widget.onMessageChanged(_controller.text.trim());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_isTyping) {
      widget.onSendPressed();

      ref
          .read(formProvider.notifier)
          .initialisMessage(
            context: context,
            message: _controller.text.trim(),
            id: widget.id,
            type: widget.type,
            ref: ref,
          );
      _controller.clear();
      setState(() => _isTyping = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Optional: Attach button (photos, files, etc.)
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.attach_file, color: AppColors.instance.black400),
          // ),

          // Message TextField
          Expanded(
            child: TextField(
              controller: _controller,
              minLines: 1,
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(),
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 15,
                color: AppColors.instance.black600,
              ),
              decoration: InputDecoration(
                hintText: "Type your message...",
                hintStyle: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 15,
                  color: AppColors.instance.black300,
                ),
                filled: true,
                fillColor: AppColors.instance.grey200,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(
                    color: AppColors.instance.teal400,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 15),

          // Send Button — only visible when typing
          AnimatedOpacity(
            opacity: _isTyping ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _isTyping ? 48 : 0,
              child: FloatingActionButton(
                mini: true,
                onPressed: _sendMessage,
                backgroundColor: AppColors.instance.teal400,
                elevation: 4,
                child: Icon(
                  Icons.send_rounded,
                  size: 20,
                  color: AppColors.instance.grey200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
