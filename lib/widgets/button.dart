import 'package:flutter/material.dart';

class PrimaryTextButton extends StatelessWidget {
  final Widget button;
  final Color borderColor;

  const PrimaryTextButton({
    super.key,
    this.borderColor = Colors.white70,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blueGrey.withOpacity(0.4),
          border: Border.all(width: 1, color: borderColor)),
      child: button,
    );
  }
}

class PrimaryText extends StatelessWidget {
  final String title;
  final Color textColor;
  
  const PrimaryText({super.key, required this.title, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: textColor,fontSize: 14,fontWeight: FontWeight.w600)
    );
  }
}
