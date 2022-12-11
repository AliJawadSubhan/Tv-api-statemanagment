import 'package:flutter/material.dart';
import 'package:mvvmprovider/resources/colors.dart';
import 'package:mvvmprovider/resources/components/round_button.dart';
import 'package:mvvmprovider/utilities/routes/routes_name.dart';
import 'package:mvvmprovider/utilities/utils.dart';
import 'package:mvvmprovider/view_model/Auth_view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../resources/components/appBar.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});

  ValueNotifier<bool> passwordObscure = ValueNotifier<bool>(true);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: CustomAppBar(text: 'Login'),
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                  child: TextFormField(
                    focusNode: emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'Email',
                    ),
                    onFieldSubmitted: (val) {
                      Utils.focusNodeChange(
                          context, emailFocusNode, passwordFocusNode);
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                  child: ValueListenableBuilder(
                    valueListenable: passwordObscure,
                    builder: (context, value, child) {
                      return TextFormField(
                        obscureText: passwordObscure.value,
                        focusNode: passwordFocusNode,
                        controller: passwordController,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.password),
                          hintText: 'Password',
                          suffixIcon: InkWell(
                            onTap: () {
                              passwordObscure.value = !passwordObscure.value;
                            },
                            child: Icon(
                              passwordObscure.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                RoundButton(
                  loading: authViewModel.loading,
                  text: 'login',
                  onpress: () {
                    Map data = {
                      "email": emailController.text.toString(),
                      "password": passwordController.text.toString(),
                    };
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      Utils.flushErorMessage('Please type an Input', context);
                    } else {
                      authViewModel.loginApi(data, context);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.signupScreen);
                      },
                      child: const Text(
                        'Sign up!',
                        style: TextStyle(
                          color: AppColor.roundButtonColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
