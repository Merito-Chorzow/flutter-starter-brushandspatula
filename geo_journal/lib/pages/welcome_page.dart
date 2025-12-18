import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to the GeoJournal'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){

          },
          child: const Text('Go to App'),
          ),
      ),
    );
  }
}