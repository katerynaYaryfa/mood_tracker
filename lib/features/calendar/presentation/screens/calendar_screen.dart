import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mood_tracker/common/consts/svg_icons.dart';
import 'package:mood_tracker/common/extensions/iterable_extensions.dart';
import 'package:mood_tracker/common/widgets/custom_app_bar.dart';
import 'package:mood_tracker/common/widgets/spacers.dart';
import 'package:mood_tracker/features/add_new_note/models/note_model.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/cancel_button_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/date_picker_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/default_calendar_item_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/disabled_calendar_item_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/event_calendar_item_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/header_face_button_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/ok_button_widget.dart';
import 'package:mood_tracker/features/calendar/presentation/widgets/today_calendar_item_widget.dart';
import 'package:mood_tracker/features/calendar/providers/calendar_provider.dart';
import 'package:mood_tracker/theme/app_text_styles.dart';
import 'package:mood_tracker/theme/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todayDate = context.watch<CalendarProvider>().todayDate;
    final lastDay = context.watch<CalendarProvider>().lastDay;
    final firstDay = context.read<CalendarProvider>().firstDay;
    final selectedDate = context.read<CalendarProvider>().selectedDate;
    final formattedTodayDate =
        context.watch<CalendarProvider>().formattedTodayDate;
    final formattedSelectedDate =
        context.watch<CalendarProvider>().formattedSelectedDate;
    final primaryColor =
        context.watch<ThemeProvider>().currentTheme.primaryColor;
    final scaffoldBackgroundColor =
        context.watch<ThemeProvider>().currentTheme.scaffoldBackgroundColor;
    final notes = context.watch<CalendarProvider>().notes;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        appBar: CustomAppBar(
          leading: const HeaderFaceButtonWidget(),
          title: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              openDateSelector(context);
              context.read<CalendarProvider>().selectDate();
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
          actions: [
            Container(
              width: 70,
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: TableCalendar(
                rowHeight: 88,
                startingDayOfWeek: StartingDayOfWeek.monday,
                eventLoader: (date) {
                  return _getNotesFor(
                    month: date,
                    notes: notes,
                  );
                },
                availableGestures: AvailableGestures.none,
                firstDay: firstDay,
                lastDay: lastDay,
                focusedDay: selectedDate ?? todayDate,
                headerVisible: false,
                calendarBuilders: _builders(context),
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                ),
              ),
            ),
          ],
        ),
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
              final months = context.read<CalendarProvider>().months;
              final changeMonthDate =
                  context.read<CalendarProvider>().changeMonthDate;
              final years = context.read<CalendarProvider>().years;
              final changeYearDate =
                  context.read<CalendarProvider>().changeYearDate;
              final itemYear = context.watch<CalendarProvider>().chosenYear;
              final itemMonth = context.watch<CalendarProvider>().chosenMonth;

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

  List<NoteModel> _getNotesFor({
    required DateTime month,
    required List<NoteModel>? notes,
  }) {
    final note = notes?.firstWhereOrNull((element) {
      final dayDate = DateFormat.yMd().format(month);
      final noteDay = DateFormat.yMd().format(element.date);

      final isNoteVisible = dayDate == noteDay;

      return isNoteVisible;
    });

    return note != null ? [note] : [];
  }

  CalendarBuilders _builders(BuildContext context) {
    return CalendarBuilders<dynamic>(
      disabledBuilder: (_, day, __) {
        return DisabledCalendarItemWidget(day: day);
      },
      todayBuilder: (_, day, focusedDay) {
        return TodayCalendarItemWidget(
          day: day,
        );
      },
      markerBuilder: (_, day, events) {
        if (events.isNotEmpty && events is List<NoteModel>) {
          final event = events.firstWhereOrNull((element) {
            final dt1Formatted = DateFormat.yMd().format(day);
            final dt2Formatted = DateFormat.yMd().format(element.date);

            final compareDates = dt1Formatted == dt2Formatted;

            return compareDates;
          });

          if (isSameDay(day, DateTime.now())) {
            return TodayCalendarItemWidget(day: day, note: event);
          }

          final dt1Formatted = DateFormat.yMd().format(day);
          final dt2Formatted = DateFormat.yMd().format(DateTime.now());

          final compareDates = dt1Formatted == dt2Formatted;

          return compareDates
              ? const SizedBox()
              : EventCalendarItemWidget(
                  note: event,
                  day: day,
                );
        } else if (day.isAfter(DateTime.now())) {
          return DisabledCalendarItemWidget(day: day);
        } else {
          if (isSameDay(day, DateTime.now())) {
            return const SizedBox();
          }
          return DefaultCalendarItemWidget(day: day);
        }
      },
    );
  }
}

bool isSameDay(DateTime day1, DateTime day2) {
  return day1.year == day2.year &&
      day1.month == day2.month &&
      day1.day == day2.day;
}
