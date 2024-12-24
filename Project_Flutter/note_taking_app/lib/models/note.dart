class Note {
  final String id;
  final String title;
  final String content;
  final DateTime addTime;
  DateTime modifiedTime;

  Note(
      {required this.id,
      required this.title,
      required this.content,
      required this.addTime,
      required this.modifiedTime});
}
