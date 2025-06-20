import 'package:curnectgate/features/chat/presentation/screens/chat_list_screen.dart';

import 'package:curnectgate/features/estate_management/screen_managment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityScreen extends BaseVerificationScreen {
  const CommunityScreen({super.key})
    : super(
        currentStep: 4,
        totalSteps: 5,
        title: "Hi Sam!👋🏻",
        description: 'Start a Conversation',
      );

  @override
  ConsumerState<CommunityScreen> createState() => _SignInState();
}

class _SignInState extends ConsumerState<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return _biuldbody(size);
  }

  Widget _biuldbody(Size size) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: ChatListScreen(widget.title, widget.description),
    );
  }
}
