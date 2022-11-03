import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:water_ripple/db/notes_database.dart';
import 'package:water_ripple/model/note.dart';
import 'package:water_ripple/page/edit_notes.dart';
import 'package:water_ripple/page/note.detail.page.dart';
import 'package:water_ripple/page/note_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final isLoading = false;
  List<Note> notes = [];

  @override
  void initState() {
    refreshNotes();
    super.initState();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();
    super.dispose();
  }

  Future refreshNotes() async {
    setState(() {});
    notes = await NotesDatabase.instance.readAllNotes();
    setState(() {});
  }

  Widget buildNotes() => StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NoteDetailPage(
                    noteId: note.id,
                  ),
                ),
              );
              refreshNotes();
            },
            child: NoteCardWidget(
              note: note,
              index: index,
            ),
          );
        },
        staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(fontSize: 24),
        ),
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: notes != null && notes.isNotEmpty
          ? buildNotes()
          : const Center(
              child: Text(
                'no data',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const EditNotePage()),
          );
          refreshNotes();
        },
      ),
    );
  }
}
