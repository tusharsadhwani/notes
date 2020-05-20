import 'package:flutter/material.dart';

class NoteEditor extends StatelessWidget {
  final TextEditingController title;
  final TextEditingController body;

  const NoteEditor({Key key, this.title, this.body}) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: title,
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
          controller: body,
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
      ],
    );
  }
}
