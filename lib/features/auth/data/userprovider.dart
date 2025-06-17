// users_provider.dart
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curnectgate/features/auth/data/userModel/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersListProvider = StreamProvider<List<UserModel>>((ref) {
  final firestore = FirebaseFirestore.instance;

  User? currentUser = FirebaseAuth.instance.currentUser;
  final String userId = currentUser!.uid;
  log(userId);

  return firestore
      .collection('users')
      .where('uid', isNotEqualTo: userId) // Exclude current user
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList(),
      );
});
