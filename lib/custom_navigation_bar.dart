import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/features/add_new_note/presentation/screens/add_new_note_screen.dart';
import 'package:mood_tracker/features/settings_screen/settings_screen.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

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
    return Scaffold(
      body: _widgetOptions[selectedIndex],
      floatingActionButton: Container(
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
        child: FloatingActionButton(
          elevation: 0.0,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddNewNoteScreen(),
              ),
            );
          },
          backgroundColor: const Color(0xFFFF7562),
          child: SvgPicture.asset('images/Human.svg'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 100,
        shape: const CircularNotchedRectangle(),
        notchMargin: 16,
        child: SizedBox(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  _onItemTapped(0);
                },
                child: SvgPicture.asset(
                  'images/calender.svg',
                  color: selectedIndex == 0
                      ? Colors.redAccent
                      : const Color(0xFFD1D4DE),
                ),
              ),
              InkWell(
                onTap: () {
                  _onItemTapped(1);
                },
                child: SvgPicture.asset(
                  'images/server.svg',
                  color: selectedIndex == 1
                      ? Colors.redAccent
                      : const Color(0xFFD1D4DE),
                ),
              ),
              const SizedBox(
                width: 80,
              ),
              InkWell(
                onTap: () {
                  _onItemTapped(2);
                },
                child: SvgPicture.asset(
                  'images/barGraph.svg',
                  color: selectedIndex == 2
                      ? Colors.redAccent
                      : const Color(0xFFD1D4DE),
                ),
              ),
              InkWell(
                onTap: () {
                  _onItemTapped(3);
                },
                child: SvgPicture.asset(
                  'images/settings.svg',
                  color: selectedIndex == 3
                      ? Colors.redAccent
                      : const Color(0xFFD1D4DE),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
