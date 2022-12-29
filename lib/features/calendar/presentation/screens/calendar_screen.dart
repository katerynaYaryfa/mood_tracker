import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/default_calendar_item_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/disabled_calendar_item_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/header_face_button_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/month_picker_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/today_calendar_item_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/year_picker_widget.dart';
import 'package:mood_tracker/features/calendar/providers/calendar_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  CalendarScreenState createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    final todayDate = context.watch<CalendarProvider>().todayDate;
    final firstDay = context.read<CalendarProvider>().firstDay;
    final formattedTodayDate =
        context.watch<CalendarProvider>().formattedTodayDate;
    final monthYearDate = context.watch<CalendarProvider>().monthYearDate;
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;
    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;
    final numsMonthYearDate =
        context.watch<CalendarProvider>().numsMonthYearDate;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        actions: <Widget>[
          Expanded(
            child: Row(
              children: [
                const SpaceW16(),
                const HeaderFaceButtonWidget(),
                const Spacer(),
                InkWell(
                  onTap: () {
                    openDateSelector(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        monthYearDate.isNotEmpty
                            ? monthYearDate
                            : formattedTodayDate,
                        style: const TextStyle(
                          color: AppColors.black,
                        ),
                      ),
                      SvgPicture.asset(
                        'images/arrowDown.svg',
                        height: 24,
                        width: 24,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'images/share.svg',
                      height: 24,
                      width: 24,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: scaffoldBackgroundColor,
      ),
      body: TableCalendar(
        rowHeight: 88,
        firstDay: firstDay,
        lastDay: todayDate,
        focusedDay: monthYearDate.isNotEmpty
            ? DateTime.parse(numsMonthYearDate)
            : todayDate,
        calendarFormat: CalendarFormat.month,
        headerVisible: false,
        calendarBuilders: _builders(context),
        calendarStyle: CalendarStyle(
            defaultDecoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            outsideDaysVisible: false,
            todayDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor,
              image: const DecorationImage(
                image: ExactAssetImage('images/face5.png'),
                fit: BoxFit.cover,
              ),
            ),
            todayTextStyle: const TextStyle(
              color: AppColors.white,
            )),
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(selectedDay, selectedDay)) {
            setState(() {
              selectedDay = selectedDay;
              focusedDay = focusedDay;
            });
          }
        },
      ),
    );
  }
}

CalendarBuilders _builders(BuildContext context) {
  return CalendarBuilders<dynamic>(
    selectedBuilder: (_, day, __) {
      return DefaultCalendarItemWidget(day: day);
    },
    disabledBuilder: (_, day, __) {
      return DisabledCalendarItemWidget(day: day);
    },
    todayBuilder: (_, day, focusedDay) {
      return TodayCalendarItemWidget(day: day);
    },
    defaultBuilder: (_, day, __) {
      return DefaultCalendarItemWidget(day: day);
    },
  );
}

void openDateSelector(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      insetPadding: EdgeInsets.zero,
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState1) {
          final primaryColor =
              context.watch<ThemeProvider>().currentTheme.primaryColor;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Choose the date',
                style: s22WBoldCBlack,
              ),
              const SpaceH32(),
              Row(
                children: [
                  MonthPickerWidget(
                    setState1: setState1,
                  ),
                  YearPickerWidget(
                    setState1: setState1,
                  ),
                  const SpaceH20(),
                ],
              ),
              const SpaceH32(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 128,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: primaryColor,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SpaceW24(),
                  InkWell(
                    onTap: () {
                      context.read<CalendarProvider>().buttonPressed(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      width: 128,
                      height: 50,
                      child: const Center(
                        child: Text(
                          'OK',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    ),
  );
}