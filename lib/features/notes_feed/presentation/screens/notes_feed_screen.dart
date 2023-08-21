import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mood_tracker/common/consts/svg_icons.dart';
import 'package:mood_tracker/common/widgets/custom_app_bar.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/cancel_button_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/date_picker_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/ok_button_widget.dart';
import 'package:mood_tracker/features/notes_feed/presentation/widgets/note_feed_widget.dart';
import 'package:mood_tracker/features/notes_feed/providers/notes_feed_provider.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class NotesFeedScreen extends StatelessWidget {
  const NotesFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notesList = context.watch<NotesFeedProvider>().notesList;
    final reversedList = notesList.reversed.toList();
    final formattedTodayDate =
        context.watch<NotesFeedProvider>().formattedTodayDate;
    final formattedSelectedDate =
        context.watch<NotesFeedProvider>().formattedSelectedDate;
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;
    final selectedDate = context.read<NotesFeedProvider>().selectedDate;

    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Container(width: 70),
        ],
        title: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            openDateSelector(context);
            context.read<NotesFeedProvider>().selectDate();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                selectedDate != null
                    ? formattedSelectedDate
                    : formattedTodayDate,
                style: TextStyles.s14W600CBlack2,
              ),
              SvgPicture.asset(
                SvgIcons.arrowDown,
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
        leading: const SizedBox(),
      ),
      body: ListView.builder(
        itemCount: notesList.length,
        itemBuilder: (context, index) {
          return NoteFeedWidget(
            date: reversedList[index].date,
            mood: reversedList[index].mood,
            text: reversedList[index].text,
            images: reversedList[index].images,
          );
        },
      ),
    );
  }

  void openDateSelector(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          child: StatefulBuilder(
            builder: (context, dialogSetState) {
              final primaryColor =
                  context.watch<ThemeProvider>().currentTheme.primaryColor;
              final months = context.read<NotesFeedProvider>().months;
              final changeMonthDate =
                  context.read<NotesFeedProvider>().changeMonthDate;
              final years = context.read<NotesFeedProvider>().years;
              final changeYearDate =
                  context.read<NotesFeedProvider>().changeYearDate;
              final itemYear = context.watch<NotesFeedProvider>().chosenYear;
              final itemMonth = context.watch<NotesFeedProvider>().chosenMonth;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SpaceH24(),
                  const Text(
                    'Choose the date',
                    style: TextStyles.s22W700CBlack,
                  ),
                  const SpaceH32(),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      DatePickerWidget(
                        dates: months,
                        onDatePicked: changeMonthDate,
                        intInitialItem: itemMonth,
                        selectedIndex: itemMonth,
                      ),
                      const SpaceW16(),
                      DatePickerWidget(
                        dates: years,
                        onDatePicked: changeYearDate,
                        intInitialItem: itemYear,
                        selectedIndex: itemYear,
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SpaceH32(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SpaceW24(),
                      CancelButton(primaryColor: primaryColor),
                      const SpaceW24(),
                      OkButton(primaryColor: primaryColor),
                      const SpaceW24(),
                    ],
                  ),
                  const SpaceH24(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
