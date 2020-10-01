import 'package:flutter/material.dart';

class NoteEditor extends StatefulWidget {
  final TextEditingController title;
  final TextEditingController body;

  const NoteEditor({Key key, this.title, this.body}) : super(key: key);

  @override
  _NoteEditorState createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  FocusNode bodyNode;

  void initState() {
    super.initState();
    bodyNode = FocusNode();
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.title,
          decoration: InputDecoration(
            hintText: 'Title',
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: 3,
          style: Theme.of(context).textTheme.headline3,
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => bodyNode.requestFocus(),
        ),
        TextField(
          focusNode: bodyNode,
          controller: widget.body,
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
