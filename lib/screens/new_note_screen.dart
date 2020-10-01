import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/notes_database.dart';
import '../widgets/note_editor.dart';

class NewNoteScreen extends StatefulWidget {
  static const routeName = '/newnote';

  @override
  _NewNoteScreenState createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  TextEditingController _title;
  TextEditingController _body;
  NotesDatabase db;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController();
    _body = TextEditingController();
    db = Provider.of<NotesDatabase>(context, listen: false);
  }

  void publishNote() async {
    await db.addNote(_title.text, _body.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Note')),
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
                    "Publish",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(width: 2.0),
                ),
                onPressed: publishNote,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
