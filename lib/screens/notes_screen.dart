import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'new_note_screen.dart';
import '../widgets/note.dart';
import '../models/notes_database.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({Key key, @required this.title}) : super(key: key);

  final String title;
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<NotesDatabase>(context).notes;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.robotoSlab(
            color: Colors.black,
            fontSize: 25.0,
            shadows: [
              Shadow(
                color: Colors.grey,
                offset: Offset(0.8, 1.5),
                blurRadius: 5.0,
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemBuilder: (ctx, idx) => Note(
            id: notes[idx]['id'],
            title: notes[idx]['title'],
            body: notes[idx]['body'],
          ),
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
