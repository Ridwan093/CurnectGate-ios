import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/auth/widget/conversation_tile.dart';
import 'package:curnectgate/features/chat/data/provider/%20chat_list_provider.dart';
import 'package:curnectgate/features/chat/data/provider/chat_provier.dart';
import 'package:curnectgate/features/chat/data/provider/search_provider.dart';
import 'package:curnectgate/features/chat/presentation/screens/messagbody.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListScreen extends ConsumerWidget {
  final String title;
  final String description;
  const ChatListScreen(this.title, this.description, {super.key});
  void _openChatOption(WidgetRef ref, BuildContext context) {
    showUserBottomSheet(
      context: context,
      headertitle: "Star a conversation",
      headersubtitle: "A team typicall replies in less than a minute",
      ref: ref,
      bottom: BottomSheetView.startConversation,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchProvider);
    final chatState = ref.watch(chatProvider);
    final conversations = ref.watch(chatListProvider);
    // final filteredConversations =
    //     searchState.query.isEmpty
    //         ? conversations
    //         : ref.read(chatListProvider.notifier).search(searchState.query);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton:
          searchState.isSearching
              ? const SizedBox.shrink()
              : _buildAction(ref, context),
      appBar: searchState.isSearching ? null : _buildAppBar(),

      // appBar: AppBar(

      //   bottom: PreferredSizeWidget(c),
      //   title: const Text('All messages'),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.search),
      //       onPressed: () => ref.read(searchProvider.notifier).toggleSearch(),
      //     ),
      //   ],
      body:
          // ignore: unnecessary_null_comparison
          conversations.length != null
              ? Stack(
                children: [
                  Column(
                    children: [
                      _buildSearchEnging(ref),

                      SizedBox(height: 8),
                      Expanded(
                        child: ListView.builder(
                          itemCount: conversations.length,
                          itemBuilder: (context, index) {
                            final conversation = conversations[index];
                            return ConversationTile(
                              conversation: conversation,
                              onTap: () => _navigateToChat(context),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  // Search Overlay
                  if (searchState.isSearching)
                    _buildSearchOverlay(context, ref),
                ],
              )
              : _buildEmptyBody(
                title: title,
                description: description,
                context: context,
              ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      // backgroundColor: Colors.white,
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

  Widget _buildSearchOverlay(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchProvider);
    final filteredConversations = ref
        .read(chatListProvider.notifier)
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
                                  conversation.user.avatarUrl,
                                ),
                              ),
                              title: Text(
                                conversation.user.name,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle:
                                  conversation.lastMessage != null
                                      ? Text(
                                        conversation.lastMessage!.text,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                        ),
                                      )
                                      : null,
                              onTap: () {
                                ref.read(searchProvider.notifier).clearSearch();
                                _navigateToChat(
                                  context,
                                  // conversation,
                                  // ref.read(chatProvider),
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

  void _navigateToChat(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MessageScreens(id: 8)),
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
  }) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            title,
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
