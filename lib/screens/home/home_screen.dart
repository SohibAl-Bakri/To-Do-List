import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sefl_study_lab/Themes/theme.dart';
import 'package:sefl_study_lab/screens/add_note/add_note.dart';
import 'package:sefl_study_lab/screens/auth/login.dart';
import 'package:sefl_study_lab/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = "home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      appBar: AppBar(
        backgroundColor: AppColors.skyBlue,
        title: const Text(
          'TO Do List',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginScreen.id, (route) => false);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.cabatchino,
        onPressed: () {
          Navigator.pushNamed(context, AddNote.id);
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection("notes")
                  .orderBy("time", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                List<NoteCard> notes = [];
                if (snapshot.hasData) {
                  for (var data in snapshot.data!.docs) {
                    notes.add(
                      NoteCard(
                        noteTitle: data["noteTitle"],
                        noteSubTitle: data['noteSubTitle'],
                        id: data.id,
                        time: data["time"].toString(),
                      ),
                    );
                  }
                  return Column(
                    children: notes,
                  );
                } else {
                  return const Center(child: Text("No Note Yet"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
