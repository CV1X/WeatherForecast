// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_1/Login%20Form/Features/Login/bloc/login_bloc.dart';
import 'package:flutter_1/Login%20Form/Repository/user_repo.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.hintText,
    required this.obscureText,
    this.controller,
    this.userRepository,
  }) : super(key: key);

  final UserRepository? userRepository;

  final controller;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10)),
          fillColor: Colors.grey.shade900,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
