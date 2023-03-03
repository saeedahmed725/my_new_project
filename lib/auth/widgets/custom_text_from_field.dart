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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        enableSuggestions: true,
        keyboardType: keyboardType,
        obscureText: obscureText,
        autocorrect: true,
        cursorColor: Colors.purple,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(14)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14)
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
            ),
            labelStyle: const TextStyle(color: Colors.purple),
            focusColor: Colors.purple,
            prefixIconColor: Colors.purple,
            suffixIconColor: Colors.purple,
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            hintText: hintText,
            labelText: labelText,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.grey.shade200,
            errorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
            errorStyle: const TextStyle(fontSize: 13)),
      ),
    );
  }
}
