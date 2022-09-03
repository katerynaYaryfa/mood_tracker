import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/new_note_screen/add_new_note_screen.dart';
import 'package:mood_tracker/settings_screen/settings_screen.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Calendar',
      style: optionStyle,
    ),
    Text(
      'Index 1: Server',
      style: optionStyle,
    ),
    Text(
      'Index 2: BarGraph',
      style: optionStyle,
    ),
    SettingsScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: _widgetOptions[selectedIndex],
          ),
        ),
        Container(
          width: widget.size.width,
          height: 80,
          child: Stack(
            children: [
              CustomPaint(
                size: Size(widget.size.width, 80),
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
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddNewNoteScreen(),
                        ),
                      );
                    },
                    backgroundColor: Color(0xFFFF7562),
                    child: SvgPicture.asset('images/Human.svg'),
                  ),
                ),
              ),
              Container(
                width: widget.size.width,
                height: 80.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        _onItemTapped(0);
                      },
                      child: SvgPicture.asset(
                        'images/calender.svg',
                        color: selectedIndex == 0
                            ? Colors.redAccent
                            : Color(0xFFD1D4DE),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _onItemTapped(1);
                      },
                      child: SvgPicture.asset(
                        'images/server.svg',
                        color: selectedIndex == 1
                            ? Colors.redAccent
                            : Color(0xFFD1D4DE),
                      ),
                    ),
                    Container(
                      width: widget.size.width * 0.20,
                    ),
                    TextButton(
                      onPressed: () {
                        _onItemTapped(2);
                      },
                      child: SvgPicture.asset(
                        'images/barGraph.svg',
                        color: selectedIndex == 2
                            ? Colors.redAccent
                            : Color(0xFFD1D4DE),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _onItemTapped(3);
                      },
                      child: SvgPicture.asset(
                        'images/settings.svg',
                        color: selectedIndex == 3
                            ? Colors.redAccent
                            : Color(0xFFD1D4DE),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
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
