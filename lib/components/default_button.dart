import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    required this.textColor,
    required this.backColor,
    this.press,
  }) : super(key: key);
  final String? text;
  final Color textColor;
  final Color backColor;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          disabledForegroundColor: backColor.withOpacity(0.38),
          disabledBackgroundColor: backColor.withOpacity(0.12),
          backgroundColor: backColor,
          shadowColor: Colors.grey.shade400,
          elevation: 1,
          minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textColor),
        ),
      ),
    );
  }
}
