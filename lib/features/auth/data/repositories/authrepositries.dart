import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curnectgate/core/storage/common_firebase_storage_repository.dart';
import 'package:curnectgate/features/auth/presentation/screen/profileuplode.dart';
import 'package:curnectgate/features/presentation/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepositoryProvider = Provider((ref) {
  // final pref = await SharedPreferences.getInstance();
  return AuthRepository(
    // preferences: pref,
    firebaseAuth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
    storage: ref.read(commonFirebaseStorageRepositoryProvider),
  );
});

class AuthRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final CommonFirebaseStorageRepository storage;
  //  final SharedPreferences preferences;

  AuthRepository({
    // required this.preferences,
    required this.firebaseAuth,
    required this.firestore,
    required this.storage,
  });
  Future<void> login(
    String email,
    BuildContext context,
    String password,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      // 1. Sign in with Firebase Auth
      UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (user.user!.uid.isNotEmpty) {
        // 2. Save UID to SharedPreferences
        preferences.setString("currentuserId", user.user!.uid);

        // 3. Fetch user data from Firestore (assuming collection name is 'users')
        DocumentSnapshot userDoc =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(user.user!.uid)
                .get();

        if (userDoc.exists) {
          // 4. Extract username and profile picture URL
          String username = userDoc['name'] ?? 'No Name';
          String profilePicUrl = userDoc['profileUrl'] ?? '';

          // 5. Save to SharedPreferences
          preferences.setString("currentUsername", username);
          preferences.setString("currentuserpUrl", profilePicUrl);

          log(username+ profilePicUrl);


          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Login successful!')));

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UsersScreen()),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('User data not found!')));
        }
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login failed: ${e.message}')));
    }
  }

  Future<void> uplodproflie({
    required String name,
    required File profileImage,
    required BuildContext context,
    required String userid,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? profileImageUrl;
    profileImageUrl = await storage.storeFileToFirebase(
      'profile_images/$userid',
      profileImage,
    );

    await firestore
        .collection('users')
        .doc(userid)
        .update({
          'profileUrl': profileImageUrl,
          'createdAt': FieldValue.serverTimestamp(),
        })
        .then((value) {
          preferences.setString("currentuserpUrl", profileImageUrl!);
          preferences.setString("currentuserId", userid);
          preferences.setString("currentUsername", name);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile picture updated successfully!'),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UsersScreen()),
          );
        });
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,

    required BuildContext context,
    File? profileImage,
  }) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user != null) {
      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'name': name,
        'profileUrl': '',
        'createdAt': FieldValue.serverTimestamp(),
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) =>
                  ProfilePix(userid: userCredential.user!.uid, name: name),
        ),
      );
    }
    // 3. Save user data to Firestore
  }
}
