import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color TextColor;
  final BoxBorder? border;
  final void Function()? onTap;

  const CustomButton(
      {Key? key,
      this.color = Colors.white,
      this.TextColor = Colors.white,
      required this.text,
      this.border,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: border,
            color: color,
            borderRadius: BorderRadius.circular(14)),
        child: Text(text,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: TextColor)),
      ),
    );
  }
}
