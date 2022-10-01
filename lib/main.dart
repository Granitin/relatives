import 'package:flutter/material.dart';
import 'package:relatives/screens/main_scrreen.dart';

void main() {
  runApp(const RelativesApp());
}

class RelativesApp extends StatelessWidget {
  const RelativesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RelativeS',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MainScreen(),
    );
  }
}
