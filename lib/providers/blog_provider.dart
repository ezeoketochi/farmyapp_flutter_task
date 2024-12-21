import 'dart:convert';
import 'package:farmy_blog/blog_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/blog_post.dart';

final blogProvider = StateNotifierProvider<BlogNotifier, List<BlogPost>>((ref) {
  final dummyData = ref.read(dummyDataProvider);
  final notifier = BlogNotifier([]);
  notifier.loadBlogs(
      dummyData: dummyData); // Load blogs (either saved or dummy)
  return notifier;
});

class BlogNotifier extends StateNotifier<List<BlogPost>> {
  BlogNotifier(super.initialData);

  @override
  set state(List<BlogPost> newState) {
    super.state = newState; // Update the state
    saveBlogs(newState); // Save the state
  }

  Future<void> printSavedState() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonString = sharedPreferences.getString('blog');

    if (jsonString != null) {
      final savedState = jsonDecode(jsonString);
      print(savedState);
    } else {
      print("No saved state found : printSavedState.");
    }
  }

  Future<void> saveBlogs(List<BlogPost> blogs) async {
    final prefs = await SharedPreferences.getInstance();
    final blogJson = jsonEncode(blogs.map((blog) => blog.toJson()).toList());
    await prefs.setString('blog', blogJson);
  }

  Future<void> loadBlogs({dummyData}) async {
    final prefs = await SharedPreferences.getInstance();
    final blogJson = prefs.getString('blog');

    if (blogJson != null) {
      final List<dynamic> decoded = jsonDecode(blogJson);
      final savedBlogs =
          decoded.map((blog) => BlogPost.fromJson(blog)).toList();
      state = savedBlogs;
    } else {
      state = dummyData;
    }
  }

  void addComment(int blogId, String content) {
    state = state.map((blog) {
      if (blog.id == blogId) {
        return blog.copyWith(
          comments: [
            ...blog.comments,
            Comment(
              id: DateTime.now().millisecondsSinceEpoch,
              content: content,
              replies: [],
            ),
          ],
        );
      }
      return blog;
    }).toList();
  }

  void addReply(int blogId, int commentId, String replyContent) {
    state = state.map((blog) {
      if (blog.id == blogId) {
        return blog.copyWith(
          comments: blog.comments.map((comment) {
            if (comment.id == commentId) {
              return comment.copyWith(
                replies: [
                  ...comment.replies,
                  Comment(
                    id: DateTime.now().millisecondsSinceEpoch,
                    content: replyContent,
                    replies: [],
                  ),
                ],
              );
            }
            return comment;
          }).toList(),
        );
      }
      return blog;
    }).toList();
  }
}
