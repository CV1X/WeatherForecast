import 'dart:async';

import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_1/Geolocator/geo_locator.dart';
import 'package:flutter_1/Login%20Form/Features/AuthPage/Widgets/auth_page.dart';
// import 'package:flutter_1/Login%20Form/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_1/Login%20Form/Features/AuthPage/bloc/auth_bloc.dart';
import 'package:flutter_1/Login%20Form/Features/Home/Widgets/home_page.dart';
import 'package:flutter_1/Login%20Form/Features/Login/Widgets/login_page.dart';
import 'package:flutter_1/Login%20Form/Features/util/bloc_observer.dart';
import 'package:flutter_1/Login%20Form/Repository/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_1/Shared_Preferences/shared_preferences.dart';
import 'FirebaseBlocAuth/Features/Login/bloc/app_bloc.dart';
import 'FirebaseBlocAuth/Features/Util/routes.dart';
import 'FirebaseBlocAuth/repositories/auth_repository.dart';
import 'bloc_observer.dart';
import 'firebase_options.dart';
// import 'package:flutter_1/WeatherForecast/WF.dart';
//import 'package:flutter_1/ui/home.dart';
//import 'BLocAPP/features/home/ui/homeBLOC.dart';
//import 'Json/json.dart';
//import 'ui/home.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   Bloc.observer = SimpleBlocObserver();
//   final UserRepository userRepository = UserRepository();

//   runApp(BlocProvider(
//     create: (context) => AuthenticationBloc(userRepository: userRepository),
//     child: MaterialApp(
//       theme: ThemeData(
//         brightness: Brightness.dark,
//       ),
//       home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
//         builder: (context, state) {
//           if (state is AuthenticationFailure) {
//             return LoginPage();
//           }
//           // if (state is AuthenticationSuccess) {
//           //   return HomePage();
//           // }
//           return LoginPage();
//         },
//       ),
//     ),
//   ));
// }

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final authRepository = AuthRepository();
      runApp(App(authRepository: authRepository));
    },
    (error, stackTrace) {
      print('Uncaught error: $error');
      print(stackTrace);
    },
    //blocObserver: AppBlocObserver(),
  );
}

class App extends StatelessWidget {
  const App({super.key, required this.authRepository});
  final AuthRepository authRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authRepository: authRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
