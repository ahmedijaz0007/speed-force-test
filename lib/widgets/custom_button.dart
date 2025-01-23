import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle style;
  final Color textColor;

  const CustomButton._({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.style, required this.textColor,
  }) : super(key: key);

  /// Named constructor for a solid button
  factory CustomButton.solid({
    required String text,
    required VoidCallback onPressed,
  }) {
    return CustomButton._(
      text: text,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor, // Red background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 16.0,
        ),
      ), textColor: AppColors.accentColor,
    );
  }

  /// Named constructor for an outlined button
  factory CustomButton.outlined({
    required String text,
    required VoidCallback onPressed,
  }) {
    return CustomButton._(
      text: text,
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: AppColors.primaryColor, // Red border
          width: 2.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 16.0,
        ),
        backgroundColor: AppColors.accentColor, // Red text color
      ), textColor: AppColors.primaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Choose ElevatedButton or OutlinedButton based on the style
    final isSolid = style.backgroundColor?.resolve({}) != null;
    return SizedBox(
      width: double.infinity,
        child:isSolid
        ? ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    )
        : OutlinedButton(
      onPressed: onPressed,
      style: style,
      child: Text(
        text,
        style:  TextStyle(
          color: textColor,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }
}
