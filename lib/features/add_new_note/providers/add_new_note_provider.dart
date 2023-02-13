import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/add_new_note/repositories/note_repository.dart';

enum Mood {
  none,
  crying,
  veryBad,
  bad,
  normal,
  good,
  veryGood,
}

class NoteProvider with ChangeNotifier {
  final INoteRepository _repository;

  void saveNote(DateTime date) {
    _repository.saveNote(NoteModel(date: date, mood: mood, text: text));
  }

  String text = '';

  void saveText(String text) {
    this.text = text;
    notifyListeners();
  }

  List<File> images = [];
  Mood mood = Mood.none;

  void deleteImage(image) {
    images.remove(image);
    notifyListeners();
  }

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemp = File(image.path);

    images.add(imageTemp);
    notifyListeners();
  }

  void changeMood(Mood mood) {
    this.mood = mood;
    notifyListeners();
  }

  NoteProvider({
    required INoteRepository repository,
  }) : _repository = repository;
}
