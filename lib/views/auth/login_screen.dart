import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_task/blocs/bloc/auth_bloc.dart';
import 'package:machine_task/core/widgets/app_button.dart';
import 'package:machine_task/core/widgets/app_text_field.dart';
import 'package:machine_task/views/auth/signin_screen.dart';
import 'package:machine_task/views/profile/user_profile_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is AuthSuccess) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Account created successfully!')),
            );

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserProfileScreen()),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
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
                  state is AuthLoading
                      ? Center(child: CircularProgressIndicator())
                      : AppButton(
                          onPressed: () {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Passwords do not match'),
                                ),
                              );
                              return;
                            }
                            context.read<AuthBloc>().add(
                              SignUpEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          },
                          buttonText: 'Login',
                        ),

                  Spacer(),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                            fontSize: 13,
                            letterSpacing: 0,
                            // height: 1.5,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Sign In',
                              style: TextStyle(
                                fontFamily:
                                    "DM Serif Display", //use google fonte later
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: Color(0xFF767676),
                                fontSize: 13,
                                letterSpacing: 0,
                                // height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
