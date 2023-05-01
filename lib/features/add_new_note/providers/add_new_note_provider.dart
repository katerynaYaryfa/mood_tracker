import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/add_new_note/repositories/note_repository.dart';
import 'package:path_provider/path_provider.dart';

class NoteProvider extends ChangeNotifier {
  NoteProvider({
    required INoteRepository repository,
  }) : _repository = repository;

  final INoteRepository _repository;

  File? savedImage;
  String text = '';
  List<File> images = [];
  Mood mood = Mood.none;

  Future<void> saveNote(DateTime date) async {
    NoteModel note = await _createNote(date);

    _repository.saveNote(note);
  }

  void saveText(String text) {
    this.text = text;
    notifyListeners();
  }

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

  Future<NoteModel> _createNote(DateTime date) async {
    final path = (await getApplicationDocumentsDirectory()).path;
    String formattedTodayDate = DateFormat('yyyy-M-d').format(date);
    List<String> pathList = [];

    if (images.isNotEmpty) {
      for (int i = 0; i < images.length; i++) {
        var image = images[i];
        await image.copy('$path/${formattedTodayDate}_$i.jpg');
        pathList.add('${formattedTodayDate}_$i.jpg');
      }
    }

    String jsonPathList = jsonEncode(pathList);

    return NoteModel(
      date: date,
      mood: mood,
      text: text,
      images: jsonPathList,
    );
  }
}
