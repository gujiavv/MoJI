import 'package:flutter/material.dart';
import 'package:water_ripple/db/notes_database.dart';
import 'package:water_ripple/model/note.dart';
import 'package:water_ripple/page/note_form_widget.dart';

class EditNotePage extends StatefulWidget {
  final Note note;
  final int number;
  final String title;
  final String description;
  const EditNotePage({
    Key key,
    this.note,
    this.number,
    this.title,
    this.description,
  }) : super(key: key);

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  final _formKey = GlobalKey<FormState>();
  int number;
  String title;
  String description;

  @override
  void initState() {
    number = widget.note != null ? widget.note.number : 1;
    title = widget.note != null ? widget.note.title : '';
    description = widget.note != null ? widget.note.description : '';
    super.initState();
  }

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        child: const Text('Save'),
        onPressed: addOrUpdateNote,
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      final isUpdating = widget.note != null;
      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }
      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.note.copy(
      number: number,
      title: title,
      description: description,
    );
    await NotesDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Note(
      number: number,
      title: title,
      description: description,
      createdTime: DateTime.now(),
    );
    await NotesDatabase.instance.create(note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [buildButton()],
      ),
      body: Form(
        key: _formKey,
        child: NoteFormWidget(
          number: number,
          title: title,
          description: description,
          onChangeNumber: (number) {
            setState(() {
              this.number = number;
            });
          },
          onChangeTitle: (title) {
            setState(() {
              this.title = title;
            });
          },
          onChangeDescription: (description) {
            setState(() {
              this.description = description;
            });
          },
        ),
      ),
    );
  }
}
