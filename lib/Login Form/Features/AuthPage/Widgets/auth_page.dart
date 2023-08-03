import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/Login%20Form/Features/Login/Widgets/login_page.dart';
import 'package:flutter_1/Login%20Form/Repository/user_repo.dart';

import '../../Home/Widgets/home_page.dart';

class AuthPage extends StatelessWidget {
  final UserRepository userRepository = UserRepository();

  AuthPage({super.key, UserRepository? userRepository});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is logged in

            if (snapshot.hasData) {
              return HomePage();
            }

            // user is NOT Logged in
            else {
              return LoginPage();
            }
          }),
    );
  }
}
