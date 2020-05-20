import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/notes_database.dart';
import '../widgets/note_editor.dart';

class EditNoteScreen extends StatefulWidget {
  final int id;
  final String title, body;
  EditNoteScreen({
    @required this.id,
    @required this.title,
    @required this.body,
  });

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController _title;
  TextEditingController _body;
  NotesDatabase db;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: widget.title);
    _body = TextEditingController(text: widget.body);
    db = Provider.of<NotesDatabase>(context, listen: false);
  }

  void saveEdits() async {
    await db.editNode(widget.id, _title.text, _body.text);
    Navigator.of(context).pop();
  }

  void deleteNote() async {
    await db.deleteNote(widget.id);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: deleteNote,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NoteEditor(
                title: _title,
                body: _body,
              ),
              FlatButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2.0,
                    vertical: 4.0,
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(width: 2.0)),
                onPressed: saveEdits,
              )
            ],
          ),
        ),
      ),
    );
  }
}
