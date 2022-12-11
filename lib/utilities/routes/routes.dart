import 'package:flutter/material.dart';
import 'package:mvvmprovider/utilities/routes/routes_name.dart';
import 'package:mvvmprovider/views/home_view/home_view.dart';
import 'package:mvvmprovider/views/login_view/login_view.dart';
import 'package:mvvmprovider/views/sign_up_view/sign_up_view.dart';
import 'package:mvvmprovider/views/splash_view/splash_view.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case RoutesName.loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );
        
      case RoutesName.splashScren:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case RoutesName.signupScreen:
        return MaterialPageRoute(
          builder: (context) => SignUp(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No Routes Defined!'),
            ),
          ),
        );
    }
  }
}
