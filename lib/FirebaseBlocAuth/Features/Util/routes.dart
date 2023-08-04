import 'package:flutter/widgets.dart';

import '../Home/Widgets/home_screen.dart';
import '../Login/Widgets/login_screen.dart';
import '../Login/bloc/app_bloc.dart';

List<Page> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}
