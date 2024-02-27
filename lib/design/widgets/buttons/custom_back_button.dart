import 'package:flutter/material.dart';

import '../../app_theme.dart';

class CustomBackButton extends StatelessWidget {
  final Function? onTap;
  const CustomBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
        if(onTap != null){
          onTap!();
        }
      },
      child: Icon(
        Icons.arrow_back,
        color: CustomAppTheme.mainTextColor,
        size: 30,
      ),
    );
  }
}