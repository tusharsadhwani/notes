import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/notes_database.dart';

class NewNoteScreen extends StatefulWidget {
  static const routeName = '/newnote';

  @override
  _NewNoteScreenState createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  TextEditingController _title;
  TextEditingController _body;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController();
    _body = TextEditingController();
  }

  void publishNote() async {
    final db = Provider.of<NotesDatabase>(context, listen: false);
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
              TextField(
                controller: _title,
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 3,
                style: Theme.of(context).textTheme.headline3,
              ),
              TextField(
                controller: _body,
                decoration: InputDecoration(
                  hintText: 'Note text',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 12.0,
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
                    side: BorderSide(width: 2.0)),
                onPressed: publishNote,
              )
            ],
          ),
        ),
      ),
    );
  }
}
