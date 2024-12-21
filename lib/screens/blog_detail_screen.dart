import 'package:farmy_blog/providers/blog_provider.dart';
import 'package:farmy_blog/widgets/comment_section.dart';
import 'package:farmy_blog/widgets/reply_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogDetailScreen extends ConsumerStatefulWidget {
  final int blogId;

  const BlogDetailScreen({
    super.key,
    required this.blogId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BlogDetailScreenState();
}

class _BlogDetailScreenState extends ConsumerState<BlogDetailScreen> {
  TextEditingController replyController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final blog =
        ref.watch(blogProvider).firstWhere((blog) => blog.id == widget.blogId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          blog.title,
          style: const TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
                    ...blog.comments.map(
                      (comment) =>
                          CommentWidget(blogId: blog.id, comment: comment),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FarmyTextField(blogId: blog.id),
        ],
      ),
    );
  }
}
