import 'package:flutter/material.dart';
import '../models/user_post.dart';

class UserPostsPage extends StatefulWidget {
  final double latitude;
  final double longitude;

  const UserPostsPage({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<UserPostsPage> createState() => _UserPostsPageState();
}

class _UserPostsPageState extends State<UserPostsPage> {
  final List<UserPost> _posts = [];

  void _addPost() {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add post'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isEmpty) return;

              setState(() {
                _posts.add(
                  UserPost(
                    title: titleController.text,
                    description: descController.text,
                    latitude: widget.latitude,
                    longitude: widget.longitude,
                  ),
                );
              });

              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your posts')),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPost,
        child: const Icon(Icons.add),
      ),
      body: _posts.isEmpty
          ? const Center(child: Text('No posts yet'))
          : ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (_, i) {
                final post = _posts[i];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(
                    '${post.description}\nLatitude: ${post.latitude}, Longitude: ${post.longitude}',
                  ),
                );
              },
            ),
    );
  }
}
