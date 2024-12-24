import 'package:flutter/material.dart';
import 'package:note_taking_app/screens/Home_Screen.dart';
import 'package:note_taking_app/style/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: thirdColor,
              brightness: Brightness.dark,
              surface: firstColor),
          scaffoldBackgroundColor: firstColor),
      home: const HomeScreen(),
    );
  }
}
