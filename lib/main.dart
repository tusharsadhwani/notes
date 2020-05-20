import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/models/notes_database.dart';
import 'package:provider/provider.dart';

import 'screens/notes_screen.dart';
import 'screens/new_note_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: NotesDatabase()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: Colors.indigo.shade50,
          textTheme: TextTheme(
            headline4: TextStyle(
              color: Colors.black87,
              fontFamily: GoogleFonts.openSans().fontFamily,
              fontSize: 18.0,
            ),
            headline3: TextStyle(
              fontFamily: GoogleFonts.robotoSlab().fontFamily,
              color: Colors.black,
              fontSize: 32.0,
            ),
            button: TextStyle(
              fontFamily: GoogleFonts.openSans().fontFamily,
            ),
          ),
        ),
        home: NotesScreen(title: 'Notes'),
        routes: {
          NewNoteScreen.routeName: (_) => NewNoteScreen(),
        },
      ),
    );
  }
}
