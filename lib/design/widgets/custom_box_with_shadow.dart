import 'package:flutter/material.dart';

import '../app_theme.dart';

class CustomBoxWithShadow extends StatelessWidget {
  final double? height;
  final double? width;
  final int? animation;
  final Color? shadowColor;
  final Widget child;
  const CustomBoxWithShadow({Key? key, this.width, this.height, this.animation, this.shadowColor, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxShadow s = shadowColor==null?CustomAppTheme.mainShadow:BoxShadow(color: shadowColor!.withOpacity(0.2), spreadRadius:2.0, blurRadius: 5.0); //
    return animation==null?Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [s],
        color: CustomAppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(CustomAppTheme.mainBorderRadius)
      ),
      child: child,
    ):
    AnimatedContainer(
      duration: Duration(milliseconds: animation!),
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [s],
        color: CustomAppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(CustomAppTheme.mainBorderRadius)
      ),
      child: child,
    );
  }
}