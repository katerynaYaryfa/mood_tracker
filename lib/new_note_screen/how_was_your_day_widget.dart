import 'package:flutter/material.dart';

import '../newFile.dart';

class HowWasYourDayWidget extends StatefulWidget {
  const HowWasYourDayWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HowWasYourDayWidget> createState() => _HowWasYourDayWidgetState();
}

class _HowWasYourDayWidgetState extends State<HowWasYourDayWidget> {
  bool value1 = true;
  bool value4 = true;
  bool value2 = true;
  bool value3 = true;
  bool value5 = true;
  bool value6 = true;

  @override
  Widget build(BuildContext context) {
    print('$value4');

    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
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
        children: [
          const Text(
            'How was your day?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SpaceH16(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      value1 = true;
                      value2 = false;
                      value3 = false;
                      value4 = false;
                      value5 = false;
                      value6 = false;
                    });
                    print('$value4');
                  },
                  child: Opacity(
                    opacity: value1 == false ? 0.5 : 1.0,
                    child: Image(
                      width: 32,
                      height: 34,
                      image: AssetImage(
                        'images/face6.png',
                      ),
                    ),
                  ),
                ),
                SpaceH16(),
                InkWell(
                  onTap: () {
                    setState(() {
                      value1 = false;
                      value2 = true;
                      value3 = false;
                      value4 = false;
                      value5 = false;
                      value6 = false;
                    });
                  },
                  child: Opacity(
                    opacity: value2 == false ? 0.5 : 1.0,
                    child: Image(
                      width: 32,
                      height: 34,
                      image: AssetImage('images/face5.png'),
                    ),
                  ),
                ),
                SpaceH16(),
                InkWell(
                  onTap: () {
                    setState(() {
                      value1 = false;
                      value2 = false;
                      value3 = true;
                      value4 = false;
                      value5 = false;
                      value6 = false;
                    });
                  },
                  child: Opacity(
                    opacity: value3 == false ? 0.5 : 1.0,
                    child: Image(
                      width: 32,
                      height: 34,
                      image: AssetImage('images/face4.png'),
                    ),
                  ),
                ),
                SpaceH16(),
                InkWell(
                  onTap: () {
                    setState(() {
                      value1 = false;
                      value2 = false;
                      value3 = false;
                      value4 = true;
                      value5 = false;
                      value6 = false;
                    });
                  },
                  child: Opacity(
                    opacity: value4 == false ? 0.5 : 1.0,
                    child: Image(
                      width: 32,
                      height: 34,
                      image: AssetImage('images/face1.png'),
                    ),
                  ),
                ),
                SpaceH16(),
                InkWell(
                  onTap: () {
                    setState(() {
                      value1 = false;
                      value2 = false;
                      value3 = false;
                      value4 = false;
                      value5 = true;
                      value6 = false;
                    });
                  },
                  child: Opacity(
                    opacity: value5 == false ? 0.5 : 1.0,
                    child: Image(
                      width: 32,
                      height: 34,
                      image: AssetImage('images/face3.png'),
                    ),
                  ),
                ),
                SpaceH16(),
                InkWell(
                  onTap: () {
                    setState(() {
                      value1 = false;
                      value2 = false;
                      value3 = false;
                      value4 = false;
                      value5 = false;
                      value6 = true;
                    });
                  },
                  child: Opacity(
                    opacity: value6 == false ? 0.5 : 1.0,
                    child: Image(
                      width: 32,
                      height: 34,
                      image: AssetImage('images/face2.png'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
