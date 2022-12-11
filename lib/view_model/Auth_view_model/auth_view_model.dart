import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvmprovider/repositry/auth_repositry.dart';
import 'package:mvvmprovider/utilities/routes/routes_name.dart';
import 'package:mvvmprovider/utilities/utils.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../view_model/user_view_model/user_view_model.dart';

class AuthViewModel extends ChangeNotifier {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  final myAuthRepositry = AuthRepositry();

  bool _loading = false;

  bool get loading => _loading;

  loadingPerform(bool val) {
    _loading = val;
    notifyListeners();
  }

  

  Future<void> loginApi(dynamic data, BuildContext context) async {
    loadingPerform(true);

    myAuthRepositry.loginApi(data).then((value) {
      loadingPerform(false);

      final userpref = Provider.of<UserViewModel>(context, listen: false);
      userpref.saveUser(UserModel(
        token: value['token'].toString(),
      ));
      Utils.flushMessage(value.toString(), context);
      Navigator.pushReplacementNamed(context, RoutesName.homeScreen);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      loadingPerform(false);
      if (kDebugMode) {
        Utils.flushErorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
  ////////////////////
  ///
  ///
 bool _signupLoading = false;
  bool get signuploading => _signupLoading;
  signupLoading(bool val) {
    _signupLoading = val;
    notifyListeners();
  }
  Future<void> signUp(dynamic data, BuildContext context) async {
    signupLoading(true);
    myAuthRepositry.signUp(data).then((value) {
      signupLoading(false);
      Utils.flushMessage('Signed Up', context);
      Navigator.pushReplacementNamed(context, RoutesName.homeScreen);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      signupLoading(false);
      if (kDebugMode) {
        Utils.flushErorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
