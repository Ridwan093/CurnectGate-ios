import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Assuming Riverpod for state management

// Placeholder models
class Violation {
  final String id;
  final String title;
  final String description;
  final List<String> images; // Two image URLs
  final User reporter;
  final List<Comment> comments;

  Violation({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.reporter,
    required this.comments,
  });
}

class User {
  final String name;
  final String estateName;
  final String estateAddress;
  final bool isAnonymous;

  User({
    required this.name,
    required this.estateName,
    required this.estateAddress,
    this.isAnonymous = false,
  });
}

class Comment {
  final String userName;
  final String text;
  final DateTime time;

  Comment({required this.userName, required this.text, required this.time});
}

// Provider for violation details (API call placeholder)
final violationProvider = FutureProvider.autoDispose.family<Violation, String>((ref, violationId) async {
  // API call placeholder - replace with actual API service
  await Future.delayed(Duration(seconds: 2)); // Simulate API delay
  return Violation(
    id: violationId,
    title: 'Parking Violation',
    description: 'Unauthorized parking in restricted area.',
    images: [
      'https://example.com/image1.jpg',
      'https://example.com/image2.jpg',
    ],
    reporter: User(
      name: 'John Doe',
      estateName: 'Mogodo Estate',
      estateAddress: '123 Main St, Lagos',
      isAnonymous: false, // Toggle for testing
    ),
    comments: [
      Comment(userName: 'Alice', text: 'This is unacceptable!', time: DateTime.now().subtract(Duration(hours: 1))),
      Comment(userName: 'Bob', text: 'Agreed, needs action.', time: DateTime.now().subtract(Duration(minutes: 30))),
    ],
  );
});

// Comment provider (for bottom sheet, API placeholder)
final commentsProvider = StateNotifierProvider.autoDispose<CommentsNotifier, List<Comment>>((ref) {
  return CommentsNotifier();
});

class CommentsNotifier extends StateNotifier<List<Comment>> {
  CommentsNotifier() : super([]);

  void addComment(String text) {
    // API call to add comment
    state = [...state, Comment(userName: 'Current User', text: text, time: DateTime.now())];
  }
}

class ViolationDetailScreen extends ConsumerStatefulWidget {
  final String violationId;

  const ViolationDetailScreen({super.key, required this.violationId});

  @override
  _ViolationDetailScreenState createState() => _ViolationDetailScreenState();
}

class _ViolationDetailScreenState extends ConsumerState<ViolationDetailScreen> with SingleTickerProviderStateMixin {
  int _currentImageIndex = 0;
  Timer? _imageTimer;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _startImageSwap();
  }

  @override
  void dispose() {
    _imageTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _startImageSwap() {
    _imageTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % 2; // Assuming two images
      });
      _animationController.forward(from: 0.0);
    });
  }

  void _showCommentsBottomSheet(BuildContext context, List<Comment> initialComments) {
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    ref.read(commentsProvider.notifier).state = initialComments; // Initialize with existing comments

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final comments = ref.watch(commentsProvider);
                      return ListView.builder(
                        controller: scrollController,
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          final comment = comments[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text(comment.userName[0]),
                            ),
                            title: Text(comment.userName, style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(comment.text),
                            trailing: Text(
                              '${DateTime.now().difference(comment.time).inMinutes} m',
                              style: TextStyle(color: Colors.grey),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text('U'), // Current user initial
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Add a comment...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          onSubmitted: (text) {
                            ref.read(commentsProvider.notifier).addComment(text);
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: Colors.blue),
                        onPressed: () {
                          // Trigger onSubmitted or handle separately
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final violationAsync = ref.watch(violationProvider(widget.violationId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Violation Detail'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: violationAsync.when(
        data: (violation) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Auto-swapping images with animation
                Container(
                  height: 250,
                  width: double.infinity,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Image.network(
                      violation.images[_currentImageIndex],
                      key: ValueKey<int>(_currentImageIndex),
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        violation.title,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal[800]),
                      ),
                      SizedBox(height: 8),
                      Text(
                        violation.description,
                        style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                      ),
                      SizedBox(height: 16),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Reporter Details',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              SizedBox(height: 8),
                              if (!violation.reporter.isAnonymous)
                                Text('Name: ${violation.reporter.name}', style: TextStyle(fontSize: 16)),
                              Text('Estate: ${violation.reporter.estateName}', style: TextStyle(fontSize: 16)),
                              Text('Address: ${violation.reporter.estateAddress}', style: TextStyle(fontSize: 16)),
                              if (violation.reporter.isAnonymous)
                                Text('Anonymous Report', style: TextStyle(fontSize: 16, color: Colors.grey)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Comment section preview
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Comments (${violation.comments.length})',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),
                              SizedBox(height: 8),
                              if (violation.comments.isNotEmpty)
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: violation.comments.length > 2 ? 2 : violation.comments.length, // Show preview
                                  itemBuilder: (context, index) {
                                    final comment = violation.comments[index];
                                    return ListTile(
                                      leading: CircleAvatar(child: Text(comment.userName[0])),
                                      title: Text(comment.userName),
                                      subtitle: Text(comment.text),
                                    );
                                  },
                                ),
                              SizedBox(height: 8),
                              GestureDetector(
                                onTap: () => _showCommentsBottomSheet(context, violation.comments),
                                child: Text(
                                  'View all comments',
                                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}