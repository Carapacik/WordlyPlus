import 'package:flutter/material.dart';
import 'package:wordly/resources/resources.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: AppColors.greyTrack),
      onPressed: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 80,
        child: Text(
          text,
          style: AppTypography.n14.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
