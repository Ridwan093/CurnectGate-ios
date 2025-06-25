import 'package:curnectgate/features/chat/presentation/controllers/chat_controller.dart';
import 'package:curnectgate/features/chat/presentation/screens/messagescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String profileUrl;
  final String username;
  final String userId;

  const ChatScreen(this.profileUrl, this.username, this.userId, {super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final messageController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void sendMessages({
    required WidgetRef ref,
    required BuildContext context,
    required String messages,
  }) {
    ref
        .read(chatControllerProvider)
        .sendTextMessage(
          context: context,
          text: messages,
          reciverUserId: widget.userId,
          reciverprofilpix: widget.profileUrl,
          reciverName: widget.username,
          muted: false,
          age: "30",
          gender: "male",
          p1: "",
          p2: "",
          p3: "",
          callID: "",
          reciverTokens: ['uwyuyweuywuywuywe', "jdjdwjwjhwdjdwjhwj"],
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        backgroundColor: Colors.greenAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 27,
              backgroundImage: NetworkImage(widget.profileUrl),
            ),
            const SizedBox(width: 10),
            Text(widget.username),
          ],
        ),
      ),

      body: SizedBox(
        height: size.height,
        width: size.width,
        child: MessageScreen(
          chatId: widget.userId,
          inputField: SizedBox(
            height: 60,
            width: MediaQuery.sizeOf(context).width,

            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2 + 110,

                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "type message......",
                    ),
                    controller: messageController,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (messageController.text.isEmpty) return;

                    sendMessages(
                      ref: ref,
                      context: context,
                      messages: messageController.text.trim(),
                    );
                    messageController.clear();
                  },
                  child: Container(
                    margin: EdgeInsets.all(6),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Icon(Icons.send, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
