import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/common_widgets/custom_app_bar.dart';
import 'package:mood_tracker/common_widgets/spacers.dart';
import 'package:mood_tracker/extension.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/date_picker_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/default_calendar_item_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/disabled_calendar_item_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/event_calendar_item_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/header_face_button_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/today_calendar_item_widget.dart';
import 'package:mood_tracker/features/calendar/providers/calendar_provider.dart';
import 'package:mood_tracker/services/data_base_wrapper.dart';
import 'package:mood_tracker/theme/app_colors.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

// TODO refactor to StatelessWidget
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
    final selectedDate = context.read<CalendarProvider>().selectedDate;
    final formattedTodayDate = context.watch<CalendarProvider>().formattedTodayDate;
    final formattedSelectedDate = context.watch<CalendarProvider>().formattedSelectedDate;
    final primaryColor = context.watch<ThemeProvider>().currentTheme.primaryColor;
    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;
    // TODO rename to notes?
    final events = context.watch<CalendarProvider>().events;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: CustomAppBar(
        leading: const HeaderFaceButtonWidget(),
        title: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            openDateSelector(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                selectedDate != null ? formattedSelectedDate : formattedTodayDate,
                style: s14W600CBlack2,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
              left: 30,
            ),
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
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            // TODO actually SteramBuilder is not needed here. We can refactor it together
            child: StreamBuilder<List<NoteData>>(
                stream: events,
                builder: (context, snapshot) {
                  return TableCalendar(
                    rowHeight: 88,
                    eventLoader: (DateTime date) {
                      // TODO refactor this function and give it understandable name
                      // TODO what is "a"?
                      var a = snapshot.data?.firstWhereOrNull((element) {
                        // TODO name it fully like date1Formatted
                        String dt1Formatted = DateFormat.yMd().format(date);
                        String dt2Formatted = DateFormat.yMd().format(element.date);

                        // TODO give it more understandable name
                        bool compareDates = dt1Formatted == dt2Formatted;

                        return compareDates;
                      });
                      if (a != null) {
                        return [a];
                      } else {
                        return [];
                      }
                    },
                    availableGestures: AvailableGestures.none,
                    firstDay: firstDay,
                    lastDay: todayDate,
                    focusedDay: selectedDate ?? todayDate,
                    calendarFormat: CalendarFormat.month,
                    headerVisible: false,
                    calendarBuilders: _builders(context),
                    calendarStyle: const CalendarStyle(
                      outsideDaysVisible: false,
                    ),
                  );
                  // TODO ,
                }),
          ),
        ],
      ),
    );
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
      markerBuilder: (_, day, events) {
        // TODO refactor and give more understandable names
        if (events.isNotEmpty) {
          var a = events.firstWhereOrNull((element) {
            String dt1Formatted = DateFormat.yMd().format(day);
            String dt2Formatted = DateFormat.yMd().format(element.date);

            bool compareDates = dt1Formatted == dt2Formatted;

            return compareDates;
          });

          String dt1Formatted = DateFormat.yMd().format(day);
          String dt2Formatted = DateFormat.yMd().format(DateTime.now());

          bool compareDates = dt1Formatted == dt2Formatted;

          return compareDates
              ? const SizedBox()
              : EventCalendarItemWidget(
                  note: a,
                  day: day,
                );
        } else if (isSameDay(day, DateTime.now())) {
          return TodayCalendarItemWidget(day: day);
        } else {
          return DefaultCalendarItemWidget(day: day);
        }
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
          builder: (BuildContext context, StateSetter dialogSetState) {
            final primaryColor = context.watch<ThemeProvider>().currentTheme.primaryColor;
            final months = context.read<CalendarProvider>().months;
            final changeMonthDate = context.read<CalendarProvider>().changeMonthDate;
            final years = context.read<CalendarProvider>().years;
            final changeYearDate = context.read<CalendarProvider>().changeYearDate;
            final itemYear = context.watch<CalendarProvider>().itemYear;
            final itemMonth = context.watch<CalendarProvider>().itemMonth;

            return SizedBox(
              // TODO 96 is a magic number, refactor it please
              width: MediaQuery.of(context).size.width - 96,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Choose the date',
                    style: s22W700CBlack,
                  ),
                  const SpaceH32(),
                  Row(
                    children: [
                      DatePickerWidget(
                        dates: months,
                        onDatePicked: changeMonthDate,
                        intInitialItem: itemMonth,
                        selectedIndex: itemMonth,
                      ),
                      DatePickerWidget(
                        dates: years,
                        onDatePicked: changeYearDate,
                        intInitialItem: itemYear,
                        selectedIndex: itemYear,
                      ),
                      const SpaceH20(),
                    ],
                  ),
                  const SpaceH32(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
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
                      ),
                      const SpaceW24(),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.read<CalendarProvider>().pickDate();
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            height: 50,
                            child: const Center(
                              child: Text(
                                'OK',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                  // TODO you have a lot of brackets. Refactor
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
