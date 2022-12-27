import 'package:flutter/cupertino.dart';
import 'package:mood_tracker/features/calendar/providers/calendar_provider.dart';
import 'package:provider/provider.dart';

class YearPickerWidget extends StatelessWidget {
  const YearPickerWidget({
    required this.setState1,
    Key? key,
  }) : super(key: key);

  final StateSetter setState1;

  @override
  Widget build(BuildContext context) {
    final years = context.watch<CalendarProvider>().years;

    int yearIndex1 = 0;

    return Expanded(
      child: SizedBox(
        height: 100,
        child: CupertinoPicker(
          scrollController: FixedExtentScrollController(initialItem: 0),
          selectionOverlay: const SizedBox(),
          itemExtent: 48,
          onSelectedItemChanged: (index) {
            context.read<CalendarProvider>().changeYearDate(index);

            yearIndex1 = index;
            setState1(() {});
          },
          children: List<Widget>.generate(years.length, (int index) {
            /// TODO: не выделяется жирным выбранный год
            final isSelected = yearIndex1 == index;
            final weight = isSelected ? FontWeight.bold : FontWeight.normal;

            return Center(
              child: Text(
                years[index],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: weight,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
