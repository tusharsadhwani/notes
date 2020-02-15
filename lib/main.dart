import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/notes_screen.dart';
import 'screens/new_note_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: GoogleFonts.yesevaOne(
              color: Colors.black,
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo.shade50,
        textTheme: TextTheme(
          display1: TextStyle(
            color: Colors.black87,
            fontFamily: GoogleFonts.alegreya().fontFamily,
            fontSize: 22.0,
          ),
          display2: TextStyle(
            fontFamily: GoogleFonts.alegreya().fontFamily,
            color: Colors.black,
            fontSize: 36.0,
            height: 1.5,
          ),
          button: TextStyle(
            fontFamily: GoogleFonts.openSans().fontFamily,
          ),
        ),
      ),
      home: NotesScreen(title: 'Quill'),
      routes: {
        NewNoteScreen.routeName: (_) => NewNoteScreen(),
      },
    );
  }
}
