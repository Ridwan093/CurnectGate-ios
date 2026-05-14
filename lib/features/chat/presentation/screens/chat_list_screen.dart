import 'dart:async';
import 'dart:developer';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/data/model/conversation.dart';
import 'package:curnectgate/features/chat/data/provider/%20chat_list_provider.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/get_conversation_provider.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/unread_counts_provider.dart';
import 'package:curnectgate/features/chat/data/provider/search_provider.dart';
import 'package:curnectgate/features/chat/presentation/chat_widget/conversation_tile.dart';
import 'package:curnectgate/features/chat/services/reverb_service.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/local_store/User_localdata_provider.dart';

class ChatListScreen extends ConsumerStatefulWidget {
  final String title;
  final String description;
  const ChatListScreen(this.title, this.description, {super.key});

  @override
  ConsumerState<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends ConsumerState<ChatListScreen> {
  void _openChatOption(WidgetRef ref, BuildContext context) {
    showUserBottomSheet(
      context: context,
      headertitle: "Star a conversation",
      headersubtitle: "A team typicall replies in less than a minute",
      ref: ref,
      bottom: BottomSheetView.startConversation,
    );
  }

  StreamSubscription<ChannelReadEvent>? _globalSub;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(conversationListProvider.notifier).refreshConversations();
      await ref.read(unreadCountsProvider.notifier).refreshCounts();
      
      if (!mounted) return;

      final authState = ref.read(authProvider);
      
      final user = authState.user;
      final userId = user?["id"] ?? "";
      log("Ok let seee if you log ot not we see :${userId}");
      await ReverbService.setupGlobalListener(userId, ref);
    });
  }

  @override
  void dispose() {
    _globalSub?.cancel();
    super.dispose();
  }

  Participant? _getOtherParticipant(Conversation conv, dynamic currentUserId) {
    if (conv.participants == null || conv.participants!.isEmpty) return null;
    try {
      return conv.participants!.firstWhere(
        (p) => p.userId?.toString() != currentUserId?.toString(),
      );
    } catch (_) {
      return conv.participants!.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchProvider);
    final conversations = ref.watch(conversationListProvider);
    final role = ref.watch(userRoleProvider);

    final authState = ref.watch(authProvider);
    final currentUserId = authState.user?["id"];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      floatingActionButton:
          searchState.isSearching
              ? const SizedBox.shrink()
              : role.when(
                data: (data) {
                  if (data.isNotEmpty) {
                    if (data.toLowerCase().contains("security_personnel")) {
                      return SizedBox();
                    } else {
                      return _buildAction(ref, context);
                    }
                  } else {
                    return SizedBox();
                  }
                },
                error: (Object error, StackTrace stackTrace) {
                  return SizedBox();
                },
                loading: () {
                  return SizedBox();
                },
              ),
      appBar: searchState.isSearching ? null : _buildAppBar(),

      body: RefreshIndicator(
        color: AppColors.instance.yellow500,
        onRefresh: () async {
          // Pull-to-refresh → force API sync
          await ref
              .read(conversationListProvider.notifier)
              .refreshConversations();
        },
        child: Builder(
          builder: (context) {
            if (conversations.isEmpty) {
              return _buildEmptyBody(
                title: widget.title,
                description: widget.description,
                context: context,
                ref: ref,
              );
            }

            // Filter if searching
            final filtered =
                searchState.query.isEmpty
                    ? conversations
                    : ref
                        .read(coversationSearchProvider.notifier)
                        .search(
                          searchState.query,
                        ); // Keep your existing search logic

            return Stack(
              children: [
                Column(
                  children: [
                    _buildSearchEnging(ref),
                    SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 80),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final conversation = filtered[index];
                          return ConversationTile(
                            conversation: conversation,
                            onTap: () {
                              final other = _getOtherParticipant(
                                conversation,
                                currentUserId,
                              );
                              _navigateToChat(
                                context: context,
                                isOnline: other?.onlineStatus ?? "",
                                url: other?.avatarUrl ?? "",
                                userFullName: other?.fullName ?? "",
                                userRole: other?.role ?? "",
                                id: conversation.id ?? 0,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),

                // Search Overlay (keep your existing)
                if (searchState.isSearching)
                  _buildSearchOverlay(context, ref, currentUserId),
              ],
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: true, // Keeps back button if needed
      flexibleSpace: SafeArea(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              0,
              16,
              16,
            ), // Bottom padding for title
            child: Text(
              "All messages",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
              ),
            ),
          ),
        ),
      ),
      toolbarHeight: 80, // Gives space for large title
    );
  }

  Widget _buildSearchOverlay(
    BuildContext context,
    WidgetRef ref,
    dynamic currentUserId,
  ) {
    final searchState = ref.watch(searchProvider);
    final filteredConversations = ref
        .read(coversationSearchProvider.notifier)
        .search(searchState.query);

    return Positioned.fill(
      child: Container(
        color: AppColors.instance.black600.withOpacity(1),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.instance.black300,
                ),
                onPressed:
                    () => ref.read(searchProvider.notifier).clearSearch(),
              ),
              title: TextField(
                autofocus: true,

                style: TextStyle(color: AppColors.instance.grey200),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.instance.black300,
                    ), // Default border color
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.instance.black300,
                    ), // Default border color
                  ),
                  hintText: 'Search messages...',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(.5),
                    fontFamily: FontFamilies.interDisplay,
                  ),
                ),
                onChanged:
                    (value) =>
                        ref.read(searchProvider.notifier).setQuery(value),
              ),
            ),
            Expanded(
              child:
                  filteredConversations.isEmpty
                      ? Center(
                        child: Text(
                          'No messages found',
                          style: TextStyle(
                            color: AppColors.instance.black300,
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 18,
                            fontWeight: FontFamilies.bold,
                          ),
                        ),
                      )
                      : ListView.builder(
                        itemCount: filteredConversations.length,
                        itemBuilder: (context, index) {
                          final conversation = filteredConversations[index];
                          return Container(
                            color: Colors.transparent,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  _getOtherParticipant(
                                        conversation,
                                        currentUserId,
                                      )?.avatarUrl ??
                                      "",
                                ),
                              ),
                              title: Text(
                                _getOtherParticipant(
                                      conversation,
                                      currentUserId,
                                    )?.fullName ??
                                    "",
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle:
                                  conversation.latestMessage != null
                                      ? Text(
                                        conversation
                                                .latestMessage
                                                ?.messageText ??
                                            "",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                        ),
                                      )
                                      : null,
                              onTap: () {
                                ref.read(searchProvider.notifier).clearSearch();
                                final other = _getOtherParticipant(
                                  conversation,
                                  currentUserId,
                                );
                                _navigateToChat(
                                  isOnline: other?.onlineStatus ?? "",
                                  context: context,
                                  url: other?.avatarUrl ?? "",
                                  userFullName: other?.fullName ?? "",
                                  userRole: other?.role ?? "",
                                  id: conversation.id ?? 0,
                                );
                              },
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToChat({
    required BuildContext context,
    required String userRole,
    required String userFullName,
    required String url,
    required String isOnline,
    required int id,
  }) async {
    context.pushNamed(
      AppRoutes.messageBody,
      extra: {
        "id": id,
        "username": userFullName,
        "userRole": userRole..replaceAll("_", " "),
        "url": url,
        "isOnline": isOnline,
      },
    );
  }

  Widget _buildSearchEnging(WidgetRef ref) {
    return InkWell(
      onTap: () => ref.read(searchProvider.notifier).toggleSearch(),
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(8),
        // height: 40,
        decoration: BoxDecoration(
          color: AppColors.instance.grey300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: AppColors.instance.black300),
            SizedBox(width: 10),
            Text(
              "Search messages",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAction(WidgetRef ref, BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),

      onPressed: () => _openChatOption(ref, context),
      backgroundColor: AppColors.instance.black600,
      child: Icon(Icons.add, color: AppColors.instance.grey200),
    );
  }

  Widget _buildEmptyBody({
    required String title,
    required String description,
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final authState = ref.watch(authProvider);

    final user = authState.fullname;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(12, 10, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            (user ?? "").replaceFirst(RegExp(r'^\S+'), 'Hi'),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
            ),
          ),
          SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AssetPaths.emtymeesage, height: 80, width: 80),
                Text(
                  "Your conversation appears here, start a conversation with an estate commitee or estate security",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    color: AppColors.instance.black300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
