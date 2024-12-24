import 'package:flutter/material.dart';
import 'package:note_taking_app/models/note.dart';
import 'package:note_taking_app/style/color.dart';
import 'package:uuid/uuid.dart';

enum Mode { adding, editing }

class TakeNote extends StatefulWidget {
  final Function(Note)? onSave;
  final Mode mode;
  final Note? note;

  const TakeNote({
    super.key,
    required this.onSave,
    required this.mode,
    this.note,
  });

  @override
  State<TakeNote> createState() => _TakeNoteState();
}

class _TakeNoteState extends State<TakeNote> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  final Uuid _uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.note?.title ?? '',
    );
    _contentController = TextEditingController(
      text: widget.note?.content ?? '',
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveNote() {
    if (widget.onSave != null) {
      final newNote = Note(
        id: widget.note?.id ?? _uuid.v4(),
        title: _titleController.text,
        content: _contentController.text,
        addTime: widget.note?.addTime ?? DateTime.now(),
        modifiedTime: DateTime.now(),
      );
      widget.onSave!(newNote);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstColor,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 25)),
            Text(
              "Notes",
              style: TextStyle(
                color: fourthColor,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                TextField(
                  controller: _titleController,
                  style: const TextStyle(
                      color: fourthColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(color: thirdColor, fontSize: 30)),
                  maxLines: null,
                ),
                TextField(
                  controller: _contentController,
                  style: const TextStyle(
                    color: fourthColor,
                  ),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type something here...',
                      hintStyle: TextStyle(color: thirdColor)),
                  maxLines: null,
                ),
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _saveNote,
        elevation: 10,
        backgroundColor: secondColor,
        label: const Text('Save'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
