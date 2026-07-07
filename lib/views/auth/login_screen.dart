import 'package:flutter/material.dart';
import 'package:machine_task/controllers/auth_controller.dart';
import 'package:machine_task/core/widgets/app_button.dart';
import 'package:machine_task/core/widgets/app_text_field.dart';
import 'package:machine_task/views/auth/signin_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontFamily: " DM Serif Display",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 30,
                    // height: 37,
                    letterSpacing: 0,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "All users are verified to help prevent fake accounts.",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 13,
                    letterSpacing: 0,
                    // height: 1.5,
                  ),
                ),
                SizedBox(height: 54),
                AppTextField(controller: emailController, labelText: 'Email'),
                SizedBox(height: 27),
                AppTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  isObscure: true,
                ),
                SizedBox(height: 27),

                AppTextField(
                  controller: confirmPasswordController,
                  labelText: ' Confirm Password',
                  isObscure: true,
                ),
                SizedBox(height: 40),
                AppButton(
                  onPressed: () {
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Passwords do not match')),
                      );
                      return;
                    }
                    authController.signUp(
                      emailController.text,
                      passwordController.text,
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SignInScreen()),
                    // );
                  },
                  buttonText: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
