import 'package:flutter/material.dart';

import '../../app_theme.dart';


class CustomDescriptionText extends StatelessWidget {
  final String text;
  final double? size;
  const CustomDescriptionText({Key? key, required this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: CustomAppTheme.descriptionTextColor,
        fontSize: size,
        decoration: TextDecoration.none
      ),
    );
  }
}
