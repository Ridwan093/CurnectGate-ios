import 'dart:io';

import 'package:curnectgate/features/auth/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePix extends ConsumerStatefulWidget {
  final String userid;
  final String name;
  const ProfilePix({super.key,required this. name ,required this.userid});

  @override
  ConsumerState<ProfilePix> createState() => _ProfilePixState();
}

class _ProfilePixState extends ConsumerState<ProfilePix> {
  File? _profileImage;

  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: ${e.toString()}')),
      );
    }
  }

  Future<void> _upload() async {
    if (_profileImage == null) return;

    try {
      ref
          .read(authControllerProvider.notifier)
          .uplodproflie(
            profileImage: _profileImage!,
            userid: widget.userid,
            context: context,
            name:widget.name
          );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Upload failed: ${e.toString()}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Upload your profile")),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _profileImage == null
                ? IconButton(
                  icon: const Icon(Icons.add_a_photo, size: 50),
                  onPressed: authState.isLoading ? null : _pickImage,
                )
                : CircleAvatar(
                  radius: 100,
                  backgroundImage: FileImage(_profileImage!),
                ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  _profileImage == null || authState.isLoading ? null : _upload,
              child:
                  authState.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}
