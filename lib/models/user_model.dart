// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sefl_study_lab/configration/config.dart';
import 'package:sefl_study_lab/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String id;
  String email;

  User({required this.id, required this.email});

  static login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    var user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (user != null) {
      Config.user.id = FirebaseAuth.instance.currentUser!.uid;
      Config.user.email = email;
      saveUserInfo(email: email, id: Config.user.id);
      Navigator.pushNamed(context, HomeScreen.id);
    }
  }

  static signup({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    var user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (user != null) {
      Config.user.id = FirebaseAuth.instance.currentUser!.uid;
      Config.user.email = email;
      saveUserInfo(email: email, id: password);
      Navigator.pushNamed(context, HomeScreen.id);
    }
  }

  static saveUserInfo({
    required String email,
    required String id,
  }) async {
    var sp = await SharedPreferences.getInstance();
    sp.setString("email", email);
    sp.setString("id", id);
  }
}
