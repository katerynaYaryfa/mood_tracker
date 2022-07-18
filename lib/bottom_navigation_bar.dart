import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 80,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, 80),
            painter: MyCustomPainter(),
          ),
          Center(
            heightFactor: 0.6,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFFF7562).withOpacity(0.3),
                    spreadRadius: 7,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: FloatingActionButton(
                elevation: 0.0,
                onPressed: () {},
                backgroundColor: Color(0xFFFF7562),
                child: SvgPicture.asset('images/Human.svg'),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: 80.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    'images/calendar.svg',
                    color: Color(0xFFD1D4DE),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    'images/list.svg',
                    color: Color(0xFFD1D4DE),
                  ),
                ),
                Container(
                  width: size.width * 0.20,
                ),
                TextButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    'images/chart.svg',
                    color: Color(0xFFD1D4DE),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    'images/settings.svg',
                    color: Color(0xFFD1D4DE),
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

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.0, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawShadow(path, Colors.black, 30, true);
    canvas.drawPath(path, paint);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
