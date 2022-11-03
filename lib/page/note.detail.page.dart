import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_ripple/db/notes_database.dart';
import 'package:water_ripple/model/note.dart';
import 'package:water_ripple/page/edit_notes.dart';

class NoteDetailPage extends StatefulWidget {
  final int noteId;
  const NoteDetailPage({
    Key key,
    @required this.noteId,
  }) : super(key: key);

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  Note note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNote();
  }

  Future refreshNote() async {
    setState(() {
      isLoading = true;
    });
    note = await NotesDatabase.instance.readNote(widget.noteId);
    setState(() {
      isLoading = false;
    });
  }

  Widget editButton() => IconButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditNotePage(
                note: note,
              ),
            ),
          );
          refreshNote();
        },
        icon: const Icon(Icons.edit_outlined),
      );

  Widget deleteButton() => IconButton(
        onPressed: () async {
          await NotesDatabase.instance.delete(note.id);
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.delete),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      note.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      DateFormat.yMMMd().format(note.createdTime),
                      style: const TextStyle(color: Colors.white38),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      note.description,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 18),
                    )
                  ],
                ),
              ));
  }
}
