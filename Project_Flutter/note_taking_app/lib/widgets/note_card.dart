import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_taking_app/models/note.dart';
import 'package:note_taking_app/style/color.dart';
import 'package:note_taking_app/screens/note_screen.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final Function(Note) onEdit;

  const NoteCard({super.key, required this.note, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('EEE MMM d, yyyy h:mm a');

    String timestamp = note.modifiedTime.isAtSameMomentAs(note.addTime)
        ? ' ${dateFormat.format(note.addTime)}'
        : ' ${dateFormat.format(note.modifiedTime)}';

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TakeNote(
            mode: Mode.editing,
            note: note,
            onSave: onEdit,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: SizedBox(
          width: double.infinity,
          child: Card(
            color: secondColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: fourthColor,
                      fontSize: 24,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    note.content,
                    style: const TextStyle(color: fourthColor, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    timestamp,
                    style: const TextStyle(
                        color: thirdColor,
                        fontSize: 14,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
