import 'package:flutter/material.dart';
import 'package:pikem_nto/admin/pages/admin_login_page.dart';
import 'package:pikem_nto/design/widgets/buttons/filled_button.dart';
import 'package:pikem_nto/design/widgets/texts/custom_title_text.dart';

class AuthorizationPage extends StatelessWidget {
  const AuthorizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTitleText(
                text: "Кто вы?", 
                size: 30,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomFilledButton(
                height: 40,
                width: 400,
                text: 'Администратор',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminLoginPage()));
                }
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFilledButton(
                height: 40,
                width: 400,
                text: 'Жилец',
                onTap: (){}
              ),

            ],
          ),
        ),
      ),
    );
  }
}