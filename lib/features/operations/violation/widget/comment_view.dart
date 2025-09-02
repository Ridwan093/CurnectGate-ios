import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/operations/violation/widget/buildCommentCount.dart';
import 'package:curnectgate/features/operations/violation/widget/buildCommentList.dart';
import 'package:curnectgate/features/operations/violation/widget/commentInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CommentView extends StatefulWidget {
  final int id;
  const CommentView({super.key, required this.id});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  late final AnimationController _animationController2;

  late final Animation<double> _fadeAnimation2;

  late final Animation<Offset> _slideAnimation2;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _slideAnimation2 = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: Curves.easeInOutCubic,
      ),
    );

    _fadeAnimation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: Curves.easeInOutCubic,
      ),
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Minimize height
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Image(
                  image: AssetImage(AssetPaths.navMessages),
                  color: AppColors.instance.black500,
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 10),
                Buildcommentcount(),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 20),
          Buildcommentlist(),
          SizedBox(height: 8),
          Commentinput(
            id: widget.id,
            animationController2: _animationController2,
            fadeAnimation2: _fadeAnimation2,
            slideAnimation2: _slideAnimation2,
          ),
        ],
      ),
    );
  }
}
