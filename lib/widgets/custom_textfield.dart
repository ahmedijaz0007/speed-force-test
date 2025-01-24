
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_constants.dart';

class CustomTextField extends StatelessWidget{
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool? isPasswordVisible;
  final Widget? suffixWidget;
  final Widget? prefixIcon;
    final String hintText;

  const CustomTextField({super.key, this.keyboardType, required this.controller,  this.isPasswordVisible,  this.suffixWidget, this.prefixIcon, required this.hintText});


  @override
  Widget build(BuildContext context) {
   return TextField(
     style: const TextStyle(color: Color(0xff9E9E9E),fontWeight: FontWeight.w400),
     textAlignVertical: TextAlignVertical.center,
     keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      obscureText: isPasswordVisible ?? false,//This will obscure text dynamically
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textFieldBackgroundColor,
        border: InputBorder.none,
        hintText: hintText,
        prefixIcon:  prefixIcon,
        suffixIcon: suffixWidget
      ),
    );
  }

}