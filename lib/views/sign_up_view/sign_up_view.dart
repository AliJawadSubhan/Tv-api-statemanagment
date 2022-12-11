import 'package:flutter/material.dart';
import 'package:mvvmprovider/resources/colors.dart';
import 'package:mvvmprovider/resources/components/round_button.dart';
import 'package:mvvmprovider/utilities/routes/routes_name.dart';
import 'package:mvvmprovider/utilities/utils.dart';
import 'package:mvvmprovider/view_model/Auth_view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../resources/components/appBar.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  ValueNotifier<bool> confirmPsswordObscure = ValueNotifier<bool>(true);
  ValueNotifier<bool> passwordObscure = ValueNotifier<bool>(true);
  FocusNode confirmPasswordNode = FocusNode();
  TextEditingController emailController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: const CustomAppBar(text: 'Sign UP'),
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10),
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
                              child: Icon(passwordObscure.value
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                        onFieldSubmitted: (val) {
                          Utils.focusNodeChange(
                              context, passwordFocusNode, confirmPasswordNode);
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10),
                  child: ValueListenableBuilder(
                    valueListenable: confirmPsswordObscure,
                    builder: (context, value, child) {
                      return TextFormField(
                        obscureText: confirmPsswordObscure.value,
                        focusNode: confirmPasswordNode,
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.password),
                          hintText: 'Confirm Password',
                          suffixIcon: InkWell(
                              onTap: () {
                                confirmPsswordObscure.value =
                                    !confirmPsswordObscure.value;
                              },
                              child: Icon(confirmPsswordObscure.value
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                      );
                    },
                  ),
                ),
                RoundButton(
                  loading: authViewModel.signuploading,
                  text: 'Sign UP',
                  onpress: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      Utils.flushErorMessage('Please type an Input', context);
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      Utils.flushErorMessage(
                          'Confirm Password Does Not match.', context);
                    } else {
                      Map data = {
                        "email": emailController.text.toString(),
                        "password": confirmPasswordController.text.toString(),
                      };
                      authViewModel.signUp(data, context);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.loginScreen);
                      },
                      child: const Text(
                        'Login!',
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
