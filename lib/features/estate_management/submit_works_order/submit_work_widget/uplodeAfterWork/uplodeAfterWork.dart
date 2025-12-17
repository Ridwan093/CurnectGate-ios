import 'dart:io';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/afterImage_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
//C9ZKG

class UploadWorkImagesSheet extends ConsumerStatefulWidget {
  final int id;
  final String title;
  final String subtitle;
  const UploadWorkImagesSheet({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
  });

  @override
  ConsumerState<UploadWorkImagesSheet> createState() =>
      _UploadWorkImagesSheetState();
}

class _UploadWorkImagesSheetState extends ConsumerState<UploadWorkImagesSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  Future<void> pickImage() async {
    final img = await picker.pickImage(source: ImageSource.gallery);
    if (img == null) return;

    ref.read(workImagesProvider.notifier).addImage(File(img.path));
  }

  @override
  void dispose() {
    _controller.dispose(); // stop ticker first
    super.dispose(); // then clean up
  }

  @override
  Widget build(BuildContext context) {
    final images = ref.watch(workImagesProvider);
    final isLoading = ref.watch(formProvider).workOderLoading;
    final provider = ref.read(formProvider.notifier);

    return SafeArea(
      child: SlideTransition(
        position: _slide,
        child: FadeTransition(
          opacity: _fade,
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                const Text(
                  "Upload Work Images",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "Upload between 1 and 2 images as proof of completed work.",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontFamilies.interDisplay,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 20),

                // IMAGE LIST
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length + (images.length < 2 ? 1 : 0),
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      // Add Image Button
                      if (index == images.length && images.length < 2) {
                        return GestureDetector(
                          onTap: pickImage,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black12),
                            ),
                            child: const Center(
                              child: Icon(Icons.add_a_photo, size: 32),
                            ),
                          ),
                        );
                      }

                      // Image thumbnail
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              images[index],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap:
                                  () => ref
                                      .read(workImagesProvider.notifier)
                                      .removeImage(index),
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                const SizedBox(height: 25),

                // SUBMIT BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        images.isEmpty
                            ? null
                            : () {
                              // Navigator.pop(context, images);

                              // SEND TO BACKEND
                              print(
                                "Selected images: ${images.map((e) => e.path)}",
                              );
                              provider.uploadeAfterWork(
                                context: context,
                                file: images,
                                id: widget.id.toString(),
                                ref: ref,
                              );

                              // You can now access the images list in parent screen
                            },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          images.isEmpty
                              ? Colors.grey
                              : AppColors.instance.black600,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child:
                        isLoading
                            ? Loadingstates()
                            : Text(
                              "Upload",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.instance.grey200,
                                fontFamily: FontFamilies.interDisplay,
                              ),
                            ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
