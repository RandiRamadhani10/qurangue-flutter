import 'package:flutter/material.dart';
import 'package:quran_gue/src/screens/home_screen.dart';
import 'package:quran_gue/src/screens/bottom_tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomTabs(),
    );
  }
}
