import 'package:flutter/material.dart';

class UserPostsPage extends StatelessWidget{
  const UserPostsPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: const Center(child: Text('No posts have been added yet.'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
      child: const Icon(Icons.add),
      ),
    );
  }
}