import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/add_new_note/repositories/note_repository.dart';
import 'package:path_provider/path_provider.dart';

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
  File? savedImage;

  final INoteRepository _repository;

  Future<void> saveNote(DateTime date) async {
    final path = (await getApplicationDocumentsDirectory()).path;
    String formattedTodayDate =
        DateFormat('yyyy-M-d').format(DateTime(2023, 03, 07));
    List<String> pathList = [];

    if (images.isNotEmpty) {
      for (int i = 0; i < images.length; i++) {
        var image = images[i];
        final copiedImage =
            await image.copy('$path/${formattedTodayDate}_$i.jpg');
        pathList.add('${formattedTodayDate}_$i.jpg');
      }
    }

    String jsonPathList = jsonEncode(pathList);

    _repository.saveNote(NoteModel(
      date: DateTime(2023, 03, 07),
      mood: mood,
      text: text,
      images: jsonPathList,
    ));
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
