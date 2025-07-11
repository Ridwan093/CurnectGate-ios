import 'dart:io';

import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfilePrompt extends ConsumerStatefulWidget {
  const UpdateProfilePrompt({super.key});

  @override
  ConsumerState<UpdateProfilePrompt> createState() => _UpdateProfilePromptState();
}

class _UpdateProfilePromptState extends ConsumerState<UpdateProfilePrompt> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _selectedImage = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     final formprovider = ref.read(formProvider.notifier);
    final formSate = ref.watch(formProvider);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () => context.pop(),
              child: Icon(Icons.close, color: AppColors.instance.black600),
            ),
          ),
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              backgroundImage:
                  _selectedImage != null
                      ? FileImage(_selectedImage!)
                      : const AssetImage(AssetPaths.navProfileActive)
                          as ImageProvider,
              child:
                  _selectedImage == null
                      ? Icon(
                        Icons.add,
                        size: 30,
                        color: AppColors.instance.grey200,
                      )
                      : null,
            ),
          ),
          const SizedBox(height: 16),

          Text(
            "Update your profile picture so others can recognize  you",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
        
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black500,
              fontWeight: FontFamilies.light
            ),
          ),
          const SizedBox(height: 24),

          if (_selectedImage != null)
            ElevatedButton(
              onPressed: ()async {
                 final authData = await SharedPrefsService().getAuthData();
              final data = authData?['user'];
              if (authData != null) {
                final gender = data?['gender'] as String?;
                final notfypre = data?['preferred_notification'] as String?;

                  formprovider.updateUserPix(
                  
                    context: context,
                  file: _selectedImage!,
                    ref: ref,
                  );
                
              }},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.instance.black600,
                ),
              ),
              child:   formSate.isLoading
                    ? CircularProgressIndicator(
                      color: AppColors.instance.yellow500,
                    )
                    :Text(
                "Submit",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.grey200,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
