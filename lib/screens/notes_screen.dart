import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'new_note_screen.dart';
import '../widgets/note.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({Key key, @required this.title}) : super(key: key);

  final String title;
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  var notes = [
    {
      'title': "Test Note",
      'body': "Idk what to type here just making something up uwu",
    },
    {
      'title': "Lorem Big",
      'body':
          "Cillum laboris voluptate ut laborum mollit nulla. Consequat nostrud tempor exercitation officia cillum laboris. Eiusmod enim incididunt non do. Dolor sint aute eu consequat non aliqua ex. Amet id do est nostrud est anim sint ullamco eiusmod in commodo nisi occaecat. Reprehenderit eiusmod consequat esse voluptate laboris excepteur velit est ad. Esse velit in nulla amet mollit aute. Pariatur laborum exercitation reprehenderit id adipisicing ut cillum.",
    },
    {
      'title': "Groceries",
      'body': "- spam\n- eggs\n- meat\n- bacon\n- cheese\n- milk",
    },
    {
      'title': "Big title note: 10 step plan to success",
      'body':
          "Success is something that everyone desires, but there is no such thing as a sure-shot way to earn success sorry",
    },
    {
      'title': "yo",
      'body': "sup",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemBuilder: (ctx, idx) =>
              Note(notes[idx]['title'], notes[idx]['body']),
          itemCount: notes.length,
          staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(NewNoteScreen.routeName),
        child: Icon(Icons.add),
      ),
    );
  }
}
