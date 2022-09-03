import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF6FAFB),
      body: CustomNavigationBar(
        size: size,
      ),
    );
  }
}
