import 'package:flutter/material.dart';

class SelectCategoriesScreen extends StatefulWidget {
  const SelectCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<SelectCategoriesScreen> createState() => _SelectCategoriesScreenState();
}

class _SelectCategoriesScreenState extends State<SelectCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xFFD1D4DE),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Select categories',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFF6FAFB),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
    );
  }
}
