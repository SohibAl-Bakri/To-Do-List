import 'package:flutter/material.dart';
import 'package:sefl_study_lab/Themes/theme.dart';
import 'package:sefl_study_lab/models/user_model.dart';
import 'package:sefl_study_lab/screens/auth/login.dart';
import 'package:sefl_study_lab/widgets/elevated_button.dart';
import 'package:sefl_study_lab/widgets/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String id = "signup";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    String emailText = "";
    String passwordText = "";
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      appBar: AppBar(
        title: const Text('Sign Up Page'),
        centerTitle: true,
        backgroundColor: AppColors.skyBlue,
      ),
      body: Column(
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
              User.signup(
                  email: emailText, password: passwordText, context: context);
            },
            buttonText: "Sign Up",
          ),
          TextButton(
            onPressed: () {
              Navigator.restorablePushNamedAndRemoveUntil(
                  context, LoginScreen.id, (route) => false);
            },
            child: Text(
              "Do You Have An Account? \n Login",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.cramel),
            ),
          ),
        ],
      ),
    );
  }
}
