import 'package:flutter/cupertino.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    // required this.dialogSetState,
    required this.dates,
    required this.onDatePicked,
    Key? key,
  }) : super(key: key);

  // final StateSetter dialogSetState;
  final List<String> dates;
  final void Function(int) onDatePicked;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: CupertinoPicker(
          selectionOverlay: const SizedBox(),
          itemExtent: 48,
          onSelectedItemChanged: (index) {
            widget.onDatePicked(index);
            setState(() {
              selectedIndex = index;
            });
          },
          children: List<Widget>.generate(
            widget.dates.length,
            (int index) {
              final isSelected = selectedIndex == index;
              final weight = isSelected ? FontWeight.bold : FontWeight.normal;

              return Center(
                child: Text(
                  widget.dates[index],
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
