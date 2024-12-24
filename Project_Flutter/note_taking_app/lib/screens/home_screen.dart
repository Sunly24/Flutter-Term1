import 'package:flutter/material.dart';
import 'package:note_taking_app/models/note.dart';
import 'package:note_taking_app/screens/trash.dart';
import 'package:note_taking_app/widgets/note_list.dart';
import 'package:note_taking_app/screens/note_screen.dart';
import 'package:note_taking_app/style/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Note> _notes = [
    Note(
      id: '1',
      title: 'Shopping List',
      content: 'Milk, Eggs, Bread, Butter, Apples, Chicken, Coffee',
      addTime: DateTime.now(),
      modifiedTime: DateTime.now(),
    ),
    Note(
      id: '2',
      title: 'Meeting Notes',
      content: 'Discuss project milestones, assign tasks, finalize deadlines',
      addTime: DateTime.now(),
      modifiedTime: DateTime.now(),
    ),
    Note(
      id: '3',
      title: 'Vacation Plans',
      content:
          'Visit Paris, book flight tickets, research hotels, check local attractions',
      addTime: DateTime.now(),
      modifiedTime: DateTime.now(),
    ),
  ];
  List<Note> _filteredNotes = [];
  final List<Note> _deletedNotes = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredNotes = _notes;
    _searchController.addListener(_onSearch);
  }

  void _addNote(Note note) {
    setState(() {
      _notes.add(note);
      _filteredNotes = _notes;
    });
  }

  void _editNote(Note editNote) {
    setState(() {
      final index = _notes.indexWhere((n) => n.id == editNote.id);
      if (index != -1) {
        _notes[index] = editNote;
      }
      _onSearch();
    });
  }

  void _navigateToTakeNote() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TakeNote(
          mode: Mode.adding,
          onSave: _addNote,
        ),
      ),
    );
  }

  void _onSearch() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredNotes = _notes.where((note) {
        return note.title.toLowerCase().contains(query) ||
            note.content.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _deleteNoteToTrash(Note note) {
    setState(() {
      _notes.removeWhere((n) => n.id == note.id);
      _deletedNotes.add(note);
      _onSearch();
    });
  }

  void _restoreNoteFromTrash(Note note) {
    setState(() {
      _deletedNotes.removeWhere((n) => n.id == note.id);
      _notes.add(note);
      _onSearch();
    });
  }

  void _deleteFromTrash(Note note) {
    setState(() {
      _deletedNotes.removeWhere((n) => n.id == note.id);
    });
  }

  void _navigateToTrash() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TrashScreen(
          deletedNotes: _deletedNotes,
          onRestore: _restoreNoteFromTrash,
          onDeleteFromTrash: _deleteFromTrash,
        ),
      ),
    );
  }

  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: 'Note Taking App',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(Icons.note),
      children: [
        const Text('This is a simple note-taking app made with Flutter.'),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: PopupMenuButton(
              color: secondColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              icon: const Icon(
                Icons.more_horiz,
                color: fourthColor,
                size: 40,
              ),
              onSelected: (value) {
                switch (value) {
                  case "Trash":
                    _navigateToTrash();
                    break;
                  case "About":
                    _showAboutDialog();
                    break;
                  default:
                    break;
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'Trash',
                  child: SizedBox(
                    width: 100,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trash',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.delete_rounded),
                      ],
                    ),
                  ),
                ),
                const PopupMenuItem(
                  value: 'About',
                  child: SizedBox(
                    width: 100,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'About',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.info),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search, color: thirdColor),
                fillColor: secondColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _filteredNotes.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/note.png',
                          width: 200,
                          height: 200,
                        ),
                        const Text(
                          "No notes yet!",
                          style: TextStyle(
                            color: thirdColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  : NoteList(
                      notes: _filteredNotes,
                      onEdit: _editNote,
                      onDelete: _deleteNoteToTrash,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToTakeNote,
        backgroundColor: secondColor,
        elevation: 10,
        label: const Text('Add Note'),
        icon: const Icon(
          Icons.add,
          size: 38,
        ),
      ),
    );
  }
}
