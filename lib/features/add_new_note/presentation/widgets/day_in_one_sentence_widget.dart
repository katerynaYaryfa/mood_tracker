import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/providers/add_new_note_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

const _maxCharacterLength = 2000;

class DayInOneSentenceWidget extends StatefulWidget {
  const DayInOneSentenceWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String? title;

  @override
  State<DayInOneSentenceWidget> createState() => _DayInOneSentenceWidgetState();
}

class _DayInOneSentenceWidgetState extends State<DayInOneSentenceWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.title ?? '',
    );
    test();
  }

  Future<void> test() async {
    final dir = await getApplicationDocumentsDirectory();
    dir.list().forEach((element) {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final noteText = context.watch<NoteProvider>().text;

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
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Describe your day',
            style: s16W700CBlack,
          ),
          const SpaceH16(),
          TextField(
            // controller: noteText?.isNotEmpty
            //     ? TextEditingController(text: title)
            //     : TextEditingController(),
            controller: _controller,
            onChanged: (String text) {
              context.read<NoteProvider>().saveText(text);
            },
            keyboardType: TextInputType.multiline,
            inputFormatters: [
              LengthLimitingTextInputFormatter(_maxCharacterLength),
            ],
            maxLines: 100,
            minLines: 1,
            style: s16WNormalCBlack,
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
