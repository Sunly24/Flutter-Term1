import 'package:flutter/material.dart';
import 'package:test_flutter/W6-S1-PRACTICE/EXERCISE-3/screen/temperature.dart';
import 'package:test_flutter/W6-S1-PRACTICE/EXERCISE-3/screen/welcome.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool _checkScreen = true;

  void switchScreen() {
    setState(() {
      _checkScreen = !_checkScreen;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: _checkScreen
              ? Welcome(
                  pressedButton: switchScreen,
                )
              : Temperature(),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
