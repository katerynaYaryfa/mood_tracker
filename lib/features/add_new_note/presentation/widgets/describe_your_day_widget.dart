import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

const _maxCharacterLength = 2000;

class DescribeYourDayWidget extends StatefulWidget {
  const DescribeYourDayWidget({Key? key}) : super(key: key);

  @override
  State<DescribeYourDayWidget> createState() => _DescribeYourDayWidgetState();
}

class _DescribeYourDayWidgetState extends State<DescribeYourDayWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    final text = context.read<NoteProvider>().text;
    _controller = TextEditingController(text: text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyOpacity.withOpacity(0.03),
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Describe your day',
            style: TextStyles.s16W700CBlack,
          ),
          const SpaceH16(),
          TextField(
            controller: _controller,
            onChanged: (text) {
              context.read<NoteProvider>().saveText(text);
            },
            keyboardType: TextInputType.multiline,
            inputFormatters: [
              LengthLimitingTextInputFormatter(_maxCharacterLength),
            ],
            maxLines: 100,
            minLines: 1,
            style: TextStyles.s16WNormalCBlack,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(
                top: 10,
                bottom: 12,
                left: 16,
                right: 16,
              ),
              isDense: true,
              filled: true,
              isCollapsed: true,
              fillColor: AppColors.scaffoldBackgroundColor,
              labelText: 'Enter your thoughts',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelStyle: TextStyle(
                color: AppColors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
