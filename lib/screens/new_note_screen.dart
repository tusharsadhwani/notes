import 'package:flutter/material.dart';

class NewNoteScreen extends StatefulWidget {
  static const routeName = '/newnote';

  @override
  _NewNoteScreenState createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: Theme.of(context).textTheme.display2,
            ),
            Text(
              'Non amet sit sit aliqua. Et consequat cillum laborum ipsum occaecat pariatur labore commodo. Deserunt aliqua dolor ut sunt dolore eiusmod exercitation ut sint. Ex cupidatat minim nulla laborum sunt mollit tempor irure officia.\n\nDo amet dolor est dolore non in nostrud nostrud reprehenderit sunt eiusmod. Irure cupidatat labore commodo sunt nulla id esse exercitation cupidatat commodo culpa qui qui. Tempor quis exercitation ad qui officia. Proident ipsum fugiat nisi nostrud.',
              style: Theme.of(context).textTheme.display1,
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
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
