import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/blog_provider.dart';

class FarmyTextField extends ConsumerWidget {
  final int blogId;
  final int? commentId;

  const FarmyTextField({
    super.key,
    required this.blogId,
    this.commentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field cannot be empty';
            }
            return null;
          },
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white, // Background color
            labelStyle: const TextStyle(color: Colors.teal),
            hintText:
                commentId != null ? 'Type your reply' : 'Type your comment...',
            hintStyle: TextStyle(color: Colors.grey.shade600),
            prefixIcon: const Icon(Icons.text_fields, color: Colors.teal),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.teal),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.teal, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 20.0,
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.send, color: Colors.teal),
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  commentId != null
                      ? ref.read(blogProvider.notifier).addReply(
                            blogId,
                            commentId!,
                            controller.text.trim(),
                          )
                      : ref.read(blogProvider.notifier).addComment(
                            blogId,
                            controller.text.trim(),
                          );
                }

                controller.clear();
              },
            ),
          ),
        ),
      ),
    );
  }
}
