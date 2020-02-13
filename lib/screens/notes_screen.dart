import 'package:flutter/material.dart';

import 'new_note_screen.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({Key key, @required this.title}) : super(key: key);

  final String title;
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Center(
        child: Text('hello'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(NewNoteScreen.routeName),
        child: Icon(Icons.add),
      ),
    );
  }
}
