import 'package:flutter/material.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/presentation/screens/add_new_note_screen.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:mood_tracker/theme/themes.dart';
import 'package:provider/provider.dart';

class DefaultCalendarItemWidget extends StatelessWidget {
  const DefaultCalendarItemWidget({
    Key? key,
    required this.day,
  }) : super(key: key);

  final DateTime day;

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.watch<ThemeProvider>().currentTheme;
    return GestureDetector(
      onTap: () {
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddNewNoteScreen(
                  date: day,
                );
              },
            ),
          );
        }
      },
      child: SizedBox(
        height: 70,
        width: 40,
        child: Column(
          children: [
            Text(
              '${day.day}',
              style: TextStyles.s12WBoldCGrey2,
            ),
            const SpaceH4(),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.greyWhite2,
              ),
              child: Image(
                height: 34,
                width: 34,
                image: currentTheme == mainTheme
                    ? const AssetImage(
                        'images/eyes.png',
                      )
                    : const AssetImage(
                        'images/eyesGreenTheme.png',
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
