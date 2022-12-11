import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void focusNodeChange(
      context, FocusNode currentfocus, FocusNode nextfocus) {
    currentfocus.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }

  static flushErorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
          borderRadius: BorderRadius.circular(21),
          forwardAnimationCurve: Curves.easeIn,
          flushbarPosition: FlushbarPosition.TOP,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          backgroundColor: Colors.black,
          reverseAnimationCurve: Curves.easeInOut,
          // showProgressIndicator: true,
          icon: const Icon(
            Icons.error,
            size: 20,
            color: Colors.red,
          ),
          // progressIndicatorBackgroundColor: Colors.orange,
          flushbarStyle: FlushbarStyle.FLOATING,
          message: message,
          duration: Duration(seconds: 3))
        ..show(context),
    );
  }
  static flushMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
          borderRadius: BorderRadius.circular(21),
          forwardAnimationCurve: Curves.easeIn,
          flushbarPosition: FlushbarPosition.TOP,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          backgroundColor: Colors.black,
          reverseAnimationCurve: Curves.easeInOut,
          // showProgressIndicator: true,
          icon: const Icon(
            Icons.check,
            size: 20,
            color: Colors.green,
          ),
          // progressIndicatorBackgroundColor: Colors.orange,
          flushbarStyle: FlushbarStyle.FLOATING,
          message: message,
          duration: Duration(seconds: 3))
        ..show(context),
    );
  }
}
