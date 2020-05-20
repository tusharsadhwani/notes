import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/edit_note_screen.dart';

class Note extends StatelessWidget {
  final int id;
  final String title, body;
  Note({
    @required this.id,
    @required this.title,
    @required this.body,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Color.fromRGBO(191, 191, 191, 1)),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => EditNoteScreen(
              id: id,
              title: title,
              body: body,
            ),
          ),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: 240,
          ),
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: GoogleFonts.robotoSlab().fontFamily,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Text(body),
            ],
          ),
        ),
      ),
    );
  }
}
