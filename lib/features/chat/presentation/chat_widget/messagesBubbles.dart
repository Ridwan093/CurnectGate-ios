import 'dart:async';
import 'dart:io';

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/chat/data/model/chat_message.dart';
import 'package:curnectgate/features/chat/data/provider/get_provider/get_list_message.dart';
import 'package:curnectgate/features/chat/presentation/screens/image_viewer_screen.dart';
import 'package:curnectgate/features/chat/presentation/screens/pdf_viewer_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

class ChatBubble extends ConsumerStatefulWidget {
  final Message message;
  final VoidCallback? onDelete;

  const ChatBubble({super.key, required this.message, this.onDelete});

  @override
  ConsumerState<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends ConsumerState<ChatBubble> {
  final Map<String, String> _local = {};
  final Map<String, bool> _downloading = {};

  late Box<String> cacheBox;

  Future<void> _download(String url) async {
    if (_downloading[url] == true) return;

    _downloading[url] = true;
    setState(() {});

    final save = await _path(url);

    try {
      await Dio().download(url, save); // Download the file

      // Once downloaded, save it to local storage and cache
      _local[url] = save;
      await cacheBox.put(url, save);
    } catch (_) {
      // Handle download failure if needed
    } finally {
      // Ensure downloading flag is reset and state is updated
      _downloading[url] = false;
      if (mounted) {
        setState(() {}); // Ensure UI is rebuilt after download
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    cacheBox = await Hive.openBox<String>('file_cache');
    final tempLocal = <String, String>{};

    // Check cache for existing files
    for (var k in cacheBox.keys) {
      final p = cacheBox.get(k);
      if (p != null && File(p).existsSync()) {
        tempLocal[k] = p;
      } else {
        await cacheBox.delete(k); // Remove invalid cache entries
      }
    }

    // Update local map after cache is loaded
    if (mounted) {
      setState(() {
        _local.addAll(tempLocal);
      });
    }

    // Auto-download files for sender (check sender files)
    final atts = widget.message.attachments ?? [];
    for (var a in atts) {
      if (a.isImage == true || a.isDocument == true) {
        final url = a.fileUrl ?? "";
        if (a.localPath == null || !File(a.localPath!).existsSync()) {
          // Auto-download if local file doesn't exist
          _download(url);
        }
      }
    }
  }

  Future<String> _path(String url) async {
    final dir = await getApplicationDocumentsDirectory();
    final folder = Directory("${dir.path}/chat_files");

    if (!await folder.exists()) {
      await folder.create();
    }

    return "${folder.path}/${url.split('/').last}";
  }

  String _formatTime(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return "";
    try {
      final date = DateTime.parse(dateStr).toLocal();
      return DateFormat('h:mm a').format(date);
    } catch (_) {
      return dateStr.length > 5 ? dateStr.substring(11, 16) : dateStr;
    }
  }

  Widget _statusIcon() {
    if (widget.message.isSender != true) {
      return const SizedBox();
    }

    if (widget.message.isRead == true) {
      return const Icon(Icons.done_all, size: 16, color: Colors.blue);
    }

    switch (widget.message.status?.toLowerCase()) {
      case "sending":
        return const Icon(Icons.schedule, size: 16, color: Colors.grey);
      case "failed":
        return const Icon(Icons.error, size: 16, color: Colors.red);
      case "delivered":
        return const Icon(Icons.done_all, size: 16, color: Colors.grey);
      case "sent":
      default:
        return const Icon(Icons.check, size: 16, color: Colors.grey);
    }
  }

  void _showOptions() {
    if (widget.message.isSender != true || widget.message.isRead == true) {
      return;
    }

    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text("Delete message"),
                onTap: () {
                  ref
                      .read(
                        messagesProvider(
                          widget.message.conversationId ?? 0,
                        ).notifier,
                      )
                      .deleteMessage(widget.message, context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _attachment(double maxW) {
    final atts = widget.message.attachments ?? [];

    return Column(
      children:
          atts.map((a) {
            final url = a.fileUrl ?? "";

            String? show;

            /// PRIORITY 1: sender local file
            if (a.localPath != null && File(a.localPath!).existsSync()) {
              show = a.localPath;
            }
            /// PRIORITY 2: downloaded cache
            else if (_local[url] != null) {
              show = _local[url];
            }

            /// IMAGE
            if (a.isImage == true) {
              if (show != null) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) =>
                                ImageViewerScreen(imagePath: show!, tag: url),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 6),
                    constraints: BoxConstraints(maxWidth: maxW),
                    child: Hero(
                      tag: url,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(File(show), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                );
              }

              return GestureDetector(
                onTap: () => _download(url),
                child: Container(
                  margin: const EdgeInsets.only(top: 6),
                  height: 160,
                  width: maxW,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:
                      _downloading[url] == true
                          ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.instance.yellow500,
                            ),
                          )
                          : Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.download, size: 40),
                                SizedBox(height: 6),
                                Text(
                                  "Tap to download image",
                                  style: TextStyle(
                                    fontFamily: FontFamilies.interDisplay,
                                    fontSize: 16,
                                    color: AppColors.instance.black500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                ),
              );
            }

            /// DOCUMENT
            if (a.isDocument == true) {
              final local = show;

              return GestureDetector(
                onTap: () async {
                  if (local != null) {
                    final fileName = a.fileName?.toLowerCase() ?? "";
                    if (fileName.endsWith('.pdf')) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => PdfViewerScreen(
                                pdfPath: local,
                                title: a.fileName ?? "Document",
                              ),
                        ),
                      );
                    } else {
                      OpenFilex.open(local);
                    }
                  } else {
                    await _download(url);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 6),
                  padding: const EdgeInsets.all(10),
                  constraints: BoxConstraints(maxWidth: maxW),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.picture_as_pdf, color: Colors.red),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          a.fileName ?? "Document",
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 16,
                            color: AppColors.instance.black600,
                          ),
                        ),
                      ),
                      if (local == null)
                        _downloading[url] == true
                            ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                            : const Icon(Icons.download),
                    ],
                  ),
                ),
              );
            }

            return const SizedBox();
          }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMe = widget.message.isSender ?? false;
    final maxW = MediaQuery.of(context).size.width * .72;

    return GestureDetector(
      onLongPress: _showOptions,
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          padding: const EdgeInsets.all(10),
          constraints: BoxConstraints(maxWidth: maxW),
          decoration: BoxDecoration(
            color: isMe ? Colors.teal.shade200 : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _attachment(maxW),

              if ((widget.message.messageText ?? "").isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(widget.message.messageText!),
                ),

              const SizedBox(height: 4),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _formatTime(widget.message.createdAt),
                    style: const TextStyle(fontSize: 10),
                  ),
                  const SizedBox(width: 4),
                  _statusIcon(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
