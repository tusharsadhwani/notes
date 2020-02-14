import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  final String title, body;
  Note(this.title, this.body);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border:
            Border.all(width: 2.0, color: Theme.of(context).primaryColorDark),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Text(body),
    );
  }
}
