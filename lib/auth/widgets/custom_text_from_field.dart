import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.suffixIcon,
      this.labelText = "",
      this.hintText = "",
      this.prefixIcon,
      this.obscureText = false,
      this.keyboardType,
      this.validator,
      this.controller});

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 3, left: 3, bottom: 10,top: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(14)),
      child: TextFormField(
        validator: validator,
        controller: controller,
        enableSuggestions: true,
        keyboardType: keyboardType,
        obscureText: obscureText,
        autocorrect: true,
        cursorColor: Colors.purple,
        decoration: InputDecoration(
            labelStyle: const TextStyle(color: Colors.purple),
            focusColor: Colors.purple,
            prefixIconColor: Colors.purple,
            suffixIconColor: Colors.purple,
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            hintText: hintText,
            labelText: labelText,
            suffixIcon: suffixIcon,
            fillColor: Colors.purple,
            errorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
            errorStyle: const TextStyle(fontSize: 13)),
      ),
    );
  }
}
