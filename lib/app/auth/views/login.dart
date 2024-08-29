import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/app/auth/views/registation.dart';
import 'package:pranermart/utils/colors.dart';
import 'package:pranermart/widgets/custom_button.dart';
import '../../../widgets/custom_textField.dart';
import '../../../widgets/text_rich_one.dart';
import '../controller/auth_controller.dart';
import '../utils/inputValidator.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final controller = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.cornsilk,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Title...
                        Text(
                          "LOGIN NOW",
                          style: TextStyle(
                              color: AppColor.yaleBlue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),

                        ///email textfield...
                        CustomformField(
                          prefixicon: Icons.email,
                          hinttext: "Email",
                          onchanged: (value) {
                            controller.email.value = value;
                          },
                          validation: InputValidator.validateEmail,
                        ),
                        SizedBox(height: 10),

                        ///password textfield...
                        CustomformField(
                          prefixicon: Icons.remove_red_eye_sharp,
                          hinttext: "Password",
                          obscuretext: true,
                          validation: InputValidator.validatePassword,
                          onchanged: (value) {
                            controller.password.value = value;
                          },
                        ),
                        const SizedBox(height: 20),

                        ///Login Button...
                        CustomButton(
                          text: "LOG IN",
                          ontap: () {
                            if (formKey.currentState!.validate()) {
                              controller.LogIn();
                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  ///Already Account...
                  SizedBox(height: 20.0),
                  TextRichOne(
                    text1: "Don't have an account? ",
                    text2: " Sign Up",
                    textSize1: 16.0,
                    textSize2: 16.0,
                    ontap: () => Get.offAll(
                      () => Register(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
