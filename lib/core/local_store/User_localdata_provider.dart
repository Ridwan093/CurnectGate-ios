import 'dart:io';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);

class AuthState {
  final String? accessToken;
  final Map<String, dynamic>? user;
  final String? fullname;
  final File? file;
  

  AuthState({this.accessToken, this.user, this.fullname, this.file});

  AuthState copyWith({
    String? accessToken,
    Map<String, dynamic>? user,
    String? fullname,
    File? file,
  }) {
    return AuthState(
      file:file?? this.file,
      accessToken: accessToken ?? this.accessToken,
      user: user ?? this.user,
      fullname: fullname ?? this.fullname,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState()) {
    loadAuthData();
    loadfullName();
  }

  Future<void> loadAuthData() async {
    final authData = await SharedPrefsService().getAuthData();
    if (authData != null) {
      state = state.copyWith(
        accessToken: authData['access_token'],
        user: authData['user'],
      );
    }
  }

  Future<void> loadfullName() async {
    final fullname = await SharedPrefsService().getfullName();
    if (fullname != null) {
      state = state.copyWith(fullname: fullname);
    }
  }




  String? get full_name => state.fullname;
  String? get token => state.accessToken;
  Map<String, dynamic>? get userData => state.user;
}
