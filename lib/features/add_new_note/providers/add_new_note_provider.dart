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
    required this.text,
    required this.images,
    required this.mood,
    required this.date,
  }) : _repository = repository;

  String text;
  List<File> images;
  Mood mood;
  DateTime date;

  final INoteRepository _repository;

  Future<void> writeNote({bool shouldUpdate = false}) async {
    final note = await _createNote();
    shouldUpdate ? _repository.updateNote(note) : _repository.saveNote(note);
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

  Future<NoteModel> _createNote() async {
    final path = (await getApplicationDocumentsDirectory()).path;
    final formattedTodayDate = DateFormat('yyyy-M-d').format(date);
    final pathList = <String>[];

    if (images.isNotEmpty) {
      for (var i = 0; i < images.length; i++) {
        final image = images[i];
        await image.copy('$path/${formattedTodayDate}_$i.jpg');
        pathList.add('${formattedTodayDate}_$i.jpg');
      }
    }

    final jsonPathList = jsonEncode(pathList);

    return NoteModel(
      date: date,
      mood: mood,
      text: text,
      images: jsonPathList,
    );
  }
}
