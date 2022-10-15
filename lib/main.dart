import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sefl_study_lab/screens/add_note/add_note.dart';
import 'package:sefl_study_lab/screens/auth/login.dart';
import 'package:sefl_study_lab/screens/auth/sign_up.dart';
import 'package:sefl_study_lab/screens/home/home_screen.dart';
import 'package:sefl_study_lab/screens/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.id: (context) => const Splash(),
        LoginScreen.id: (context) => const LoginScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        AddNote.id: (context) => const AddNote(),
      },
      initialRoute: Splash.id,
    );
  }
}
