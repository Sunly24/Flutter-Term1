import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.all(15),
      child: const Column(
        children: [
          CustomCard(text: "OOP", color: Colors.red),
          SizedBox(
            height: 20,
          ),
          CustomCard(text: "DART"),
          SizedBox(
            height: 20,
          ),
          CustomCard(text: "FLUTTER", color: Colors.pink),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ),
  ));
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;

  const CustomCard({super.key, required this.text, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
