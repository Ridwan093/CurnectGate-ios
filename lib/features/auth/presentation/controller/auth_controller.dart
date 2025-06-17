import 'dart:io';

import 'package:curnectgate/features/auth/data/repositories/authrepositries.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// auth_controller.dart
class AuthController extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    return null; // Initial state
  }

  Future<void> register({
    required String userName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = const AsyncValue.loading(); // Automatic loading state
    state = await AsyncValue.guard(() async {
      await ref
          .read(authRepositoryProvider)
          .register(
            email: email,
            password: password,
            name: userName,
            context: context,
          );
      return null;
    });
  }

  void loginUser({required String email,   required BuildContext context, required String password}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.watch(authRepositoryProvider).login(email,   context, password,);
      return null;
    });
  }

  void uplodproflie({
    required File profileImage,
    required BuildContext context,
    required String userid,
    required String name 
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .watch(authRepositoryProvider)
          .uplodproflie(
            name:name,
            profileImage: profileImage,
            userid: userid,
            context: context,
          );
      return null;
    });
  }
}

// providers.dart
final authControllerProvider = AsyncNotifierProvider<AuthController, User?>(() {
  return AuthController();
});
