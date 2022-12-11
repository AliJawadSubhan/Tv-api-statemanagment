import 'package:flutter/material.dart';
import 'package:mvvmprovider/resources/colors.dart';
import 'package:mvvmprovider/resources/components/upper_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text});

  final String text;

  @override
  Size get preferredSize => Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.transparent,
      elevation: 0.00,
      flexibleSpace: ClipPath(
        clipper: ClipperCustom(),
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          color: AppColor.appMainColor,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
