import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/day_decorate_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/next_day_decorate_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/today_decorate_widget.dart';
import 'package:mood_tracker/features/calendar/providers/calendar_provider.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  int monthIndex1 = 0;
  int yearIndex1 = 0;

  CalendarBuilders builders(BuildContext context) {
    return CalendarBuilders<dynamic>(
      selectedBuilder: (_, day, __) {
        return DayDecorate(day: day);
      },
      disabledBuilder: (_, day, __) {
        return NextDayDecorate(day: day);
      },
      todayBuilder: (_, day, focusedDay) {
        return TodayDecorate(context: context, day: day);
      },
      defaultBuilder: (_, day, __) {
        return DayDecorate(day: day);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<CalendarProvider>().year();
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateNow = DateTime.now();

    String formattedDate = DateFormat.yMMMM().format(dateNow);
    DateTime firstDay = DateTime.utc(2020, 3, 14);
    DateTime lastDay = DateTime.now();

    final controller = context.watch<CalendarProvider>().controller;
    String monthYearDate = context.watch<CalendarProvider>().monthYearDate;
    final yearList = context.watch<CalendarProvider>().yearList;
    final selectedDay = context.watch<CalendarProvider>().selectedDay;
    final monthList = context.watch<CalendarProvider>().monthList;

    return Screenshot(
      controller: controller,
      child: Scaffold(
        backgroundColor:
            context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor,
        appBar: AppBar(
          actions: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    height: 40,
                    width: 54,
                    decoration: BoxDecoration(
                      color: AppColors.greyWhite2,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Image(
                        height: 24,
                        width: 22,
                        image: AssetImage(
                          'images/face1.png',
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                          ),
                          insetPadding: const EdgeInsets.all(2),
                          // contentPadding: EdgeInsets.all(60),
                          content: StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState1) {
                              var height = MediaQuery.of(context).size.height;
                              var width = MediaQuery.of(context).size.width;

                              return SizedBox(
                                width: width - 80,
                                height: height - 550,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Choose the date',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                    const SpaceH32(),
                                    Row(
                                      children: [
                                        const SpaceH20(),
                                        Expanded(
                                          child: SizedBox(
                                            height: 100,
                                            child: CupertinoPicker(
                                              selectionOverlay:
                                                  const SizedBox(),
                                              itemExtent: 48,
                                              // magnification: 1.5,
                                              onSelectedItemChanged: (index) {
                                                context
                                                    .read<CalendarProvider>()
                                                    .changeMonthDate(index);
                                                monthIndex1 = index;
                                                setState1(() {});
                                              },
                                              children: List<Widget>.generate(
                                                monthList.length,
                                                (int index) {
                                                  final isSelected =
                                                      monthIndex1 == index;
                                                  final weight = isSelected
                                                      ? FontWeight.bold
                                                      : FontWeight.normal;

                                                  return Center(
                                                    child: Text(
                                                      monthList[index],
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: weight,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: 100,
                                            child: CupertinoPicker(
                                              scrollController:
                                                  FixedExtentScrollController(
                                                      initialItem: 0),
                                              selectionOverlay:
                                                  const SizedBox(),
                                              itemExtent: 48,
                                              onSelectedItemChanged: (index) {
                                                context
                                                    .read<CalendarProvider>()
                                                    .changeYearDate(index);

                                                yearIndex1 = index;
                                                setState1(() {});
                                              },
                                              children: List<Widget>.generate(
                                                  yearList.length, (int index) {
                                                final isSelected =
                                                    yearIndex1 == index;
                                                final weight = isSelected
                                                    ? FontWeight.bold
                                                    : FontWeight.normal;

                                                return Center(
                                                  child: Text(
                                                    yearList[index],
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: weight,
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                        ),
                                        const SpaceH20(),
                                      ],
                                    ),
                                    const SpaceH32(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 128,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: context
                                                  .watch<ThemeProvider>()
                                                  .currentTheme
                                                  .primaryColor,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
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
                                                  color: context
                                                      .watch<ThemeProvider>()
                                                      .currentTheme
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SpaceW24(),
                                        InkWell(
                                          onTap: () {
                                            context
                                                .read<CalendarProvider>()
                                                .buttonPressed(context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: context
                                                  .watch<ThemeProvider>()
                                                  .currentTheme
                                                  .primaryColor,
                                              borderRadius:
                                                  const BorderRadius.all(
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
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          monthYearDate.isNotEmpty
                              ? monthYearDate
                              : formattedDate,
                          style: const TextStyle(
                            color: AppColors.black,
                          ),
                        ),
                        SvgPicture.asset(
                          'images/arrowDown.svg',
                          height: 24,
                          width: 24,
                          color: context
                              .watch<ThemeProvider>()
                              .currentTheme
                              .primaryColor,
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
          backgroundColor: context
              .watch<ThemeProvider>()
              .currentTheme
              .scaffoldBackgroundColor,
        ),
        body: TableCalendar(
          rowHeight: 88,
          firstDay: firstDay,
          lastDay: lastDay,
          focusedDay: dateNow,
          calendarFormat: CalendarFormat.month,
          headerVisible: false,
          calendarBuilders: builders(context),
          calendarStyle: CalendarStyle(
              defaultDecoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              outsideDaysVisible: false,
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.watch<ThemeProvider>().currentTheme.primaryColor,
                image: const DecorationImage(
                  image: ExactAssetImage('images/face5.png'),
                  fit: BoxFit.cover,
                ),
              ),
              todayTextStyle: const TextStyle(
                color: AppColors.white,
              )),
          selectedDayPredicate: (day) {
            return isSameDay(selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(selectedDay, selectedDay)) {
              setState(() {
                selectedDay = selectedDay;
                focusedDay = focusedDay;
              });
            }
          },
        ),
      ),
    );
  }
}
