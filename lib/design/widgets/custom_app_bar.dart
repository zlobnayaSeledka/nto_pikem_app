import 'package:flutter/material.dart';
import 'package:pikem_nto/authorization_page.dart';
import 'buttons/custom_back_button.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
    const CustomAppBar({Key? key}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);
    @override
    final Size preferredSize;
    
    @override
      State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomBackButton(
            onTap: (){
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(builder: ((context) => const AuthorizationPage())), 
                (route) => false);
            },
          ),
        ),
      ],
    );
  }
}