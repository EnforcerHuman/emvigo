import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_task/blocs/bloc/auth_bloc.dart';
import 'package:machine_task/core/constants/colors.dart';
import 'package:machine_task/core/widgets/app_button.dart';
import 'package:machine_task/core/widgets/app_text_field.dart';
import 'package:machine_task/views/auth/login_screen.dart';
import 'package:machine_task/views/profile/user_profile_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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

            // Navigate to the next screen or show success message
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Logged in successfully!')));

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
                            fontFamily:
                                "DM Serif Display", //use google fonte later
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
                            fontFamily:
                                "DM Serif Display", //use google fonte later
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

                  state is AuthLoading
                      ? Center(child: CircularProgressIndicator())
                      : AppButton(
                          buttonText: 'LOGIN',
                          onPressed: () {
                            context.read<AuthBloc>().add(
                              SignInEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                            // Handle login button press
                          },
                        ),

                  Spacer(),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
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
                              text: ' Sign Up',
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
