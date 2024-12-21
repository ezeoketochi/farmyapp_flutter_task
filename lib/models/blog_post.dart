import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_post.freezed.dart';
part 'blog_post.g.dart';

@freezed
class BlogPost with _$BlogPost {
  const factory BlogPost({
    required int id,
    required String title,
    required String description,
    required String content,
    required String urlToImage,
    required List<Comment> comments,
  }) = _BlogPost;

  factory BlogPost.fromJson(Map<String, dynamic> json) =>
      _$BlogPostFromJson(json);
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    required int id,
    required String content,
    required List<Comment> replies,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
