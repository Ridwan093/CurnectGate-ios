import 'dart:io';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/estate_management/submit_works_order/submit_work_provider/afterImage_provider.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

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
    _controller.dispose();
    super.dispose();
  }

  Future<void> _confirmCompleteWithoutProof(
    BuildContext context,
    FormNotifier provider,
    bool isLoading,
  ) async {
    if (isLoading) return;

    final result = await showDialog<bool>(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(
              "Complete without proof?",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black500,
              ),
            ),
            content: Text(
              "You are about to complete this work order without uploading images.",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black400,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black300,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  "Yes, complete",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black600,
                  ),
                ),
              ),
            ],
          ),
    );

    if (result == true) {
      provider.uploadeAfterWork(
        context: context,
        file: [],
        id: widget.id.toString(),
        ref: ref,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final images = ref.watch(workImagesProvider);
    final isLoading = ref.watch(formProvider).workOderLoading;
    final provider = ref.read(formProvider.notifier);

    final canUpload = images.isNotEmpty && !isLoading;

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
                /// HEADER
                const Text(
                  "Upload Work Images",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  "Upload between 1 and 2 images as proof of completed work.",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontFamilies.interDisplay,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 20),

                /// IMAGE LIST
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length + (images.length < 2 ? 1 : 0),
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      if (index == images.length && images.length < 2) {
                        return GestureDetector(
                          onTap: isLoading ? null : pickImage,
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
                                  isLoading
                                      ? null
                                      : () => ref
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

                /// PRIMARY BUTTON — Upload & Complete
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        canUpload
                            ? () {
                              provider.uploadeAfterWork(
                                context: context,
                                file: images,
                                id: widget.id.toString(),
                                ref: ref,
                              );
                            }
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          canUpload ? AppColors.instance.black600 : Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child:
                        isLoading
                            ? Loadingstates()
                            : Text(
                              "Upload & Complete",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.instance.grey200,
                                fontFamily: FontFamilies.interDisplay,
                              ),
                            ),
                  ),
                ),

                const SizedBox(height: 12),

                /// SECONDARY ACTION — Complete without proof
                Center(
                  child: TextButton(
                    onPressed:
                        isLoading
                            ? null
                            : () => _confirmCompleteWithoutProof(
                              context,
                              provider,
                              isLoading,
                            ),
                    child: Text(
                      "Complete without proof",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.instance.black400,
                        color: AppColors.instance.black400,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
