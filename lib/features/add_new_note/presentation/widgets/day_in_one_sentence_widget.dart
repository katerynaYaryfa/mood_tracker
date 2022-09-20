import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';

const _maxCharacterLength = 2000;

class DayInOneSentenceWidget extends StatelessWidget {
  const DayInOneSentenceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFE),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF738C93).withOpacity(0.03),
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
            'Day in one sentence',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SpaceH16(),
          TextField(
            keyboardType: TextInputType.multiline,
            inputFormatters: [
              LengthLimitingTextInputFormatter(_maxCharacterLength),
            ],
            maxLines: 100,
            minLines: 1,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
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
              fillColor: Color(0xFFF6FAFB),
              labelText: 'Enter your thoughts',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelStyle: TextStyle(
                color: Color(0xFFD1D4DE),
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
