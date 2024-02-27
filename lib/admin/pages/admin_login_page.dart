import 'package:flutter/material.dart';
import 'package:pikem_nto/admin/pages/admin_home_page.dart';
import 'package:pikem_nto/design/widgets/buttons/filled_button.dart';
import 'package:pikem_nto/design/widgets/custom_app_bar.dart';
import 'package:pikem_nto/design/widgets/custom_text_field.dart';
import 'package:pikem_nto/design/widgets/texts/custom_title_text.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  TextEditingController textEditingController = TextEditingController();
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTitleText(
                  text: "Введите пароль", 
                  size: 30,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  obscureText: true,
                  width: 400,
                  maxLines: 1,
                  controller: textEditingController,
                  hintText: "Пароль:",
                  errorText: error,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFilledButton(
                  width: 400,
                  height: 40,
                  text: 'Войти', 
                  onTap: (){
                    bool passed =  textEditingController.text == "pass";
                    if (passed){
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => const AdminHomePage())));
                    }
                    else{
                      setState(() {
                        error = 'Неверный пароль';
                      });
                    }
                  }
                )
              ],
            ),
          )
      ),
    );
  }
}