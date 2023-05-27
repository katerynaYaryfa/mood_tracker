import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/custom_app_bar.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';

class SelectCategoriesScreen extends StatefulWidget {
  const SelectCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<SelectCategoriesScreen> createState() => _SelectCategoriesScreenState();
}

class _SelectCategoriesScreenState extends State<SelectCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Select categories',
          style: TextStyles.s14W600CBlack2,
        ),
      ),
    );
  }
}
