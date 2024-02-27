import 'package:flutter/material.dart';
import '../../app_theme.dart';

class CustomErrorText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomErrorText({Key? key, this.size, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: CustomAppTheme.errorColor,
        decoration: TextDecoration.none,
        fontFamily: CustomAppTheme.mainFontLight
      ),
    );
  }
}