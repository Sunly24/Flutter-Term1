import 'package:flutter/material.dart';
import 'package:test_flutter/W7-S2-PRACTICE/lib/model/quiz.dart';
import 'package:test_flutter/W7-S2-PRACTICE/lib/model/submission.dart';
import 'package:test_flutter/W7-S2-PRACTICE/lib/quiz_app.dart';
import 'package:test_flutter/W7-S2-PRACTICE/lib/widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final VoidCallback onRestart;
  final Submission submission;
  final Quiz quiz;

  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.submission,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    final correctAnswersCount = submission.getScore();

    return Scaffold(
      backgroundColor: appColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            Text(
              "You answered $correctAnswersCount on ${quiz.questions.length}!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  final question = quiz.questions[index];
                  final answer = submission.getAnswerFor(question);
                  final userAnswer = answer?.questionAnswer;
                  final isCorrect = answer?.isCorrect() ?? false;

                  return ResultItem(
                    questionIndex: index + 1,
                    question: question,
                    userAnswer: userAnswer,
                    isCorrect: isCorrect,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            AppButton('Restart Quiz', icon: Icons.restart_alt, onTap: onRestart)
          ],
        ),
      ),
    );
  }
}

class ResultItem extends StatelessWidget {
  final int questionIndex;
  final Question question;
  final String? userAnswer;
  final bool isCorrect;

  const ResultItem({
    super.key,
    required this.questionIndex,
    required this.question,
    required this.userAnswer,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: isCorrect ? Colors.green : Colors.red,
            child: Text(
              questionIndex.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Your Answer: ${userAnswer ?? "No Answer"}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: userAnswer == null
                        ? Colors.yellow
                        : (isCorrect ? Colors.lightGreen : Colors.red[800]),
                  ),
                ),
                if (userAnswer != question.goodAnswer)
                  Text(
                    "Correct Answer: ${question.goodAnswer}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
