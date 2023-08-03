import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  String? noteValue;

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes List"),
        centerTitle: true,
      ),
      body: Center(
          child: noteValue == null
              ? Text("No notes available")
              : Text(noteValue!)),
    );
  }

  void getNotes() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    noteValue = pref.getString('noteData');
    setState(() {});
  }
}
