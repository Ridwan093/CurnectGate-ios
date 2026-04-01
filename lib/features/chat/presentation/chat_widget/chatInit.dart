import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/messageInitializeInput.dart';
import 'package:flutter/material.dart';

class ChatInitialMessage extends StatelessWidget {
  final String recipientName; // e.g. "Estate Manager" or "John Doe"
  final String recipientRole; // e.g. "Estate Admin" or "Security"
  final String estateName; // e.g. "Medina Estate"
  final String id;
  final String type;
  const ChatInitialMessage({
    super.key,
    required this.recipientName,
    required this.recipientRole,
    required this.estateName,
    required this.id,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Branded Icon / Avatar
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.instance.teal100,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.instance.teal400.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Icon(
                Icons.chat_bubble_outline_rounded,
                size: 48,
                color: AppColors.instance.teal400,
              ),
            ),

            const SizedBox(height: 32),

            // Welcome Title
            Text(
              "Welcome to your chat with",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 18,
                color: AppColors.instance.black400,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 8),

            // Recipient Name (highlighted)
            Text(
              recipientName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.instance.black600,
              ),
            ),

            const SizedBox(height: 6),

            // Role + Estate
            Text(
              "${recipientRole.replaceAll("-", " ")}. • $estateName",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 15,
                color: AppColors.instance.black400,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 24),

            // Helpful Message
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.instance.teal100,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.instance.teal300.withOpacity(0.3),
                ),
              ),
              child: Text(
                "Feel free to ask about maintenance, security, payments, events, or anything related to your estate. We're here to help!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 14,
                  color: AppColors.instance.black600,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Optional: subtle hint
            Text(
              "Start typing below to send your first message",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontSize: 13,
                color: AppColors.instance.black300,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.bottomCenter,
              child: ChatMessageInput(
                type: type,
                id: id,
                recipientName: recipientName,
                recipientRole: recipientRole,
                onMessageChanged: (text) {
                  // Optional: save draft, update state, etc.
                },
                onSendPressed: () {
                  // Your send logic
                  // final message = _controller.text.trim();
                  // if (message.isNotEmpty) {
                  //   // Send message to API / Riverpod
                  //   ref.read(chatProvider.notifier).sendMessage(message);
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
