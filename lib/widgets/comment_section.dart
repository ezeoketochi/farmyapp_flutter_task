import 'package:farmy_blog/models/blog_post.dart';
import 'package:farmy_blog/screens/reply_comment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/blog_provider.dart';

class CommentWidget extends ConsumerWidget {
  final int blogId;
  final Comment comment;
  final bool? isReply;

  const CommentWidget({
    super.key,
    required this.blogId,
    required this.comment,
    this.isReply,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ListTile(
                  title: const Text(
                    "Anonymous User",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // Rounded corners
                  ),
                  tileColor: Colors.teal,
                  subtitle: Text(
                    comment.content,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              isReply == true
                  ? Container()
                  : TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ReplyCommentScreen(
                              commentId: comment.id,
                              blogId: blogId,
                            ),
                          ),
                        );
                      },
                      child: const Text('Reply this comment'),
                    ),
            ],
          ),
          ...comment.replies.map(
            (reply) => Padding(
              padding: isReply != true
                  ? const EdgeInsets.only(
                      left: 16,
                      bottom: 10,
                    )
                  : const EdgeInsets.only(
                      left: 16.0,
                      top: 10,
                    ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      '- ${reply.content}',
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReplyDialog extends ConsumerWidget {
  final int blogId;
  final int commentId;

  const ReplyDialog({super.key, required this.blogId, required this.commentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    return AlertDialog(
      title: const Text('Add Reply'),
      content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Type your reply')),
      actions: [
        TextButton(
          onPressed: () {
            ref
                .read(blogProvider.notifier)
                .addReply(blogId, commentId, controller.text);
            Navigator.pop(context);
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
