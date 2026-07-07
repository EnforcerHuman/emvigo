import 'package:flutter/material.dart';
import 'package:machine_task/core/constants/colors.dart';
import 'package:machine_task/core/widgets/app_button.dart';
import 'package:machine_task/core/widgets/app_text_field.dart';
import 'package:machine_task/views/profile/user_profile_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Welcome',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "DM Serif Display",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 30,
                    letterSpacing: 0,
                    // height: 1.5,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nto',
                      style: TextStyle(
                        fontFamily: "DM Serif Display", //use google fonte later
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 30,
                        letterSpacing: 0,
                        // height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: ' Test App',
                      style: TextStyle(
                        fontFamily: "DM Serif Display", //use google fonte later
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: AppColors.primaryColor,
                        fontSize: 30,
                        letterSpacing: 0,
                        // height: 1.5,
                      ),
                    ),
                  ],
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

              AppButton(
                buttonText: 'LOGIN',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfileScreen(),
                    ),
                  );
                  // Handle login button press
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
