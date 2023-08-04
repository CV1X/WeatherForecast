import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Login/bloc/app_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomeScreen());

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return Scaffold(
      appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          )),
      body: Align(
        alignment: const Alignment(0, -0.6),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_open,
                size: 100,
                color: Colors.grey.shade600,
              ),
              const SizedBox(height: 150),
              CircleAvatar(
                radius: 48,
                backgroundImage:
                    user.photo != null ? NetworkImage(user.photo!) : null,
                child: user.photo == null
                    ? const Icon(Icons.person_outline, size: 48)
                    : null,
              ),
              const SizedBox(height: 10),
              Text("Hello ${user.email}" ?? '',
                  style: const TextStyle(fontSize: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
