import 'package:flutter/material.dart';
import 'package:mvvmprovider/resources/colors.dart';

class RoundButton extends StatelessWidget {
  RoundButton(
      {super.key,
      required this.text,
      this.loading = false,
      required this.onpress});
  final String text;
  final bool loading;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: InkWell(
          onTap: onpress,
          child: Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: AppColor.roundButtonColor,
            ),
            child: loading
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: CircularProgressIndicator(
                        color: AppColor.whiteColor,
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      text,
                      style: const TextStyle(color: AppColor.whiteColor),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
