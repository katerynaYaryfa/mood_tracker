import 'package:flutter/material.dart';

class LeftTitlesChartWidget extends StatelessWidget {
  const LeftTitlesChartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Column(
        children: [
          const Image(
            height: 20,
            width: 20,
            image: AssetImage(
              'images/face2.png',
            ),
          ),
          Expanded(child: Container()),
          const Image(
            height: 20,
            width: 20,
            image: AssetImage(
              'images/face3.png',
            ),
          ),
          Expanded(child: Container()),
          const Image(
            height: 20,
            width: 20,
            image: AssetImage(
              'images/face1.png',
            ),
          ),
          Expanded(child: Container()),
          const Image(
            height: 20,
            width: 20,
            image: AssetImage(
              'images/face4.png',
            ),
          ),
          Expanded(child: Container()),
          const Image(
            height: 20,
            width: 20,
            image: AssetImage(
              'images/face5.png',
            ),
          ),
          Expanded(child: Container()),
          const Image(
            height: 20,
            width: 20,
            image: AssetImage(
              'images/face6.png',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
