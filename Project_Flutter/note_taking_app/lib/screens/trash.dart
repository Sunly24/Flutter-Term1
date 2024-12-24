import 'package:flutter/material.dart';
import 'package:note_taking_app/models/note.dart';
import 'package:note_taking_app/style/color.dart';

class TrashScreen extends StatelessWidget {
  final List<Note> deletedNotes;
  final Function(Note) onRestore;
  final Function(Note) onDeleteFromTrash;

  const TrashScreen({
    super.key,
    required this.deletedNotes,
    required this.onRestore,
    required this.onDeleteFromTrash,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 25)),
            Text(
              "Trash",
              style: TextStyle(
                color: fourthColor,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: deletedNotes.isEmpty
          ? const Center(
              child: Text(
                "No notes in trash!",
                style: TextStyle(color: thirdColor, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: deletedNotes.length,
              itemBuilder: (context, index) {
                final note = deletedNotes[index];
                return Dismissible(
                  key: ValueKey(note.id),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      onRestore(note);
                    } else if (direction == DismissDirection.endToStart) {
                      onDeleteFromTrash(note);
                    }
                  },
                  background: Container(
                    color: Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(Icons.restore, color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child:
                        const Icon(Icons.delete_forever, color: Colors.white),
                  ),
                  child: Card(
                    color: secondColor,
                    child: ListTile(
                      title: Text(
                        note.title,
                        style: const TextStyle(
                          color: fourthColor,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        note.content,
                        style: const TextStyle(color: fourthColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
