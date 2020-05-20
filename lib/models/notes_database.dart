import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase with ChangeNotifier {
  Database _db;
  List<Map<String, dynamic>> _notes;

  NotesDatabase() {
    _notes = [];
    _initDatabase();
  }

  void _initDatabase() async {
    _db = await openDatabase('notes.db');
    print('database ready');
    // _db.execute('DROP TABLE IF EXISTS Notes');
    _db.execute(
        'CREATE TABLE IF NOT EXISTS Notes (id INTEGER PRIMARY KEY, title TEXT, body TEXT)');
    _queryDatabase();
  }

  Future<void> _queryDatabase() async {
    while (true) {
      try {
        _notes = await _db.query('Notes');
        notifyListeners();
      } catch (e) {
        await Future.delayed(Duration(milliseconds: 300));
      }
    }
  }

  List<Map<String, dynamic>> get notes {
    return _notes;
  }

  Future<void> addNote(String title, String body) async {
    await _db
        .rawInsert('INSERT INTO Notes(title, body) VALUES ("$title", "$body")');
    _queryDatabase();
  }
}
