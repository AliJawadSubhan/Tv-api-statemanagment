import 'package:flutter/material.dart';
import 'package:mvvmprovider/utilities/routes/routes_name.dart';
import 'package:mvvmprovider/view_model/Auth_view_model/auth_view_model.dart';
import 'package:mvvmprovider/view_model/home_view_model/home_view_model.dart';
import 'package:mvvmprovider/view_model/tv_view_model/tv_view_modl.dart';
import 'package:mvvmprovider/view_model/user_view_model/user_view_model.dart';
// import 'package:mvvmprovider/views/login_view/login_view.dart';
import 'package:provider/provider.dart';

import 'utilities/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => TvViewModel(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        initialRoute: RoutesName.splashScren,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
