import 'package:farmy_blog/screens/blog_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/blog_provider.dart';

class BlogListScreen extends ConsumerWidget {
  const BlogListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogs = ref.watch(blogProvider);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "FarmyApp Blog System",
        style: TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
        ),
      )),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return ListView.builder(
            itemCount: blogs.length,
            itemBuilder: (BuildContext context, int index) {
              final blog = blogs[index];

              return ListTile(
                title: Text(
                  blog.title,
                  style: const TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(blog.urlToImage),
                ),
                subtitle: Text('${blog.content.substring(0, 50)}...'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlogDetailScreen(blogId: blog.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
