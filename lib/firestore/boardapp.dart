import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BoardApp extends StatefulWidget {
  const BoardApp({super.key});

  @override
  State<BoardApp> createState() => _BoardAppState();
}

class _BoardAppState extends State<BoardApp> {
  var firestoreDb = FirebaseFirestore.instance.collection("board").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Community Board"),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: firestoreDb,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, int index) {
                    return Text(snapshot.data?.docs[index]['title']);
                  });
            }
          },
        ));
  }
}
