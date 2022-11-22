import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myshop_app/utils/theme.dart';
import 'package:myshop_app/view/widgets/text_utils.dart';

import '../../../logic/controller/bindings/auth_controller.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckBox
                  ? Get.isDarkMode
                      ? Image.asset('assets/images/check.png')
                      : Icon(
                          Icons.done,
                          color: pinkClr,
                        )
                  : Container(),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  text: "I accept  ",
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  underLine: TextDecoration.none),
              TextUtils(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  text: "terms & conditions",
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  underLine: TextDecoration.underline),
            ],
          ),
        ],
      );
    });
  }
}
