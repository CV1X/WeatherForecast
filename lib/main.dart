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
import 'firebase_options.dart';
// import 'package:flutter_1/WeatherForecast/WF.dart';
//import 'package:flutter_1/ui/home.dart';

//import 'BLocAPP/features/home/ui/homeBLOC.dart';
//import 'Json/json.dart';
//import 'ui/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();

  runApp(BlocProvider(
    create: (context) => AuthenticationBloc(userRepository: userRepository),
    child: MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationFailure) {
            return LoginPage();
          }
          // if (state is AuthenticationSuccess) {
          //   return HomePage();
          // }
          return LoginPage();
        },
      ),
    ),
  ));
}
