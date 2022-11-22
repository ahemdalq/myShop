import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop_app/logic/controller/bindings/auth_controller.dart';
import 'package:myshop_app/utils/theme.dart';
import 'package:myshop_app/view/widgets/auth/auth_button.dart';

import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_text_from_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Forgot Password",
            style: TextStyle(
              color: Get.isDarkMode ? mainColor : pinkClr,
            ),
          ),
          leading: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.black : Colors.white,
          ),
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      )),
                ),
                Text(
                  "If you want to recover your accunt, then please provide your email ID belw.. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/images/forgetpass copy.png",
                  width: 270,
                ),
                const SizedBox(
                  height: 50,
                ),
                AuthTextFromField(
                  controller: emailController,
                  obscureText: false,
                  validator: (value) {
                    if (!RegExp(validationEmail).hasMatch(value)) {
                      return "Invalid Email";
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: Get.isDarkMode
                      ? Image.asset("assets/images/email.png")
                      : Icon(
                          Icons.email,
                          color: pinkClr,
                        ),
                  suffixIcon: const Text(""),
                  hintText: "Email",
                ),
                const SizedBox(
                  height: 50,
                ),
                GetBuilder<AuthController>(builder: (_) {
                  return AuthButton(
                    text: "Send",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String email = emailController.text.trim();
                        controller.resetPassword(email);
                      }
                    },
                  );
                }),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
