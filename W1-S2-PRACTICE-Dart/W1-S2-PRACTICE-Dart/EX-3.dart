void main() {
  // List of student scores
  List<int> scores = [45, 78, 62, 49, 85, 33, 90, 50];

  var passExam = scores.where((scores) => scores >= 50);

  print(passExam.toList());
  print('${passExam.length} students passed');
}
