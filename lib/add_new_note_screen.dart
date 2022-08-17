import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/provider/settings_notifier.dart';
import 'package:mood_tracker/select_categories_screen.dart';
import 'package:provider/provider.dart';

import 'day_in_one_sentence_widget.dart';
import 'how_was_your_day_widget.dart';

class AddNewNoteScreen extends StatefulWidget {
  const AddNewNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNewNoteScreen> createState() => _AddNewNoteScreenState();
}

class _AddNewNoteScreenState extends State<AddNewNoteScreen> {
  // File? image;
  //
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //
  //     final imageTemp = File(image.path);
  //
  //     setState(() => this.image = imageTemp);
  //   } on PlatformException catch (e) {
  //     print('Failed to pick Image $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final image = context.watch<SettingsNotifier>().image;
    final pickImage = context.watch<SettingsNotifier>().pickImage;

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
          child: Icon(
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
                    return SelectCategoriesScreen();
                  },
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(right: 26),
              child: SvgPicture.asset(
                'images/settings.svg',
                color: Color(0xFFD1D4DE),
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
              HowWasYourDayWidget(),
              const SizedBox(
                height: 16,
              ),
              DayInOneSentenceWidget(),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                height: 364,
                margin: EdgeInsets.symmetric(horizontal: 16.0),

                // width: 328,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFE),
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF738C93).withOpacity(0.03),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Photo of the day',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (imagelist.lenght == 1)

                    Инк(иконка )
              онТпа
                    SizedBox(
                      height: 16,
                    ),

                    if (imagelist.lenght == 1)
                        NewWidget(height: 22,),
                    if (imagelist.lenght == 2)
                    Row(
                        NewWidget(height 66, mage: imagelist[2],
                        NewWidget(height: 44, image: imagelist[1],),
                    )


                    image != null
                        ? Image.file(image)
                        : InkWell(
                            onTap: () {
                              pickImage();
                            },
                            child: Container(
                              // margin: EdgeInsets.symmetric(horizontal: 16),
                              // padding: EdgeInsets.symmetric(horizontal: 16),
                              height: 296,
                              width: 296,

                              decoration: BoxDecoration(
                                color: const Color(0xffF6FAFB),
                                // color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'images/addPhoto.svg',
                                    color: const Color(0xFFD1D4DE),
                                  ),
                                  const SizedBox(
                                    height: 11.0,
                                  ),
                                  const Text(
                                    'Add up to 3 photo',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFD1D4DE),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    required this.height,
    required this.image,
    Key? key,
  }) : super(key: key);

  final double height;
  final File image;

  @override
  Widget build(BuildContext context) {
    // final image = context.watch<SettingsNotifier>().image;

    return Container(
      height: height,
      width: 296,
      decoration: BoxDecoration(
        color: const Color(0xffF6FAFB),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child:  Image.file(image), INk(svgPic) onTap : deleteImage(image)
      ,
    );
  }
}
