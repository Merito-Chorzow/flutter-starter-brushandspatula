import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';

void main() {
  runApp(const GeoJournalApp());
}

class GeoJournalApp extends StatelessWidget {
  const GeoJournalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geo Journal',
      theme: ThemeData(useMaterial3: true),
      home: const WelcomePage(),
    );
  }
}
