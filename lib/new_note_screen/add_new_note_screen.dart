import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/new_note_screen/how_was_your_day_widget.dart';
import 'package:mood_tracker/new_note_screen/photo_of_the_day_widget.dart';
import 'package:mood_tracker/new_note_screen/select_categories_screen.dart';
import 'package:mood_tracker/provider/note_notifier.dart';
import 'package:provider/provider.dart';

import '../newFile.dart';
import 'day_in_one_sentence_widget.dart';

class AddNewNoteScreen extends StatelessWidget {
  const AddNewNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const imagePadding = 64;
    final imageSize = screenWidth - imagePadding;
    final images = context.watch<NoteNotifier>().images;
    final pickImage = context.watch<NoteNotifier>().pickImage;
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFB),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: const Color(0xFFFF7562),
        onPressed: () {},
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF7562).withOpacity(0.3),
                spreadRadius: 7,
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: const Icon(
            Icons.done,
            size: 24,
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SelectCategoriesScreen();
                  },
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(
                right: 26,
              ),
              child: SvgPicture.asset(
                'images/settings.svg',
                color: const Color(0xFFD1D4DE),
              ),
            ),
          )
        ],
        title: const Text(
          'Monday, July 11',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(
          0xFFF6FAFB,
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              const HowWasYourDayWidget(),
              const SpaceH16(),
              const DayInOneSentenceWidget(),
              const SpaceH16(),
              PhotoOfTheDayWidget(
                  images: images, pickImage: pickImage, imageSize: imageSize)
            ],
          ),
        ),
      ),
    );
  }
}
