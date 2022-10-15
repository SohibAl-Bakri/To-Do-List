// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sefl_study_lab/Themes/theme.dart';
import 'package:sefl_study_lab/configration/config.dart';
import 'package:sefl_study_lab/models/note_model.dart';

class NoteCard extends StatelessWidget {
  String noteTitle;
  String noteSubTitle;
  String id;
  String time;
  TextEditingController editTitleNote =
      TextEditingController(text: Config.note.noteTitle);
  TextEditingController editSubTitleNote =
      TextEditingController(text: Config.note.noteSubTitle);

  NoteCard(
      {Key? key,
      required this.noteTitle,
      required this.noteSubTitle,
      required this.id,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: AppColors.greenBlue,
        child: ListTile(
          title: Text(noteTitle),
          subtitle: Text(noteSubTitle),
          trailing: IconButton(
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: () {
              NoteModel.deleteNote(
                context: context,
                id: id,
              );
            },
          ),
          leading: IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              Config.note.id = id;
              Config.note.noteTitle = noteTitle;
              Config.note.noteSubTitle = noteSubTitle;
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.blueGrey,
                      content: SizedBox(
                        width: double.infinity,
                        height: 250,
                        //color: Colors.amber,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  label: Text('To-Do Title'),
                                  hintText: 'Inter Your Note',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  Config.note.noteTitle = value;
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  label: Text('To-Do SubTitle'),
                                  hintText: 'Inter Your Note',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  Config.note.noteSubTitle = value;
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  AppColors.skyBlue,
                                ),
                              ),
                              onPressed: () {
                                NoteModel.editNote(
                                  title: Config.note.noteTitle,
                                  subTitle: Config.note.noteSubTitle,
                                  context: context,
                                );
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }); // NoteModel.editNote(
            },
          ),
        ),
      ),
    );
  }
}
