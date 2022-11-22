import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop_app/utils/theme.dart';
import 'package:myshop_app/view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;

  const ContainerUnder({
    required this.onPressed,
    required this.textType,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? mainColor : pinkClr,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              text: text,
              color: Colors.white,
              underLine: TextDecoration.none),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                text: textType,
                color: Colors.white,
                underLine: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
