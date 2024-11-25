import 'package:flutter/material.dart';
import 'package:test_flutter/W7-S2-PRACTICE/lib/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final String quizTitle;
  final VoidCallback onStart;
  const WelcomeScreen(
      {super.key, required this.onStart, required this.quizTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/W7-S2/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(height: 80),
          Text(
            quizTitle,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          AppButton('Start Quiz', icon: Icons.arrow_right_alt, onTap: onStart)
        ],
      ),
    );
  }
}
