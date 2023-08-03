import 'package:flutter/material.dart';
import 'package:flutter_1/Shared_Preferences/home_screen.dart';

class Shared_Preferences extends StatelessWidget {
  const Shared_Preferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
        centerTitle: true,
      ),
      body: HomeScreen(),
    );
  }
}
