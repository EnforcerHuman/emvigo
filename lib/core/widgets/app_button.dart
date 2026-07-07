import 'package:flutter/material.dart';
import 'package:machine_task/core/constants/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.onPressed, required this.buttonText});
  final void Function()? onPressed;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        backgroundColor: AppColors.primaryColor,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
