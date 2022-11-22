import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../logic/controller/bindings/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/Auth_button.dart';
import '../../widgets/auth/auth_text_from_field.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final fromKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

// final controller =Get.put(authController());
// final controllers =Get.lazyPut(() => authController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                color: Get.isDarkMode ? mainColor : pinkClr,
                                text: "SIGN",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                underLine: TextDecoration.none),
                            SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                text: "UP",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                underLine: TextDecoration.none)
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        AuthTextFromField(
                          controller: nameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset("assets/images/user.png")
                              : Icon(
                                  Icons.person,
                                  color: pinkClr,
                                  size: 30,
                                ),
                          suffixIcon: Text(""),
                          hintText: "User Name",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AuthTextFromField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset("assets/images/email.png")
                              : Icon(
                                  Icons.email,
                                  color: pinkClr,
                                  size: 30,
                                ),
                          suffixIcon: Text(""),
                          hintText: "Email",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFromField(
                            controller: passwordController,
                            obscureText: controller.isVisibilty ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return 'Password should be longer or equal to 6 characters';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Image.asset("assets/images/lock.png")
                                : Icon(
                                    Icons.lock,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibilty
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                            ),
                            hintText: "Password",
                          );
                        }),
                        SizedBox(
                          height: 50,
                        ),
                        CheckWidget(),
                        SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            onPressed: () {
                              if (controller.isCheckBox == false) {
                                Get.snackbar(
                                  "Check Box",
                                  "Please, Accept terms & conditions",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                );
                              } else if (fromKey.currentState!.validate()) {
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.signUpUsingFirebase(
                                    name: name,
                                    email: email,
                                    password: password);
                                controller.isCheckBox = true;
                              }
                              ;
                            },
                            text: "Sign Up",
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: "Already have an Account? ",
                onPressed: () {
                  Get.offAllNamed(Routes.loginScreen);
                },
                textType: "Lognin",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
