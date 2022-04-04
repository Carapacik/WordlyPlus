import 'package:flutter/material.dart';
import 'package:wordly/resources/resources.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: AppColors.grey),
      onPressed: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 80,
        child: Text(
          text,
          style: AppTypography.r14.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
