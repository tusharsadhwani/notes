import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            ),
          ),
        ),
        primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo.shade50,
        textTheme: TextTheme(
            body1: TextStyle(
              fontFamily: GoogleFonts.alegreya().fontFamily,
              fontSize: 22.0,
            ),
            display1: TextStyle(
              fontFamily: GoogleFonts.alegreya().fontFamily,
              color: Colors.black87,
              fontSize: 36.0,
              height: 1.5,
            ),
            button: TextStyle(
              // fontFamily: GoogleFonts.openSans().fontFamily,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            )),
      ),
      home: MyHomePage(title: 'NotesApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: Theme.of(context).textTheme.display1,
              ),
              Text(
                'Non amet sit sit aliqua. Et consequat cillum laborum ipsum occaecat pariatur labore commodo. Deserunt aliqua dolor ut sunt dolore eiusmod exercitation ut sint. Ex cupidatat minim nulla laborum sunt mollit tempor irure officia.\n\nDo amet dolor est dolore non in nostrud nostrud reprehenderit sunt eiusmod. Irure cupidatat labore commodo sunt nulla id esse exercitation cupidatat commodo culpa qui qui. Tempor quis exercitation ad qui officia. Proident ipsum fugiat nisi nostrud.',
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 6.0,
                  ),
                  child: Text("Publish"),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(width: 2.0)),
                onPressed: () {},
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ));
  }
}
