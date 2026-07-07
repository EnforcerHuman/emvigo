import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_task/blocs/bloc/profile_bloc/profile_bloc.dart';
import 'package:machine_task/core/constants/text_styles.dart';
import 'package:machine_task/core/widgets/app_button.dart';
import 'package:machine_task/core/widgets/app_drop_down.dart';
import 'package:machine_task/core/widgets/app_text.dart';
import 'package:machine_task/core/widgets/app_text_field.dart';
import 'package:machine_task/models/user_profile_model.dart';

enum Gender { male, female }

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController dobController;
  Gender _gender = Gender.male;
  String _country = 'INDIAN';
  String _language = 'ENGLISH';

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    dobController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        dobController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }
    context.read<ProfileBloc>().add(
      StoreProfileDataEvent(
        userProfile: UserProfileModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          dob: dobController.text,
          gender: _gender.name,
          country: _country,
          language: _language,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is ProfileFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Create Your ',
                      style: AppTextStyles.headingRegularBlack,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Profile',
                          style: AppTextStyles.headingBold,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  AppText(
                    "Create your profile with some basic information",
                    style: AppTextStyles.subtitle,
                  ),
                  SizedBox(height: 27),
                  AppText(
                    "Whats your name ",
                    style: AppTextStyles.bodyText,
                    maxLines: 1,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: firstNameController,
                          labelText: 'First Name',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: AppTextField(
                          controller: lastNameController,
                          labelText: 'Last Name',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  AppText(
                    "First name is only visible on your profile.",
                    style: AppTextStyles.bodyGray,
                  ),
                  SizedBox(height: 27),
                  AppText(
                    "What's your date of birth",
                    style: AppTextStyles.bodyText,
                    maxLines: 1,
                  ),
                  SizedBox(height: 10),
                  AppTextField(
                    controller: dobController,
                    labelText: 'dd-mm-yyyy',
                  ),
                  SizedBox(height: 27),
                  AppText(
                    "What's your gender",
                    style: AppTextStyles.bodyText,
                    maxLines: 1,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<Gender>(
                          groupValue: _gender,
                          selected: _gender == Gender.male,
                          value: Gender.male,
                          title: const Text('Male'),
                          onChanged: (value) {
                            setState(() {
                              _gender = Gender.male;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<Gender>(
                          groupValue: _gender,
                          selected: _gender == Gender.female,
                          value: Gender.female,
                          title: const Text('Female'),
                          onChanged: (value) {
                            setState(() {
                              _gender = Gender.female;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 27),
                  AppText(
                    "What's your nationality",
                    style: AppTextStyles.bodyText,
                    maxLines: 1,
                  ),
                  SizedBox(height: 10),
                  AppDropDown(
                    value: _country,
                    options: [
                      'INDIAN',
                      'EGYPTIAN',
                      'CANADIAN',
                      'AMERICAN',
                      'AUSTRALIAN',
                      'CHINESE',
                      'JAPANESE',
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _country = value;
                        });
                      }
                    },
                  ),
                  SizedBox(height: 27),
                  AppText(
                    "Languages spoken",
                    style: AppTextStyles.bodyText,
                    maxLines: 1,
                  ),
                  SizedBox(height: 10),
                  AppDropDown(
                    value: _language,
                    options: ["ENGLISH", "HINDI"],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _language = value;
                        });
                      }
                    },
                  ),
                  SizedBox(height: 27),
                  state is ProfileLoading
                      ? Center(child: CircularProgressIndicator())
                      : AppButton(
                          onPressed: _saveProfile,
                          buttonText: 'Continue',
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
