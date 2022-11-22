import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop_app/utils/theme.dart';
import 'package:myshop_app/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode ? mainColor : pinkClr,
        minimumSize: Size(350, 50),
      ),
      child: TextUtils(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          text: text,
          color: Colors.white,
          underLine: TextDecoration.none),
    );
  }
}
