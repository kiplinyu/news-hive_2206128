import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Welcome to the Profile Page!')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
