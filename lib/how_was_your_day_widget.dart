import 'package:flutter/material.dart';

class HowWasYourDayWidget extends StatelessWidget {
  const HowWasYourDayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      // height: 110,
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
        children: [
          const Text(
            'How was your day?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage('images/rabbitIcon.png'),
                ),
                SizedBox(
                  width: 16,
                ),
                Image(
                  image: AssetImage('images/rabbitIcon.png'),
                ),
                SizedBox(
                  width: 16,
                ),
                Image(
                  image: AssetImage('images/rabbitIcon.png'),
                ),
                SizedBox(
                  width: 16,
                ),
                Image(
                  image: AssetImage('images/rabbitIcon.png'),
                ),
                SizedBox(
                  width: 16,
                ),
                Image(
                  image: AssetImage('images/rabbitIcon.png'),
                ),
                SizedBox(
                  width: 16,
                ),
                Image(
                  image: AssetImage('images/rabbitIcon.png'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
