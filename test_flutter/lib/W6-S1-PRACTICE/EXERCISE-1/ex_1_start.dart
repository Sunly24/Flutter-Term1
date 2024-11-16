import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

List<Widget> forLoop() {
  List<Widget> widgets = [];

  for (String color in colors) {
    widgets.add(Label(color));
  }
  return widgets;
}

List<Widget> mapMethod() {
  return colors.map((color) => Label(color)).toList();
}

List<Widget> dedicatedFunc() {
  return colors.map((color) => Label(color)).toList();
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Label("Method 1: Loop in Array", bold: true),
            ...forLoop(),
            const Label("Method 2: Map", bold: true),
            ...mapMethod(),
            const Label("Method 23: Dedicated Function", bold: true),
            ...dedicatedFunc(),
          ],
        ),
      ),
    ),
  ));
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}
