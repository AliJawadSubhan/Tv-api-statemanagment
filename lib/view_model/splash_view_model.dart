import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvmprovider/models/user_model.dart';
import 'package:mvvmprovider/utilities/routes/routes_name.dart';
import 'package:mvvmprovider/view_model/user_view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuth(context) {
    getUserData().then((value) async {
      print(value.token);
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(
          Duration(seconds: 3),
        );
        Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
      } else {
        await Future.delayed(
          Duration(seconds: 3),
        );
        Navigator.pushReplacementNamed(context, RoutesName.homeScreen);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
