import 'package:flutter/material.dart';
import 'package:note_taking_app/models/note.dart';
import 'package:note_taking_app/widgets/note_card.dart';

class NoteList extends StatelessWidget {
  final List<Note> notes;
  final Function(Note) onEdit;
  final Function(Note) onDelete;

  const NoteList({
    super.key,
    required this.notes,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return Dismissible(
          key: ValueKey(note.id),
          direction: DismissDirection.horizontal,
          onDismissed: (direction) {
            onDelete(note);
          },
          child: NoteCard(
            note: note,
            onEdit: onEdit,
          ),
        );
      },
    );
  }
}
