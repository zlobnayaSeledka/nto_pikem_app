import 'package:flutter/material.dart';
import 'package:pikem_nto/design/app_theme.dart';

class CustomDescriptionTitleText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomDescriptionTitleText({Key? key, required this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: CustomAppTheme.descriptionTextColor,
        fontSize: size,
        fontWeight: FontWeight.bold,
        fontFamily: CustomAppTheme.mainFontBold,
        decoration: TextDecoration.none,
      ),
    );
  }
}