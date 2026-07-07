import 'package:flutter/material.dart';
import 'package:machine_task/core/constants/colors.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(child: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  text: 'Create Your ',
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
                      text: 'Profile',
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
            ],
          ),
        ),
      ),
    );
  }
}
