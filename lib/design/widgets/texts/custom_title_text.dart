import 'package:flutter/material.dart';
import 'package:pikem_nto/design/app_theme.dart';

class CustomTitleText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomTitleText({Key? key, required this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: CustomAppTheme.mainTextColor,
        fontSize: size,
        fontWeight: FontWeight.bold,
        fontFamily: CustomAppTheme.mainFontBold,
        decoration: TextDecoration.none
      ),
    );
  }
}
