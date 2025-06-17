import 'dart:async';


import 'package:curnectgate/features/estate_management/estate_onboarding/screen/estateconfirmation_screen.dart';
import 'package:curnectgate/features/member_management/screen/bottomSheet/validation_notifier.dart';

import 'package:curnectgate/features/member_management/widget/validation_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EstateCodeRepository {
  Future<void> submitEstateCode(String code) async {
    // This will be replaced with actual API call later
    await Future.delayed(Duration(milliseconds: 500));
    // Throw an error for testing: throw Exception('Invalid code');
  }
}

class MemberCodeRepository {
  Future<void> submitMemberCode(String code) async {
    // This will be replaced with actual API call later
    await Future.delayed(Duration(milliseconds: 500));
    // Throw an error for testing: throw Exception('Invalid code');
  }
}

final estateCodeRepositoryProvider = Provider((ref) => EstateCodeRepository());

final estateCodeSubmissionProvider = AsyncNotifierProvider.autoDispose<
    EstateCodeSubmissionNotifier, void>(EstateCodeSubmissionNotifier.new);

class EstateCodeSubmissionNotifier extends AutoDisposeAsyncNotifier<void> {
  EstateCodeRepository get _repository => ref.read(estateCodeRepositoryProvider);

  Future<void> submitCode(String code, BuildContext context) async {
    state = const AsyncValue.loading();
    try {
      await _repository.submitEstateCode(code);
      if (!context.mounted) return;
      Navigator.push(context, MaterialPageRoute(builder: (_) => ConfirmInfomation(code: code,)));
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }

    
  }

  @override
  FutureOr<void> build() {
   
    throw UnimplementedError();
  }
}




final memberCodeRepositoryProvider = Provider((ref) => MemberCodeRepository());

final memberCodeSubmissionProvider = AsyncNotifierProvider.autoDispose<
    MemberCodeSubmissionNotifier, void>(MemberCodeSubmissionNotifier.new);

class MemberCodeSubmissionNotifier extends AutoDisposeAsyncNotifier<void> {
  MemberCodeRepository get _repository => ref.read(memberCodeRepositoryProvider);

  Future<void> submitCode2(String code, BuildContext context) async {
    state = const AsyncValue.loading();
    try {
      await _repository.submitMemberCode(code);
      if (!context.mounted) return;
    
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => ValidationBottomSheet(memberCode: code),
  );
  
  // Reset state when sheet is closed
  ref.read(validationProvider.notifier).reset();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }

    
  }

  @override
  FutureOr<void> build() {
   
    throw UnimplementedError();
  }
}