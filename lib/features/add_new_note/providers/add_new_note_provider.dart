import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/add_new_note/repositories/note_repository.dart';
import 'package:path_provider/path_provider.dart';

// TODO extract this class to separate file or place it in note_model.dart
enum Mood {
  none,
  crying,
  veryBad,
  bad,
  normal,
  good,
  veryGood,
}

// TODO extends ChangeNotifier
class NoteProvider with ChangeNotifier {
  File? savedImage;

  final INoteRepository _repository;

  // TODO try to refactor this method. For example you can extract logic of working with
  // TODO images and files
  Future<void> saveNote(DateTime date) async {
    final path = (await getApplicationDocumentsDirectory()).path;
    String formattedTodayDate = DateFormat('yyyy-M-d').format(date);
    List<String> pathList = [];

    if (images.isNotEmpty) {
      for (int i = 0; i < images.length; i++) {
        var image = images[i];
        // TODO you don't need copiedImage. Just call image.copy method
        final copiedImage = await image.copy('$path/${formattedTodayDate}_$i.jpg');
        pathList.add('${formattedTodayDate}_$i.jpg');
      }
    }

    String jsonPathList = jsonEncode(pathList);

    _repository.saveNote(NoteModel(
      date: date,
      mood: mood,
      text: text,
      images: jsonPathList,
    ));
  }

  // TODO all variables should be in the top of the class
  String text = '';

  void saveText(String text) {
    this.text = text;
    notifyListeners();
  }

  // TODO all variables should be in the top of the class
  List<File> images = [];
  Mood mood = Mood.none;

  void deleteImage(File image) {
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

  // TODO all constructors should be in the top of the class
  NoteProvider({
    required INoteRepository repository,
  }) : _repository = repository;
}
