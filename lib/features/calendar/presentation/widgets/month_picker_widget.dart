import 'package:flutter/cupertino.dart';
import 'package:mood_tracker/features/calendar/providers/calendar_provider.dart';
import 'package:provider/provider.dart';

class MonthPickerWidget extends StatelessWidget {
  const MonthPickerWidget({
    required this.setState1,
    Key? key,
  }) : super(key: key);

  final StateSetter setState1;

  @override
  Widget build(BuildContext context) {
    final monthList = context.watch<CalendarProvider>().months;

    int monthIndex1 = 0;

    return Expanded(
      child: SizedBox(
        height: 100,
        child: CupertinoPicker(
          selectionOverlay: const SizedBox(),
          itemExtent: 48,
          onSelectedItemChanged: (index) {
            context.read<CalendarProvider>().changeMonthDate(index);
            monthIndex1 = index;
            setState1(() {});
          },
          children: List<Widget>.generate(
            monthList.length,
            (int index) {
              /// TODO: не выделяется жирным выбранный месяц
              final isSelected = monthIndex1 == index;
              final weight = isSelected ? FontWeight.bold : FontWeight.normal;

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
    );
  }
}
