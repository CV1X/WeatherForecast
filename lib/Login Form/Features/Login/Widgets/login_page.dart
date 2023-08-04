import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/Login%20Form/Features/Login/Widgets/my_button.dart';
import 'package:flutter_1/Login%20Form/Features/Login/Widgets/text_field.dart';
import 'package:flutter_1/Login%20Form/Features/Login/bloc/login_bloc.dart';
import 'package:flutter_1/Login%20Form/Features/Login/bloc/login_event.dart';
import 'package:flutter_1/Login%20Form/Repository/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final UserRepository userRepository = UserRepository();

  late LoginBloc loginBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
    usernameController.addListener(() {
      _onEmailChange();
    });
    passwordController.addListener(() {
      _onPasswordChange();
    });
  }

  // sign user in
  void singInUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop loading screen

      Navigator.pop(context);

      // Wrong Email

      if (e.code == 'user-not-found') {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text("Incorrect Email"),
              );
            });

        //Wrong Password

        if (e.code == 'wrong-password') {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text("Invalid Password"),
                );
              });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure!) {}
        if (state.isSubmitting!) {}
        if (state.isSuccess!) {}
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey.shade700,
            body: BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(userRepository: userRepository),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SPACEING

                        const SizedBox(
                          height: 20,
                        ),

                        //LOGO

                        Icon(
                          Icons.lock,
                          size: 100,
                          color: Colors.black,
                        ),

                        // SPACEING

                        const SizedBox(
                          height: 30,
                        ),

                        //Welcome Back

                        Text(
                          "Welcome back ! You've been Missed !",
                          style: TextStyle(
                              fontSize: 18, color: Colors.grey.shade200),
                        ),

                        // SPACEING

                        const SizedBox(
                          height: 40,
                        ),

                        // Username TextField
                        MyTextField(
                          controller: usernameController,
                          hintText: 'Username',
                          obscureText: false,
                          userRepository: userRepository,
                        ),

                        // SPACEING

                        const SizedBox(
                          height: 20,
                        ),

                        //Password TextField

                        MyTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                        ),

                        // SPACEING

                        const SizedBox(
                          height: 20,
                        ),

                        //Forgot password?
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.grey.shade300),
                              ),
                            ],
                          ),
                        ),

                        // SPACEING

                        const SizedBox(
                          height: 25,
                        ),

                        //SignIn Button

                        MyButton(onTap: _onFormSubmitted),

                        // SPACEING

                        const SizedBox(
                          height: 25,
                        ),

                        //...Or continue with
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 3,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "Or Continue With :",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 3,
                              ),
                            ),
                          ],
                        ),

                        // SPACEING

                        const SizedBox(
                          height: 20,
                        ),

                        // Google+Apple sing in buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // google button
                            Image.asset(
                              'images/google-g57f7748f2_1280.png',
                              height: 50,
                            ),

                            //apple button

                            const SizedBox(
                              width: 20,
                            ),

                            Image.asset(
                              'images/apple-emblem-removebg-preview.png',
                              color: Colors.black,
                              height: 50,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        //Register Now

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Not a member?",
                              style: TextStyle(color: Colors.grey.shade300),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Register Now",
                              style: TextStyle(
                                  color: Colors.blue.shade300,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void _onEmailChange() {
    loginBloc.add(LoginEmailChange(email: usernameController.text));
  }

  void _onPasswordChange() {
    loginBloc.add(LoginPasswordChanged(password: passwordController.text));
  }

  void _onFormSubmitted() {
    loginBloc.add(LoginWithCredentialsPressed(
        password: passwordController.text, email: usernameController.text));
  }
}
