import 'package:flutter/material.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/custom_app_bar.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';

class SelectCategoriesScreen extends StatefulWidget {
  const SelectCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<SelectCategoriesScreen> createState() => _SelectCategoriesScreenState();
}

class _SelectCategoriesScreenState extends State<SelectCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: CustomAppBar(
          title: const Text(
            'Select categories',
            style: s14W600CBlack2,
          ),
        ),
      ),
    );
  }
}
