import 'package:flutter/material.dart';
import 'package:sefl_study_lab/Themes/theme.dart';
import 'package:sefl_study_lab/models/note_model.dart';
import 'package:sefl_study_lab/screens/home/home_screen.dart';
import 'package:sefl_study_lab/widgets/elevated_button.dart';
import 'package:sefl_study_lab/widgets/text_field.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);
  static String id = "add";

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController subTitle = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      appBar: AppBar(
        title: const Text("Add A Note"),
        centerTitle: true,
        backgroundColor: AppColors.skyBlue,
      ),
      body: Column(
        children: [
          TextFieldCustom(
            keyboardType: TextInputType.text,
            hide: false,
            controller: title,
            label: "To-Do Title",
            hint: "Enter Your Note-Title",
          ),
          TextFieldCustom(
            keyboardType: TextInputType.text,
            hide: false,
            controller: subTitle,
            label: "To-Do Sub Title",
            hint: "Enter Your Note Sub-Title",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButtonCustom(
                  backgroundColor: AppColors.skyBlue,
                  buttonText: "Add Note",
                  onPressed: () {
                    NoteModel.addNote(title: title, subTitle: subTitle);
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeScreen.id, (route) => false);
                  }),
              ElevatedButtonCustom(
                  backgroundColor: AppColors.cabatchino,
                  buttonText: "Cancel",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
