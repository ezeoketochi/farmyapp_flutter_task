import 'package:farmy_blog/models/blog_post.dart';
import 'package:farmy_blog/providers/blog_provider.dart';
import 'package:farmy_blog/widgets/comment_section.dart';
import 'package:farmy_blog/widgets/reply_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReplyCommentScreen extends ConsumerStatefulWidget {
  final int blogId;
  final int commentId;

  const ReplyCommentScreen({
    super.key,
    required this.commentId,
    required this.blogId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReplyCommentScreen();
}

class _ReplyCommentScreen extends ConsumerState<ReplyCommentScreen> {
  TextEditingController replyController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    ref.read(blogProvider.notifier).printSavedState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final blog =
        ref.watch(blogProvider).firstWhere((blog) => blog.id == widget.blogId);
    Comment comment =
        blog.comments.firstWhere((comment) => comment.id == widget.commentId);

    return Scaffold(
      appBar: AppBar(
          title: Text(
        blog.title,
        style: const TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
        ),
      )),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      blog.content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Colors.teal,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.network(blog.urlToImage),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Colors.teal,
                    ),
                    CommentWidget(
                      blogId: widget.blogId,
                      comment: comment,
                      isReply: true,
                    )
                  ],
                ),
              ),
            ),
          ),
          FarmyTextField(
            blogId: blog.id,
            commentId: widget.commentId,
          ),
        ],
      ),
    );
  }
}
