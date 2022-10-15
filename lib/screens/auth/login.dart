import 'package:flutter/material.dart';
import 'package:sefl_study_lab/Themes/theme.dart';
import 'package:sefl_study_lab/screens/screens.dart';
import 'package:sefl_study_lab/widgets/elevated_button.dart';
import 'package:sefl_study_lab/widgets/text_field.dart';
import 'package:sefl_study_lab/models/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = "login";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    String emailText = "";
    String passwordText = "";
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
        backgroundColor: AppColors.skyBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldCustom(
              keyboardType: TextInputType.emailAddress,
              hide: false,
              controller: emailController,
              label: "E-mail",
              hint: "Enter your E-mail",
              onChange: (value) {
                emailText = value;
              },
            ),
            TextFieldCustom(
              keyboardType: TextInputType.text,
              hide: true,
              controller: passwordController,
              label: "Password",
              hint: "Enter Your Password",
              onChange: (value) {
                passwordText = value;
              },
            ),
            ElevatedButtonCustom(
              backgroundColor: AppColors.skyBlue,
              onPressed: () {
                User.login(
                  context: context,
                  email: emailText,
                  password: passwordText,
                );
              },
              buttonText: "Login",
            ),
            TextButton(
              onPressed: () {
                Navigator.restorablePushNamedAndRemoveUntil(
                    context, SignUpScreen.id, (route) => false);
              },
              child: Text(
                "Don't Have An Account? \n SginUp",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.cramel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
