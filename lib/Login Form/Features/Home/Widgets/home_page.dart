import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: signUserOut,
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(child: Text("Hello  " + user!.email!)),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
}
