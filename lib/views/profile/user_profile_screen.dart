import 'package:flutter/material.dart';
import 'package:machine_task/core/constants/colors.dart';
import 'package:machine_task/core/widgets/app_button.dart';
import 'package:machine_task/core/widgets/app_drop_down.dart';
import 'package:machine_task/core/widgets/app_text_field.dart';

enum Gender { male, female }

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

Gender groupValue = Gender.male;

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNamecontroller = TextEditingController();
    TextEditingController lastNamecontroller = TextEditingController();
    TextEditingController dobController = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 30),
              Text(
                "Create your profile with some basic information",
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                  letterSpacing: 0,
                  color: AppColors.textColor,
                  // height: 1.5,
                ),
              ),
              SizedBox(height: 27),
              Text(
                "Whats your name ",
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                  letterSpacing: 0,
                  color: AppColors.textColor,

                  // height: 1.5,
                ),
              ),
              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: firstNamecontroller,
                      labelText: 'First Name',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: AppTextField(
                      controller: lastNamecontroller,
                      labelText: 'Last Name',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "First name is only visible on your profile.",
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                  letterSpacing: 0,
                  color: AppColors.textGray,

                  // height: 1.5,
                ),
              ),

              ///
              ///
              ///DOB Section
              ///
              SizedBox(height: 27),
              Text(
                "What’s your date of birth",
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                  letterSpacing: 0,
                  color: AppColors.textColor,

                  // height: 1.5,
                ),
              ),
              SizedBox(height: 10),
              AppTextField(controller: dobController, labelText: 'dd-mm-yyyy'),

              ///
              ///
              ///Gender Section
              ///
              SizedBox(height: 27),
              Text(
                "What’s your gender",
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                  letterSpacing: 0,
                  color: AppColors.textColor,

                  // height: 1.5,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<Gender>(
                      groupValue: groupValue,
                      selected: groupValue == Gender.male,
                      value: Gender.male,
                      title: const Text('Male'),
                      onChanged: (value) {
                        setState(() {
                          groupValue = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<Gender>(
                      groupValue: groupValue,
                      selected: groupValue == Gender.female,
                      value: Gender.female,
                      title: const Text('Female'),
                      onChanged: (value) {
                        setState(() {
                          groupValue = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),

              ///
              ///
              ///Nationaliuty Section
              ///
              SizedBox(height: 27),
              Text(
                "What’s your nationality",
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                  letterSpacing: 0,
                  color: AppColors.textColor,

                  // height: 1.5,
                ),
              ),
              SizedBox(height: 10),
              AppDropDown(
                options: [
                  'INDIAN',
                  'EGYPTIAN',
                  'CANADIAN',
                  'AMERICAN',
                  'AUSTRALIAN',
                  'CHINESE',
                  'JAPANESE',
                ],
              ),

              ///
              ///
              ///Language Section
              SizedBox(height: 27),
              Text(
                "Languages spoken",
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 13,
                  letterSpacing: 0,
                  color: AppColors.textColor,

                  // height: 1.5,
                ),
              ),
              SizedBox(height: 10),
              AppDropDown(options: ["ENGLISH", "HINDI"]),

              ///
              ///Action Section
              ///
              SizedBox(height: 27),

              AppButton(
                onPressed: () {
                  // Handle button press
                },
                buttonText: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
