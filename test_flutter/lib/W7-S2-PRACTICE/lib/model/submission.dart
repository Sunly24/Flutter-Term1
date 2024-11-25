import 'package:test_flutter/W7-S2-PRACTICE/lib/model/quiz.dart';

class Answer {
  final String questionAnswer;
  final Question question;
  Answer(this.questionAnswer, this.question);

  bool isCorrect() => question.goodAnswer == questionAnswer;
}

class Submission {
  final Map<Question, Answer> _answers = {};

  int getScore() {
    int score = 0;

    for (Question q in _answers.keys) {
      Answer answer = _answers[q] as Answer;
      score += answer.isCorrect() ? 1 : 0;
    }
    return score;
  }

  Answer? getAnswerFor(Question question) {
    return _answers[question];
  }

  void addAnswer(Question question, String answer) {
    _answers[question] = Answer(answer, question);
  }

  void removeAnswers() {
    _answers.clear();
  }
}
