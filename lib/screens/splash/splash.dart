// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sefl_study_lab/Themes/theme.dart';
import 'package:sefl_study_lab/screens/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static String id = "splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  checkUser() async {
    var sp = await SharedPreferences.getInstance();
    var userid = sp.getString("id") ?? "";
    if (userid != "") {
      Navigator.pushNamed(context, HomeScreen.id);
    } else {
      Navigator.pushNamed(context, LoginScreen.id);
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      if (mounted) checkUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.cabatchino,
                AppColors.cramel,
                AppColors.greenBlue,
                AppColors.skyBlue,
                AppColors.cramel,
                AppColors.cabatchino,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Container(
                    width: double.infinity,
                    height: 350,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('Assets/Images/To_Do_List.webp')
                          // image: NetworkImage(
                          //   'https://blog.hubspot.com/hubfs/To_Do_List.png',
                          // ),
                          ),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'To Do List',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
