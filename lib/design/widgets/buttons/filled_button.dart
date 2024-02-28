import 'package:flutter/material.dart';
import 'package:pikem_nto/design/app_theme.dart';

class CustomFilledButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final Function onTap;
  final bool? circular;
  final Color? color;
  final double? textSize;
  const CustomFilledButton({Key? key, required this.text,this.textSize, this.color, this.height, this.width, required this.onTap, this.circular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 10;
    if (circular == true && height!=null){
      radius = height!;
    }
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color==null?CustomAppTheme.mainColor:color!,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [CustomAppTheme.mainShadow]
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: CustomAppTheme.mainFont,
                fontSize: textSize==null?20:textSize!
              ),
            ),
          ),
        )
      ),
    );
  }
}