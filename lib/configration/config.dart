import 'package:sefl_study_lab/models/note_model.dart';
import 'package:sefl_study_lab/models/user_model.dart';

class Config {
  static User user = User(id: "", email: "");
  static NoteModel note =
      NoteModel(time: "", noteTitle: "", noteSubTitle: "", id: "");
}