import 'package:flutter/material.dart';

class ButtonExit extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color textColor;
  const ButtonExit({
    Key? key,
    required this.text,
    required this.press,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: size.width * 0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                backgroundColor: Colors.orange.shade900
            )
        ),
      ),
    );
  }
}