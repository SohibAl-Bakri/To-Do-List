import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sefl_study_lab/configration/config.dart';
import 'package:sefl_study_lab/screens/home/home_screen.dart';

class NoteModel {
  String time;
  String noteTitle;
  String noteSubTitle;
  String id;

  NoteModel({
    required this.time,
    required this.noteTitle,
    required this.noteSubTitle,
    required this.id,
  });

  static addNote({required title, required subTitle}) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("notes")
        .add({
      "time": DateTime.now().millisecondsSinceEpoch,
      "noteTitle": title.text,
      "noteSubTitle": subTitle.text
    });
  }

  static editNote({required title, required subTitle, required context}) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("notes")
        .doc(Config.note.id)
        .update({
      "time": DateTime.now().millisecondsSinceEpoch,
      "noteTitle": title,
      "noteSubTitle": subTitle
    });
    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id, (route) => false);
  }

  static deleteNote({required context, required id}) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("notes")
        .doc(id)
        .delete();
    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id, (route) => false);
  }
}
