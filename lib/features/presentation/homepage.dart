// users_screen.dart


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:curnectgate/features/auth/data/userprovider.dart';
import 'package:curnectgate/features/auth/presentation/screen/loging.dart';
import 'package:curnectgate/features/chat/data/repositories/messages_hive_pending_check.dart';
import 'package:curnectgate/features/chat/presentation/screens/chatscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersScreen extends ConsumerStatefulWidget {
  const UsersScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UsersScreenState();
}

class _UsersScreenState extends ConsumerState<UsersScreen> {
  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((result) async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      if (result != ConnectivityResult.none) {
        await CheckPendingMessage(firestore: firestore).syncPendingMessages();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(usersListProvider);
    // var messageId = const Uuid().v1();

    return Scaffold(
      appBar: CustomAppBar(),
      body: usersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (users) {
          // Handle empty list case
          if (users.isEmpty) {
            return const Center(child: Text('No other users found'));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              ChatScreen(user.profileUrl!, user.name, user.uid),
                    ),
                  );
                },
                leading: CircleAvatar(
                  backgroundImage:
                      user.profileUrl != null
                          ? NetworkImage(user.profileUrl!)
                          : null,
                  child:
                      user.profileUrl == null
                          ? Text(user.name.isNotEmpty ? user.name[0] : '?')
                          : null,
                ),
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        },
      ),
    );
  }
}



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String?>>(
      future: _getUserData(),
      builder: (context, snapshot) {
        final userData = snapshot.data ?? {};
        final username = userData['currentUsername'] ?? 'Guest';
        final profilePicUrl = userData['currentuserpUrl'];

        return AppBar(
          title: Row(
            children: [
              if (profilePicUrl != null && profilePicUrl.isNotEmpty)
                CircleAvatar(
                  backgroundImage: NetworkImage(profilePicUrl),
                  radius: 16,
                ),
              SizedBox(width: 10),
              Text(username),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => _logout(context),
            ),
          ],
        );
      },
    );
  }

  Future<Map<String, String?>> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'currentUsername': prefs.getString('currentUsername'),
      'currentuserpUrl': prefs.getString('currentuserpUrl'),
    };
  }

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => AuthScreen()),
    );
  }
}